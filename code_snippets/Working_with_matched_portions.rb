'abc ac adc abbbc'.match(/ab*c/)

'abc ac adc abbbc'.match('a.*d')

'abc ac adc abbbc'.match(/ab*c/, 7)

'abc ac adc abbbc'.match(/a.*d/)

'abc ac adc abbbc'.match(/a.*d/)[0]

'abc ac adc abbbc'.match(/a(.*)d(.*a)/).to_a

'abc ac adc abbbc'.match(/a(.*)d(.*a)/)[1]

'abc ac adc abbbc'.match(/a(.*)d(.*a)/) { |m| puts m[2], m[1] }

'abc ac adc abbbc'.match(/xyz/) { 2 * 3 }

'abc ac adc abbbc'[/c.*d/]

'abc ac adc abbbc'[/a(.*)d(.*a)/, 1]

'abc ac adc abbbc'[7..-1][/ab*c/]

word = 'elephant'

word[/e.*h/] = 'w'

word

'abc ac adc abbbc'.scan(/ab*c/)

'abc ac adc abbbc'.scan(/ab+c/)

'par spar apparent spare part'.scan(/\bs?pare?\b/)

'that is quite a fabricated tale'.scan(/t.*a/)

'that is quite a fabricated tale'.scan(/t.*?a/)

'abc ac adc abbc xabbbcz bbb bc abbbbbc'.scan(/a(b*)c/)

'xx:yyy x: x:yy :y'.scan(/(x*):(y*)/)

'abc ac adc abbbc'.scan(/ab+c/) { |m| puts m.upcase }

'xx:yyy x: x:yy :y'.scan(/(x*):(y*)/) { |a, b| puts a.size + b.size }

sentence = 'that is quite a fabricated tale'

sentence =~ /q.*b/

$~

$~[0]

$`

$&

$'

'abc ac adc abbbc'.scan(/ab+c/) { puts $&.upcase }

$~

$`

sentence = 'that is quite a fabricated tale'

sentence =~ /a.*(q.*(f.*b).*c)(.*a)/

$&

$1

$2

$+

$4

$~[-2]

