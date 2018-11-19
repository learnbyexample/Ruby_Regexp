'tac tin cat abc;tuv acute'.gsub(/c.t/, 'X')

'breadth markedly reported overrides'.gsub(/r..d/) { |s| s.upcase }

"42\t33".sub(/2.3/, '8')

'far feat flare fear'.gsub(/e?ar/, 'X')

'par spare part party'.gsub(/\bpart?\b/, 'X')

%w[red read ready re;d redo reed].grep(/\bre.?d\b/)

'par part parrot parent'.gsub(/par(ro)?t/, 'X')

'par part parrot parent'.gsub(/par(en|ro)?t/, 'X')

'tr tear tare steer sitaara'.gsub(/ta*r/, 'X')

'tr tear tare steer sitaara'.gsub(/t(e|a)*r/, 'X')

'3111111111125111142'.gsub(/1*2/, 'X')

'3111111111125111142'.partition(/1*2/)

'3111111111125111142'.rpartition(/1*2/)

'3111111111125111142'.split(/1*/)

'3111111111125111142'.split(/1*/, -1)

'tr tear tare steer sitaara'.gsub(/ta+r/, 'X')

'tr tear tare steer sitaara'.gsub(/t(e|a)+r/, 'X')

'3111111111125111142'.gsub(/1+2/, 'X')

'3111111111125111142'.split(/1+/)

demo = %w[abc ac adc abbc xabbbcz bbb bc abbbbbc]

demo.grep(/ab{1,4}c/)

demo.grep(/ab{3,}c/)

demo.grep(/ab{,2}c/)

demo.grep(/ab{3}c/)

'Error: not a valid input'.match?(/Error.*valid/)

'Error: key not found'.match?(/Error.*valid/)

seq1, seq2 = ['cat and dog', 'dog and cat']

seq1.match?(/cat.*dog|dog.*cat/)

seq2.match?(/cat.*dog|dog.*cat/)

patterns = [/cat/, /dog/]

patterns.all? { |re| seq1.match?(re) }

patterns.all? { |re| seq2.match?(re) }

'foot'.sub(/f.?o/, 'X')

puts 'blah \< foo < bar \< blah < baz'.gsub(/\\?</, '\<')

'hand handy handful'.gsub(/hand(y|ful)?/, 'X')

sentence = 'that is quite a fabricated tale'

sentence.sub(/t.*a/, 'X')

'star'.sub(/t.*a/, 'X')

sentence.sub(/t.*a.*q.*f/, 'X')

sentence.sub(/t.*a.*u/, 'X')

'foot'.sub(/f.??o/, 'X')

'frost'.sub(/f.??o/, 'X')

'123456789'.sub(/.{2,5}?/, 'X')

sentence = 'that is quite a fabricated tale'

sentence.sub(/t.*?a/, 'X')

sentence.sub(/t.*?a.*?f/, 'X')

%w[abc ac adc abbc xabbbcz bbb bc abbbbbc].grep(/ab*c/)

%w[abc ac adc abbc xabbbcz bbb bc abbbbbc].grep(/ab*+c/)

'feat ft feaeat'.gsub(/f(a|e)*at/, 'X')

'feat ft feaeat'.gsub(/f(a|e)*+at/, 'X')

'abbbc foooooot'.gsub(/(?>(b|o)+)/, 'X')

'feat ft feaeat'.gsub(/f(?>(a|e)*)at/, 'X')

