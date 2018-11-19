'a^2 + b^2 - C*3'.match?(/b^2/)

'a^2 + b^2 - C*3'.gsub(/(a|b)\^2/) { |m| m.upcase }

'(a*b) + c'.gsub(/\(|\)/, '')

'\learn\by\example'.gsub(/\\/, '/')

eqn = 'f*(a^b) - 3*(a^b)'

eqn.gsub('(a^b)', 'c')

expr = '(a^b)'

puts Regexp.escape(expr)

Regexp.union('foo_baz', expr)

eqn.sub(/#{Regexp.escape(expr)}\z/, 'c')

path = '/foo/123/foo/baz/ip.txt'

path.sub(/\A\/foo\/123\//, '~/')

path.sub(%r#\A/foo/123/#, '~/')

