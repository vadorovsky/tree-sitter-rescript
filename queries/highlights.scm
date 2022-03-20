(comment) @comment

; Identifiers
;------------

; Escaped identifiers like \"+."
((value_identifier) @constant.macro
 (#match? @constant.macro "^\\.*$"))

[
  (type_identifier)
  (unit_type)
  "list"
] @type

[
  (variant_identifier)
  (polyvar_identifier)
] @constant

(record_type_field (property_identifier) @property)
(record_field (property_identifier) @property)
(member_expression (property_identifier) @property)
(module_identifier) @namespace

; Parameters
;----------------

(list_pattern (value_identifier) @parameter)
(spread_pattern (value_identifier) @parameter)

; String literals
;----------------

[
  (string)
  (template_string)
] @string

(template_substitution
  "${" @punctuation.bracket
  "}" @punctuation.bracket) @embedded

(character) @string.special
(escape_sequence) @string.escape

; Other literals
;---------------

[
  (true)
  (false)
] @constant.builtin

(number) @number
(polyvar) @constant
(polyvar_string) @constant

; Functions
;----------

[
 (formal_parameters (value_identifier))
 (labeled_parameter (value_identifier))
] @parameter

(function parameter: (value_identifier) @parameter)

; Meta
;-----

[
 "@"
 "@@"
 (decorator_identifier)
] @annotation

(extension_identifier) @keyword
("%") @keyword

; Misc
;-----

(subscript_expression index: (string) @property)
(polyvar_type_pattern "#" @constant)

[
  ("include")
  ("open")
] @include

[
  "as"
  "export"
  "external"
  "let"
  "module"
  "mutable"
  "private"
  "rec"
  "type"
  "and"
] @keyword

[
  "if"
  "else"
  "switch"
] @conditional

[
  "exception"
  "try"
  "catch"
  "raise"
] @exception

[
  "for"
  "in"
  "to"
  "downto"
  "while"
] @repeat

[
  "."
  ","
  "|"
] @punctuation.delimiter

[
  "++"
  "+"
  "+."
  "-"
  "-."
  "*"
  "*."
  "/."
  "<"
  "<="
  "=="
  "==="
  "!"
  "!="
  "!=="
  ">"
  ">="
  "&&"
  "||"
  "="
  ":="
  "->"
  "|>"
  ":>"
  (uncurry)
] @operator

(binary_expression "/" @operator)

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

(polyvar_type
  [
   "["
   "[>"
   "[<"
   "]"
  ] @punctuation.bracket)

[
  "~"
  "?"
  "=>"
  "..."
] @punctuation.special

(ternary_expression ["?" ":"] @operator)

; JSX
;----------
(jsx_identifier) @tag

(jsx_element
  open_tag: (jsx_opening_element ["<" ">"] @tag.delimiter))
(jsx_element
  close_tag: (jsx_closing_element ["<" "/" ">"] @tag.delimiter))
(jsx_self_closing_element ["/" ">" "<"] @tag.delimiter)
(jsx_fragment [">" "<" "/"] @tag.delimiter)
(jsx_attribute (property_identifier) @tag.attribute)

(jsx_opening_element
  name: (jsx_identifier) @tag)

(jsx_closing_element
  name: (jsx_identifier) @tag)

(jsx_self_closing_element
  name: (jsx_identifier) @tag)

(jsx_opening_element ((jsx_identifier) @constructor
 (#lua-match? @constructor "^[A-Z]")))


(jsx_closing_element ((jsx_identifier) @constructor
 (#lua-match? @constructor "^[A-Z]")))


(jsx_self_closing_element ((jsx_identifier) @constructor
 (#lua-match? @constructor "^[A-Z]")))


; Error
;----------

(ERROR) @error
