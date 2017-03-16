#!/usr/bin/python3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(html*
;  (!DOCTYPE html)
;  (html :lang 'en 
;    (head (title "Page title"))
;    (body
;      (!-- " Body part starts from here... ")
;      (div :class "main-container"
;         (h1 ~(.upper "Page content"))
;         (table (tr (for-each [i [1 2 3]] `(td ~i))))))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(import (hytml.specs (specs)))

(eval-and-compile

  (defn tag? [tag] (in (keyword tag) specs))

  (defn tag-specs [tag] (get specs (keyword tag)))

  (defn omit? [tag] (get (tag-specs tag) :omit))

  (defn forbidden? [tag] (get (tag-specs tag) :forbidden))
  
  ; main parser loop
  ; get-content function calls back here so that recursive
  ; generating becomes possible
  (defn parse-html [code]
    (if (coll? code)
      (do
        (setv tag (catch-tag (first code)))
        ; note: hy transforms - to _
        (if ; comment tag <!-- -->
            ; can be written as a plain text also
            (= tag "!__")
            (+ "<!--" (tag-content (get-content (list (drop 1 code)))) "-->")
            ; doctype codeblock: <!DOCTYPE html> -> maybe just (doctype html)?
            (= tag "!DOCTYPE")
            (+ "<!DOCTYPE " (tag-content (get-content (list (drop 1 code)))) ">")
            ; unquoting code. this means that one can change from html* macro mode
            ; to the normal lisp evaluation mode
            (= tag "unquote") (str (eval (second code)))
            ; ~@ is used to concat lists. parse-html function is called recursively 
            ; to evaluate the content
            (= tag "unquote_splice") 
            (.join "" (map parse-html (eval (second code))))
            ; special for-each loop. ~@ list compression could be used in place of this
            ; but for-each syntax may please more. for-each doesn't require using 
            ; unquote splice combo syntax
            (= tag "for_each") (eval code)
            ; normal tag, attribute, and content processing
            (do
              (setv content-code (list (drop 1 code)))
              (setv content (get-content content-code))
              ; empty content will give a short tag
              (+ (tag-start tag (get-attributes content-code) (empty? content))
                 (if-not (empty? content) (tag-content content) "")
                 (tag-end tag)))))
      ; return code as a string because html is practically just a stream of text
      (str code)))
  
  ; create a tag from the first item of the expression
  ; first try to evaluate code, because there might be
  ; a calculated expression for the tag name, naive examples:
  ; "td" or (+ "t" "d") -> td
  ; but in case symbol td is used, it will raise a name errors
  ; which will cause that string representation of the symbol is
  ; returned on the except part
  (defn catch-tag [code]
    (try
      ; catch "'name' is not defined" errors
      (str (eval code))
      (except (e Exception)
        (eval 'code))))
  
  ; transforms [(key value)] list to xml attribute list:
  ; key="value". both key and value part will be evaluated
  ; so that calculated expressions can be used for them
  ; NOTE: do to get-attributes behaviour key doesn't really support
  ; calculated expressions. but for value naive example is:
  ; (if (even? ~i) "even" "odd")
  (defn concat-attributes [attr]
    (if-not (empty? attr)
       (+ " " (.join " " 
         (list-comp (+ (str (eval 'key)) "=" "\"" (str (eval value)) "\"") 
                    [[key value] attr])))
        ""))

  (defn concat-content [content]
    (.join "" (map str content)))
  
  (defn tag-content [content]
    (if-not (none? content)
            (concat-content content)
             ""))
 
  ;(defn tag-start [name attr]
  ;  (+ "<" name (concat-attributes attr) ">"))

  (defn tag-start [name attr &optional [short False] [omit False]]
    (+ "<" name (concat-attributes attr) (if (and short (not omit)) "\\>" ">")))

  (defn tag-end [name] (+ "</" name ">"))
 
  ; TODO: get-attributes and get-content could be combined to same function?
  
  ; get attributes from argument set.
  ; every other item could be a key and value. for example
  ; "content" :key value "more content" :key2 value2
  ; returns [(, key value) (, key2 value2)]
  (defn get-attributes [code]
    (setv attributes [] key None)
    (for [item code]
         (do
           (if-not (none? key)
                   (.append attributes 
                   (, (.join "" (drop 2 key)) item)))
           ; if item is keyword, take it to the temp key
           ; else set tmp key to none
           (if (keyword? item)
               (setv key item)
               (setv key None))))
     attributes)
  
  ; get content from argument set.
  ; every other item could be a key and value. for example
  ; "content" :key value "more content" :key2 value2
  ; in this case only content is returned:
  ; ["content" "more content"]
  (defn get-content [code]
    (setv contents [] key None)
    (for [item code]
         (do 
           (if (and (none? key) (not (keyword? item))) 
               (.append contents (if (coll? item) (parse-html item) item)))
           (if (keyword? item)
               (setv key item)
               (setv key None))))
     contents))

; shorthand for parsing tags. note that
; html* will accepot multiple expressions, not just
; an expression with single root node
(defreader @ [code] (parse-html code))

; html* is xml* because it will accept any tags, 
; not just html4 or html5 tags
(defmacro html* [&rest code]
  (.join "" (map parse-html code)))

; strict set of html tag generator for html4
(defmacro html4 [&rest code] "Not implemented.")

; strict set of html tag generator for html5
(defmacro html5 [&rest code] "Not implemented.")

(defmacro for-each [args code]
  `(eval `(html* ~@(list-comp ~code ~args))))

; a small blemish is that ` needs to be prefixed for ("td" ~i)
; ideal would be that instead of `("td" ~i)
; for ~i it is acceptable because we could want to pass i as a string
; or ~i as an evaluated variable, which is in this case
; maybe it is same with quasiquote too...
;(for-each* [i (range 3)] `(td ~i))
(defmacro for-each* [args code]
  ; `(for-html ~args `~code) -> not working, how to pass argument as quoted
  `(for-each ~args ~code))
