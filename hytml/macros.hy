#!/usr/bin/python3

(eval-and-compile

  (defn parse-html [code]
    (if (coll? code)
      (do
        (setv tag (catch-tag (first code)))
        (+ ; can have attributes, omit end tag, closing /?
           (tag-start tag (get-attributes (list (drop 1 code))))
           ; TODO: can have content?
           (tag-content (get-content (list (drop 1 code))))
           ; has endtag
           (tag-end tag)))
      code))
   
  (defn catch-tag [code]
    (try
      ; catch "'name' is not defined" errors
      ;(str (eval 'code))
      (eval 'code)
      (except (e Exception)
        (str (eval 'code)))))
   
   (defn concat-attributes [attr]
     (if-not (empty? attr)
        (+ " " (.join " " 
          (list-comp (+ (str (eval 'key)) "=" "\"" (str (eval value)) "\"") 
                     [[key value] attr])))
        ""))
   
   (defn tag-content [content]
     (if-not (none? content)
        (.join "" content) ""))
 
   (defn tag-start [name attr]
     (+ "<" name (concat-attributes attr) ">"))

   (defn tag-end [name] (+ "</" name ">"))
 
   (defn get-attributes [code]
     (setv attributes [] key None)
     (for [item code]
          (do 
            (if-not (none? key)
                    (.append attributes 
                    (, (.join "" (drop 2 key)) item)))
            (if (keyword? item)
                (setv key item)
                (setv key None))))
      attributes)
 
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

(defreader @ [code] (parse-html code))

(defmacro html* [&rest code]
  (.join "" (map parse-html code)))
