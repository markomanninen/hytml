#!/usr/bin/python3

(setv specs {:a {:name "Anchor" :forbidden False :omit False}
 :abbr {:name "Abbreviation" :forbidden False :omit False}
 :acronym {:name "Acronym" :forbidden False :omit False}
 :address {:name "Address" :forbidden False :omit False}
 :applet {:name "Java applet" :forbidden False :omit False}
 :area {:name "Image map region" :forbidden True :omit False}
 :b {:name "Bold text" :forbidden False :omit False}
 :base {:name "Document base URI" :forbidden True :omit False}
 :basefont {:name "Base font change" :forbidden True :omit False}
 :bdo {:name "BiDi override" :forbidden False :omit False}
 :big {:name "Large text" :forbidden False :omit False}
 :blockquote {:name "Block quotation" :forbidden False :omit False}
 :body {:name "Document body" :forbidden False :omit False}
 :br {:name "Line break" :forbidden True :omit False}
 :button {:name "Button" :forbidden False :omit False}
 :caption {:name "Table caption" :forbidden False :omit False}
 :center {:name "Centered block" :forbidden False :omit False}
 :cite {:name "Citation" :forbidden False :omit False}
 :code {:name "Computer code" :forbidden False :omit False}
 :col {:name "Table column" :forbidden True :omit True}
 :colgroup {:name "Table column group" :forbidden False :omit False}
 :dd {:name "Definition description" :forbidden False :omit False}
 :del {:name "Deleted text" :forbidden False :omit False}
 :dfn {:name "Defined term" :forbidden False :omit False}
 :dir {:name "Directory list" :forbidden False :omit False}
 :div {:name "Generic block-level container" :forbidden False :omit False}
 :dl {:name "Definition list" :forbidden False :omit False}
 :dt {:name "Definition term" :forbidden False :omit False}
 :em {:name "Emphasis" :forbidden False :omit False}
 :fieldset {:name "Form control group" :forbidden False :omit False}
 :font {:name "Font change" :forbidden False :omit False}
 :form {:name "Interactive form" :forbidden False :omit False}
 :frame {:name "Frame" :forbidden True :omit False}
 :frameset {:name "Frameset" :forbidden False :omit False}
 :h1 {:name "Level-one heading" :forbidden False :omit False}
 :h2 {:name "Level-two heading" :forbidden False :omit False}
 :h3 {:name "Level-three heading" :forbidden False :omit False}
 :h4 {:name "Level-four heading" :forbidden False :omit False}
 :h5 {:name "Level-five heading" :forbidden False :omit False}
 :h6 {:name "Level-six heading" :forbidden False :omit False}
 :head {:name "Document head" :forbidden False :omit False}
 :hr {:name "Horizontal rule" :forbidden True :omit False}
 :html {:name "HTML document" :forbidden False :omit False}
 :i {:name "Italic text" :forbidden False :omit False}
 :iframe {:name "Inline frame" :forbidden False :omit False}
 :img {:name "Inline image" :forbidden True :omit False}
 :input {:name "Form input" :forbidden True :omit False}
 :ins {:name "Inserted text" :forbidden False :omit False}
 :isindex {:name "Input prompt" :forbidden True :omit False}
 :kbd {:name "Text to be input" :forbidden False :omit False}
 :label {:name "Form field label" :forbidden False :omit False}
 :legend {:name "Fieldset caption" :forbidden False :omit False}
 :li {:name "List item" :forbidden False :omit False}
 :link {:name "Document relationship" :forbidden True :omit False}
 :map {:name "Image map" :forbidden False :omit False}
 :menu {:name "Menu list" :forbidden False :omit False}
 :meta {:name "Metadata" :forbidden True :omit False}
 :noframes {:name "Frames alternate content" :forbidden False :omit False}
 :noscript {:name "Alternate script content" :forbidden False :omit False}
 :object {:name "Object" :forbidden False :omit False}
 :ol {:name "Ordered list" :forbidden False :omit False}
 :optgroup {:name "Option group" :forbidden False :omit False}
 :option {:name "Menu option" :forbidden False :omit False}
 :p {:name "Paragraph" :forbidden False :omit False}
 :param {:name "Object parameter" :forbidden True :omit False}
 :pre {:name "Preformatted text" :forbidden False :omit False}
 :q {:name "Short quotation" :forbidden False :omit False}
 :s {:name "Strike-through text" :forbidden False :omit False}
 :samp {:name "Sample output" :forbidden False :omit False}
 :script {:name "Client-side script" :forbidden False :omit False}
 :select {:name "Option selector" :forbidden False :omit False}
 :small {:name "Small text" :forbidden False :omit False}
 :span {:name "Generic inline container" :forbidden False :omit False}
 :strike {:name "Strike-through text" :forbidden False :omit False}
 :strong {:name "Strong emphasis" :forbidden False :omit False}
 :style {:name "Embedded style sheet" :forbidden False :omit False}
 :sub {:name "Subscript" :forbidden False :omit False}
 :sup {:name "Superscript" :forbidden False :omit False}
 :table {:name "Table" :forbidden False :omit False}
 :tbody {:name "Table body" :forbidden False :omit False}
 :td {:name "Table data cell" :forbidden False :omit False}
 :textarea {:name "Multi-line text input" :forbidden False :omit False}
 :tfoot {:name "Table foot" :forbidden False :omit False}
 :th {:name "Table header cell" :forbidden False :omit False}
 :thead {:name "Table head" :forbidden False :omit False}
 :title {:name "Document title" :forbidden False :omit False}
 :tr {:name "Table row" :forbidden False :omit False}
 :tt {:name "Teletype text" :forbidden False :omit False}
 :u {:name "Underlined text" :forbidden False :omit False}
 :ul {:name "Unordered list" :forbidden False :omit False}
 :var {:name "Variable" :forbidden False :omit False}})
