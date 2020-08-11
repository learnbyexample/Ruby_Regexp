## Dot metacharacter

'tac tin c.t abc;tuv acute'.gsub(/c.t/, 'X')

'breadth markedly reported overrides'.gsub(/r..d/) { |s| s.upcase }

"42\t33".sub(/2.3/, '8')

## split method

'apple-85-mango-70'.split(/-/)

'bus:3:car:5:van'.split(/:.:/)

'apple-85-mango-70'.split(/-/, 2)

## Greedy quantifiers

'far feat flare fear'.gsub(/e?ar/, 'X')

'par spare part party'.gsub(/\bpart?\b/, 'X')

words = %w[red read ready re;d road redo reed rod]

words.grep(/\bre.?d\b/)

'par part parrot parent'.gsub(/par(ro)?t/, 'X')

'par part parrot parent'.gsub(/par(en|ro)?t/, 'X')

'tr tear tare steer sitaara'.gsub(/ta*r/, 'X')

'tr tear tare steer sitaara'.gsub(/t(e|a)*r/, 'X')

'3111111111125111142'.gsub(/1*2/, 'X')

'3111111111125111142'.split(/1*/)

'3111111111125111142'.split(/1*/, -1)

'3111111111125111142'.partition(/1*2/)

'3111111111125111142'.rpartition(/1*2/)

'tr tear tare steer sitaara'.gsub(/ta+r/, 'X')

'tr tear tare steer sitaara'.gsub(/t(e|a)+r/, 'X')

'3111111111125111142'.gsub(/1+2/, 'X')

'3111111111125111142'.split(/1+/)

demo = %w[abc ac adc abbc xabbbcz bbb bc abbbbbc]

demo.grep(/ab{1,4}c/)

demo.grep(/ab{3,}c/)

demo.grep(/ab{,2}c/)

demo.grep(/ab{3}c/)

## AND conditional

'Error: not a valid input'.match?(/Error.*valid/)

'Error: key not found'.match?(/Error.*valid/)

seq1, seq2 = ['cat and dog', 'dog and cat']

seq1.match?(/cat.*dog|dog.*cat/)

seq2.match?(/cat.*dog|dog.*cat/)

patterns = [/cat/, /dog/]

patterns.all? { |re| seq1.match?(re) }

patterns.all? { |re| seq2.match?(re) }

## What does greedy mean?

'foot'.sub(/f.?o/, 'X')

puts 'blah \< foo < bar \< blah < baz'.gsub(/\\?</, '\<')

'hand handy handful'.gsub(/hand(y|ful)?/, 'X')

sentence = 'that is quite a fabricated tale'

sentence.sub(/t.*a/, 'X')

'star'.sub(/t.*a/, 'X')

sentence.sub(/t.*a.*q.*f/, 'X')

sentence.sub(/t.*a.*u/, 'X')

## Non-greedy quantifiers

'foot'.sub(/f.??o/, 'X')

'frost'.sub(/f.??o/, 'X')

'123456789'.sub(/.{2,5}?/, 'X')

'green:3.14:teal::brown:oh!:blue'.split(/:.*?:/)

sentence = 'that is quite a fabricated tale'

sentence.sub(/t.*?a/, 'X')

sentence.sub(/t.*?a.*?f/, 'X')

sentence.sub(/q.*?e$/, 'X')

## Possessive quantifiers

%w[abc ac adc abbc xabbbcz bbb bc abbbbbc].grep(/ab*c/)

%w[abc ac adc abbc xabbbcz bbb bc abbbbbc].grep(/ab*+c/)

'0501 035 154 12 26 98234'.gsub(/\b0*\d{3,}\b/, 'X')

'0501 035 154 12 26 98234'.gsub(/\b0*+\d{3,}\b/, 'X')

'abbbc foooooot'.gsub(/(?>(b|o)+)/, 'X')

'0501 035 154 12 26 98234'.gsub(/\b(?>0*)\d{3,}\b/, 'X')

