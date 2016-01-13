" ruby 2.0 syntax "{{{
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[i]\z([~`!@#$%^&*_\-+=|\:;"',.?/]\)" end="\z1" skip="\\\\\|\\\z1" fold
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[i]{"				   end="}"   skip="\\\\\|\\}"	fold contains=rubyNestedCurlyBraces,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[i]<"				   end=">"   skip="\\\\\|\\>"	fold contains=rubyNestedAngleBrackets,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[i]\["				   end="\]"  skip="\\\\\|\\\]"	fold contains=rubyNestedSquareBrackets,rubyDelimEscape
syn region rubySymbol matchgroup=rubySymbolDelimiter start="%[i]("				   end=")"   skip="\\\\\|\\)"	fold contains=rubyNestedParentheses,rubyDelimEscape

if !exists("ruby_no_special_methods")
  syn keyword rubyInclude prepend
endif
"}}}
