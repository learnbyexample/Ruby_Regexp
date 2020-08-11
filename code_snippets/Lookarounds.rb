## Conditional expressions

items = ['1,2,3,4', 'a,b,c,d', '#foo 123']

items.filter { |s| s.match?(/\d/) && s.include?('#') }

items.filter_map { |s| s.sub(/,.+,/, ' ') if s[0] != '#' }

## Negative lookarounds

'hey food! foo42 foot5 foofoo'.gsub(/foo(?!\d)/, 'baz')

'foo _foo 42foofoo'.gsub(/(?<!_)foo/, 'baz')

'food _fool 42foo_foot'.gsub(/(?<!_)foo./, 'baz')

':cart apple --rest ;tea'.gsub(/(?<!:|--)\b\w+/, 'X')

'tie. ink east;'.scan(/(?<![[:punct:]])\b\w+\b(?![[:punct:]])/)

'foo_baz=num1+35*42/num2'.gsub(/(?<!\A)\b(?!\z)/, ' ')

'spare'.gsub(/(?<![pr])./, '*')

'spare'.gsub(/.(?<![pr].)/, '*')

'par spare part party'.gsub(/par(?!.*s)/, 'X')

'par spare part party'.gsub(/(?!.*s)par/, 'X')

'foo_baz=num1+35*42/num2'.gsub(/(?!\z)\b(?<!\A)/, ' ')

## Positive lookarounds

'42 foo-5, baz3; x83, y-20; f12'.scan(/\d+(?=,)/)

'42 foo-5, baz3; x83, y-20; f12'.scan(/(?<=-)\d+(?=[;:])/)

'par spare part party'.gsub(/par(?=.*\bpart\b)/, 'X')

'1,two,3,four,5'.scan(/(?<=,)[^,]+(?=,)/)

',1,,,two,3,,'.gsub(/(?<=\A|,)(?=,|\z)/, 'nil')

',cat,tiger'.gsub(/[^,]*/, '{\0}')

',cat,tiger'.gsub(/(?<=\A|,)[^,]*/, '{\0}')

## Capture groups inside positive lookarounds

puts 'a b c d e'.gsub(/(\S+\s+)(?=(\S+)\s)/, "\\1\\2\n")

'pore42 car3 pare7 care5'.scan(/(?<=(po|ca)re)\d+/)

'pore42 car3 pare7 care5'.scan(/(?<=(?:po|ca)re)\d+/)

## AND conditional with lookarounds

words = %w[sequoia subtle questionable exhibit equation]

words.grep(/(?=.*b)(?=.*e).*t/)

words.grep(/(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u/)

words.grep(/(?=.*a)(?=.*q)(?!.*n\z)/)

## Emulating positive lookbehind with \K

'sea eat car rat eel tea'.gsub(/\b\w\K\w*\W*/, '')

'cat scatter cater scat'.sub(/(cat.*?){2}\Kcat/, 'X')

row = '421,foo,2425,42,5,foo,6,6,42'

nil while row.gsub!(/(?<=\A|,)([^,]++).*\K,\1(?=,|\z)/, '')

row

',cat,tiger'.gsub(/(?<=\A|,)[^,]*+/, '{\0}')

',cat,tiger'.gsub(/(?:\A|,)\K[^,]*+/, '{\0}')

'abcd 123456'.gsub(/(?<=\w)/, ':')

'abcd 123456'.gsub(/\w/, '\0:')

'abcd 123456'.gsub(/\w\K/, ':')

## Variable length lookbehind

s = 'pore42 tar3 dare7 care5'

s.scan(/(?<=(?:po|da)re)\d+/)

s.scan(/(?<=\b[a-z]{4})\d+/)

s.scan(/(?<!tar|dare)\d+/)

s.scan(/(?<=(?:o|ca)re)\d+/)

s.scan(/(?<=\b[a-z]+)\d+/)

s = 'pore42 tar3 dare7 care5'

s.gsub(/(?:tar|dare)(\d+)/).map { $1 }

s.gsub(/(tar|dare)\d+/, '\1')

s.gsub(/\b[pd][a-z]*(\d+)/).map { $1 }

s.gsub(/(\b[pd][a-z]*)\d+/, '\1')

## Negated groups and absence operator

'fox,cat,dog,parrot'.match?(/\A((?!cat).)*dog/)

'fox,cat,dog,parrot'.match?(/\A((?!parrot).)*dog/)

'fox,cat,dog,parrot'[/\A((?!cat).)*/]

'fox,cat,dog,parrot'[/\A((?!parrot).)*/]

'fox,cat,dog,parrot'[/\A(?:(?!(.)\1).)*/]

'fox,cat,dog,parrot'.match?(/at(?~do)par/)

'fox,cat,dog,parrot'.match?(/at(?~go)par/)

'fox,cat,dog,parrot'[/at(?~go)par/]

## \G anchor

'123-87-593 42 foo'.scan(/\G\S/)

'123-87-593 42 foo'.gsub(/\G\S/, '*')

'123-87-593 42 foo'.scan(/\G\d+-?/)

'123-87-593 42 foo'.gsub(/\G(\d+)(-?)/, '(\1)\2')

'cat12 bat pin'.gsub(/\G\w(?=\w)/, '\0:')

'par tar-den hen-food mood'.gsub(/\G[a-z ]/, '(\0)')

