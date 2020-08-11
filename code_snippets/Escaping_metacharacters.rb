## Escaping with \

'a^2 + b^2 - C*3'.match?(/b^2/)

'a^2 + b^2 - C*3'.gsub(/(a|b)\^2/) { |m| m.upcase }

'(a*b) + c'.gsub(/\(|\)/, '')

'\learn\by\example'.gsub(/\\/, '/')

eqn = 'f*(a^b) - 3*(a^b)'

eqn.gsub('(a^b)', 'c')

## Regexp.escape method

eqn = 'f*(a^b) - 3*(a^b)'

expr = '(a^b)'

puts Regexp.escape(expr)

eqn.sub(/#{Regexp.escape(expr)}\z/, 'c')

terms = %w[a_42 (a^b) 2|3]

pat = Regexp.union(terms)

pat

'ba_423 (a^b)c 2|3 a^b'.gsub(pat, 'X')

Regexp.union(/^cat|dog$/, 'a^b')

## Escaping delimiter

path = '/abc/123/foo/baz/ip.txt'

path.sub(/\A\/abc\/123\//, '~/')

path.sub(%r#\A/abc/123/#, '~/')

## Escape sequences

"a\tb\tc".gsub(/\t/, ':')

"1\n2\n3".gsub(/\n/, ' ')

'h%x'.match?(/h\%x/)

'h\%x'.match?(/h\%x/)

'hello'.match?(/\l/)

'h e l l o'.gsub(/\x20/, '')

'a+b'.match?(/a\053b/)

'12|30'.gsub(/2\x7c3/, '5')

'12|30'.gsub(/2|3/, '5')

