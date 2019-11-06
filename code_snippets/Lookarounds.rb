'hey food! foo42 foot5 foofoo'.gsub(/foo(?!\d)/, 'baz')

'foo _foo 42foofoo'.gsub(/(?<!_)foo/, 'baz')

'food _fool 42foo_foot'.gsub(/(?<!_)foo./, 'baz')

':cart apple --rest ;tea'.gsub(/(?<!:|--)\b\w+/, 'X')

'tie. ink east;'.scan(/(?<![[:punct:]])\b\w+\b(?![[:punct:]])/)

'foo_baz=num1+35*42/num2'.gsub(/(?<!\A)\b(?!\z)/, ' ')

'42 foo-5, baz3; x83, y-20; f12'.scan(/\d+(?=,)/)

'42 foo-5, baz3; x83, y-20; f12'.scan(/(?<=-)\d+(?=[;,])/)

'1,two,3,four,5'.scan(/(?<=,)[^,]+(?=,)/)

',1,,,two,3,,'.gsub(/(?<=\A|,)(?=,|\z)/, 'nil')

',1,,,two,3,,'.gsub(/(?<![^,])(?![^,])/, 'nil')

puts 'a b c d e'.gsub(/(\S+\s+)(?=(\S+)\s)/, "\\1\\2\n")

'pore42 car3 pare7 care5'.scan(/(?<=(po|ca)re)\d+/)

'pore42 car3 pare7 care5'.scan(/(?<=(?:po|ca)re)\d+/)

words = %w[sequoia subtle questionable exhibit equation]

words.grep(/(?=.*b)(?=.*e).*t/)

words.grep(/(?=.*a)(?=.*e)(?=.*i)(?=.*o).*u/)

'pore42 car3 pare7 care5'.scan(/(?<=(?:po|ca)re)\d+/)

'pore42 car3 pare7 care5'.scan(/(?<=\b[a-z]{4})\d+/)

'pore42 car3 pare7 care5'.scan(/(?<!car|pare)\d+/)

'pore42 car3 pare7 care5'.scan(/(?<=(?:o|ca)re)\d+/)

'pore42 car3 pare7 care5'.scan(/(?<=\b[a-z]+)\d+/)

'sea eat car rat eel tea'.gsub(/\b\w\K\w*\W*/, '')

'cat scatter cater scat'.sub(/(cat.*?){2}\Kcat/, 'X')

'fox,cat,dog,parrot'.match?(/\A((?!cat).)*dog/)

'fox,cat,dog,parrot'.match?(/\A((?!parrot).)*dog/)

'fox,cat,dog,parrot'[/\A((?!cat).)*/]

'fox,cat,dog,parrot'[/\A((?!parrot).)*/]

'fox,cat,dog,parrot'[/\A(?:(?!(.)\1).)*/]

'fox,cat,dog,parrot'.match?(/at(?~do)par/)

'fox,cat,dog,parrot'.match?(/at(?~go)par/)

'fox,cat,dog,parrot'[/at(?~go)par/]

'fox,cat,dog,parrot'.match?(/\A(?~cat)dog/)

