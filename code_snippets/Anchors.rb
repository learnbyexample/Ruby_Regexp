## String anchors

'cater'.match?(/\Acat/)

'concatenation'.match?(/\Acat/)

"hi hello\ntop spot".match?(/\Ahi/)

"hi hello\ntop spot".match?(/\Atop/)

'spare'.match?(/are\z/)

'nearest'.match?(/are\z/)

words = %w[surrender unicorn newer door empty eel pest]

words.grep(/er\z/)

words.grep(/t\z/)

'dare'.sub(/are\z/, 'X')

'dare'.sub(/are\Z/, 'X')

"dare\n".sub(/are\z/, 'X')

"dare\n".sub(/are\Z/, 'X')

'cat'.match?(/\Acat\z/)

'cater'.match?(/\Acat\z/)

'concatenation'.match?(/\Acat\z/)

'live'.sub(/\A/, 're')

'send'.sub(/\A/, 're')

'cat'.sub(/\z/, 'er')

'hack'.sub(/\z/, 'er')

## Line anchors

pets = 'cat and dog'

pets.match?(/^cat/)

pets.match?(/^dog/)

pets.match?(/dog$/)

pets.match?(/^dog$/)

"hi hello\ntop spot".match?(/^top/)

"spare\npar\ndare".match?(/er$/)

"spare\npar\ndare".each_line.grep(/are$/)

"spare\npar\ndare".match?(/^par$/)

str = "catapults\nconcatenate\ncat"

puts str.gsub(/^/, '1: ')

puts str.gsub(/^/).with_index(1) { |m, i| "#{i}: " }

puts str.gsub(/$/, '.')

puts "1\n2\n".gsub(/^/, 'foo ')

puts "1\n\n".gsub(/^/, 'foo ')

puts "1\n2\n".gsub(/$/, ' baz')

puts "1\n\n".gsub(/$/, ' baz')

## Word anchors

words = 'par spar apparent spare part'

words.gsub(/par/, 'X')

words.gsub(/\bpar/, 'X')

words.gsub(/par\b/, 'X')

words.gsub(/\bpar\b/, 'X')

puts words.gsub(/\b/, '"').tr(' ', ',')

'-----hello-----'.gsub(/\b/, ' ')

'foo_baz=num1+35*42/num2'.gsub(/\b/, ' ')

'foo_baz=num1+35*42/num2'.gsub(/\b/, ' ').strip

words = 'par spar apparent spare part'

words.gsub(/\Bpar/, 'X')

words.gsub(/\Bpar\b/, 'X')

words.gsub(/par\B/, 'X')

words.gsub(/\Bpar\B/, 'X')

'copper'.gsub(/\b/, ':')

'copper'.gsub(/\B/, ':')

'-----hello-----'.gsub(/\b/, ' ')

'-----hello-----'.gsub(/\B/, ' ')

