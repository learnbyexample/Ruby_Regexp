## Encoding modifiers

'foo - baz'.gsub(/\w+/n, '(\0)')

'fox:αλεπού'.scan(/\w+/n)

'fox:αλεπού'.scan(/\w+/)

'fox:αλεπού'.scan(/[[:word:]]+/)

'fox:αλεπού'.scan(/(?u)\w+/)

## Unicode character sets

'fox:αλεπού,eagle:αετός'.scan(/\p{L}+/)

'fox:αλεπού,eagle:αετός'.scan(/\p{Greek}+/)

'φοο12,βτ_4,foo'.scan(/\p{Word}+/)

'φοο12,βτ_4,foo'.gsub(/\P{L}+/, '')

## Codepoints and Unicode escapes

'fox:αλεπού'.codepoints.map { |i| '%x' % i }

puts "\u{66 6f 78 3a 3b1 3bb 3b5 3c0 3bf 3cd}"

'fox:αλεπού,eagle:αετός'.scan(/[\u{61}-\u{7a}]+/)

## \X vs dot metacharacter

'g̈'.codepoints.map { |i| '%x' % i }

puts "\u{67 308}"

'cag̈ed'.sub(/a.e/, 'o')

'cag̈ed'.sub(/a..e/, 'o')

'cag̈ed'.sub(/a\Xe/, 'o')

"he\nat".sub(/e.a/, 'ea')

"he\nat".sub(/e.a/m, 'ea')

"he\nat".sub(/e\Xa/, 'ea')

