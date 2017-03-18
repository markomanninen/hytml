#!/usr/bin/python3

;https://www.w3schools.com/TAGs/default.asp
;http://www.w3.org/TR/html401/index/elements.html
;http://www.w3.org/TR/html5/syntax.html#optional-tags

(setv specs4 {
  :a {:title "Anchor" :forbidden False :omit False}
  :abbr {:title "Abbreviation" :forbidden False :omit False}
  :acronym {:title "Acronym" :forbidden False :omit False}
  :address {:title "Address" :forbidden False :omit False}
  :applet {:title "Java applet" :forbidden False :omit False}
  :area {:title "Image map region" :forbidden True :omit False}
  :b {:title "Bold text" :forbidden False :omit False}
  :base {:title "Document base URI" :forbidden True :omit False}
  :basefont {:title "Base font change" :forbidden True :omit False}
  :bdo {:title "BiDi override" :forbidden False :omit False}
  :big {:title "Large text" :forbidden False :omit False}
  :blockquote {:title "Block quotation" :forbidden False :omit False}
  :body {:title "Document body" :forbidden False :omit False}
  :br {:title "Line break" :forbidden True :omit False}
  :button {:title "Button" :forbidden False :omit False}
  :caption {:title "Table caption" :forbidden False :omit False}
  :center {:title "Centered block" :forbidden False :omit False}
  :cite {:title "Citation" :forbidden False :omit False}
  :code {:title "Computer code" :forbidden False :omit False}
  :col {:title "Table column" :forbidden True :omit True}
  :colgroup {:title "Table column group" :forbidden False :omit False}
  :dd {:title "Definition description" :forbidden False :omit False}
  :del {:title "Deleted text" :forbidden False :omit False}
  :dfn {:title "Defined term" :forbidden False :omit False}
  :dir {:title "Directory list" :forbidden False :omit False}
  :div {:title "Generic block-level container" :forbidden False :omit False}
  :dl {:title "Definition list" :forbidden False :omit False}
  :dt {:title "Definition term" :forbidden False :omit False}
  :em {:title "Emphasis" :forbidden False :omit False}
  :fieldset {:title "Form control group" :forbidden False :omit False}
  :font {:title "Font change" :forbidden False :omit False}
  :form {:title "Interactive form" :forbidden False :omit False}
  :frame {:title "Frame" :forbidden True :omit False}
  :frameset {:title "Frameset" :forbidden False :omit False}
  :h1 {:title "Level-one heading" :forbidden False :omit False}
  :h2 {:title "Level-two heading" :forbidden False :omit False}
  :h3 {:title "Level-three heading" :forbidden False :omit False}
  :h4 {:title "Level-four heading" :forbidden False :omit False}
  :h5 {:title "Level-five heading" :forbidden False :omit False}
  :h6 {:title "Level-six heading" :forbidden False :omit False}
  :head {:title "Document head" :forbidden False :omit False}
  :hr {:title "Horizontal rule" :forbidden True :omit False}
  :html {:title "HTML document" :forbidden False :omit False}
  :i {:title "Italic text" :forbidden False :omit False}
  :iframe {:title "Inline frame" :forbidden False :omit False}
  :img {:title "Inline image" :forbidden True :omit False}
  :input {:title "Form input" :forbidden True :omit False}
  :ins {:title "Inserted text" :forbidden False :omit False}
  :isindex {:title "Input prompt" :forbidden True :omit False}
  :kbd {:title "Text to be input" :forbidden False :omit False}
  :label {:title "Form field label" :forbidden False :omit False}
  :legend {:title "Fieldset caption" :forbidden False :omit False}
  :li {:title "List item" :forbidden False :omit False}
  :link {:title "Document relationship" :forbidden True :omit False}
  :map {:title "Image map" :forbidden False :omit False}
  :menu {:title "Menu list" :forbidden False :omit False}
  :meta {:title "Metadata" :forbidden True :omit False}
  :noframes {:title "Frames alternate content" :forbidden False :omit False}
  :noscript {:title "Alternate script content" :forbidden False :omit False}
  :object {:title "Object" :forbidden False :omit False}
  :ol {:title "Ordered list" :forbidden False :omit False}
  :optgroup {:title "Option group" :forbidden False :omit False}
  :option {:title "Menu option" :forbidden False :omit False}
  :p {:title "Paragraph" :forbidden False :omit False}
  :param {:title "Object parameter" :forbidden True :omit False}
  :pre {:title "Preformatted text" :forbidden False :omit False}
  :q {:title "Short quotation" :forbidden False :omit False}
  :s {:title "Strike-through text" :forbidden False :omit False}
  :samp {:title "Sample output" :forbidden False :omit False}
  :script {:title "Client-side script" :forbidden False :omit False}
  :select {:title "Option selector" :forbidden False :omit False}
  :small {:title "Small text" :forbidden False :omit False}
  :span {:title "Generic inline container" :forbidden False :omit False}
  :strike {:title "Strike-through text" :forbidden False :omit False}
  :strong {:title "Strong emphasis" :forbidden False :omit False}
  :style {:title "Embedded style sheet" :forbidden False :omit False}
  :sub {:title "Subscript" :forbidden False :omit False}
  :sup {:title "Superscript" :forbidden False :omit False}
  :table {:title "Table" :forbidden False :omit False}
  :tbody {:title "Table body" :forbidden False :omit False}
  :td {:title "Table data cell" :forbidden False :omit False}
  :textarea {:title "Multi-line text input" :forbidden False :omit False}
  :tfoot {:title "Table foot" :forbidden False :omit False}
  :th {:title "Table header cell" :forbidden False :omit False}
  :thead {:title "Table head" :forbidden False :omit False}
  :title {:title "Document title" :forbidden False :omit False}
  :tr {:title "Table row" :forbidden False :omit False}
  :tt {:title "Teletype text" :forbidden False :omit False}
  :u {:title "Underlined text" :forbidden False :omit False}
  :ul {:title "Unordered list" :forbidden False :omit False}
  :var {:title "Variable" :forbidden False :omit False}})

