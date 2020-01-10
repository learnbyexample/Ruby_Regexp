'foo - baz'.gsub(/\w+/n, '(\0)')

'fox:αλεπού'.scan(/\w+/n)

'fox:αλεπού,eagle:αετός'.scan(/\p{L}+/)

'fox:αλεπού,eagle:αετός'.scan(/\p{Greek}+/)

'φοο12,βτ_4,foo'.scan(/\p{Word}+/)

'φοο12,βτ_4,foo'.gsub(/\P{L}+/, '')

'fox:αλεπού'.codepoints.map { |i| '%x' % i }

puts "\u{66 6f 78 3a 3b1 3bb 3b5 3c0 3bf 3cd}"

'fox:αλεπού,eagle:αετός'.scan(/[\u{61}-\u{7a}]+/)

'g̈'.codepoints.map { |i| '%x' % i }

puts "\u{67 308}"

'cag̈ed'.sub(/a.e/, 'o')

'cag̈ed'.sub(/a..e/, 'o')

'cag̈ed'.sub(/a\Xe/, 'o')

"he\nat".sub(/e.a/, 'ea')

"he\nat".sub(/e.a/m, 'ea')

"he\nat".sub(/e\Xa/, 'ea')