; add key as a tag name
(for [[key set] (.items specs4)]
  (assoc set :name (.join "" (drop 2 key))))

; TODO: forbidden and omit flags!
(setv specs5 {
  :article {:title "Defines an article" :forbidden False :omit False}
  :aside {:title "Defines content aside from the page content" :forbidden False :omit False}
  :audio {:title "Defines sound content" :forbidden False :omit False}
  :bdi {:title "Isolates a part of text that might be formatted in a different direction from other text outside it" :forbidden False :omit False}
  :canvas {:title "Used to draw graphics, on the fly, via scripting (usually JavaScript)" :forbidden False :omit False}
  :datalist {:title "Specifies a list of pre-defined options for input controls" :forbidden False :omit False}
  :details {:title "Defines additional details that the user can view or hide" :forbidden False :omit False}
  :dialog {:title "Defines a dialog box or window" :forbidden False :omit False}
  :embed {:title "Defines a container for an external (non-HTML) application" :forbidden False :omit False}
  :figcaption {:title "Defines a caption for a <figure> element" :forbidden False :omit False}
  :figure {:title "Specifies self-contained content" :forbidden False :omit False}
  :footer {:title "Defines a footer for a document or section" :forbidden False :omit False}
  :header {:title "Defines a header for a document or section" :forbidden False :omit False}
  :keygen {:title "Defines a key-pair generator field (for forms)" :forbidden False :omit False}
  :main {:title "Specifies the main content of a document" :forbidden False :omit False}
  :mark {:title "Defines marked/highlighted text" :forbidden False :omit False}
  :menuitem {:title "Defines a command/menu item that the user can invoke from a popup menu" :forbidden False :omit False}
  :meter {:title "Defines a scalar measurement within a known range (a gauge)" :forbidden False :omit False}
  :nav {:title "Defines navigation links" :forbidden False :omit False}
  :output {:title "Defines the result of a calculation" :forbidden False :omit False}
  :picture {:title "Defines a container for multiple image resources" :forbidden False :omit False}
  :progress {:title "Represents the progress of a task" :forbidden False :omit False}
  :rp {:title "Defines what to show in browsers that do not support ruby " :forbidden False :omit False}
  :rt {:title "Defines an explanation/pronunciation of characters (for East Asian typography)" :forbidden False :omit False}
  :ruby {:title "Defines a ruby annotation (for East Asian typography)" :forbidden False :omit False}
  :section {:title "Defines a section in a document" :forbidden False :omit False}
  :source {:title "Defines multiple media resources for media elements (<video> and <audio>)" :forbidden False :omit False}
  :summary {:title "Defines a visible heading for a <details> element" :forbidden False :omit False}
  :time {:title "Defines a date/time" :forbidden False :omit False}
  :track {:title "Defines text tracks for media elements (<video> and <audio>)" :forbidden False :omit False}
  :video {:title "Defines a video or movie" :forbidden False :omit False}
  :wbr {:title "Defines a possible line-break" :forbidden False :omit False}})

; next tags are not supported by html5 althought they are at html4
(setv specs5! (, 
  :tt :strike :noframes :frameset :frame :font :dir :center :big :basefont :applet :acronym))

; add html4 specs (except specs5!) to html5
(for [[key set] (.items specs4)]
  (if-not (in key specs5!)
          (do
             (assoc specs5 key set)
             ; add key as a tag name
             (assoc set :name (.join "" (drop 2 key))))))

; generate both html4 and html5 specs table
(setv specs {})

; first add html4 true for all html4 specs
(for [[key set] (.items specs4)]
  (do
    (assoc specs key set)
    (assoc (get specs key) :html4 True)
    ; initially all is html5 false, but this changes
    ; for most of the tags on the next iteration
    (assoc (get specs key) :html5 False)))

; process html5 specs
(for [[key set] (.items specs5)]
  (do
    ; add a new key only if it not yet added on the previous html4 part
    (if-not (in key specs)
            (do 
              (assoc specs key set)
              ; this tag is was not in html4 specs, so flag html4 false
              (assoc (get specs key) :html4 False)))
    ; also those html5 flags that were false on html4 must be turned true
    (assoc (get specs key) :html5 True)))

; cast dict to ordered dict
(import [collections [OrderedDict]])
(setv specs (OrderedDict (sorted (.items specs))))
