## match method

'abc ac adc abbbc'.match(/ab*c/)

'abc ac adc abbbc'.match('a.*d')

'abc ac adc abbbc'.match(/ab*c/, 7)

'abc ac adc abbbc'.match(/a.*d/)[0]

m = 'abc ac adc abbbc'.match(/a(.*)d(.*a)/)

m.to_a

m.captures

m[1]

m = 'awesome'.match(/w(.*)me/)

m.offset(0)

m.offset(1)

m.begin(0)

m.end(1)

m = 'THIS is goodbye then'.match(/hi.*bye/i)

m.regexp

m.string

## match method with block

'abc ac adc abbbc'.match(/a(.*)d(.*a)/) { |m| puts m[2], m[1] }

'abc ac adc abbbc'.match(/xyz/) { 2 * 3 }

## Using regexp as a string index

'abc ac adc abbbc'[/c.*d/]

'abc ac adc abbbc'[/a(.*)d(.*a)/, 1]

'abc ac adc abbbc'[7..][/ab*c/]

word = 'elephant'

word[/e.*h/] = 'w'

word

## scan method

'abc ac adc abbbc'.scan(/ab*c/)

'abc ac adc abbbc'.scan(/ab+c/)

'par spar apparent spare part'.scan(/\bs?pare?\b/)

'that is quite a fabricated tale'.scan(/t.*a/)

'that is quite a fabricated tale'.scan(/t.*?a/)

'abc ac adc abbc xabbbcz bbb bc abbbbbc'.scan(/ab*c/)

'abc ac adc abbc xabbbcz bbb bc abbbbbc'.scan(/a(b*)c/)

'2020/04/25,1986/Mar/02,77/12/31'.scan(%r{(.*?)/(.*?)/(.*?),})

'abc ac adc abbbc'.scan(/ab+c/) { |m| puts m.upcase }

'xx:yyy x: x:yy :y'.scan(/(x*):(y*)/) { |a, b| puts a.size + b.size }

## split with capture groups

'31111111111251111426'.split(/1*4?2/)

'31111111111251111426'.split(/(1*4?2)/)

'31111111111251111426'.split(/(1*)4?2/)

'3.14aabccc42'.split(/(a+)b+(c+)/)

'31111111111251111426'.split(/(1*)(4)?2/)

'3.14aabccc42abc88'.split(/(a+b+c+)/, 2)

## regexp global variables

sentence = 'that is quite a fabricated tale'

sentence =~ /q.*b/

$~

$~[0]

$`

$&

$'

'abc ac adc abbbc'.scan(/ab+c/) { puts $&.upcase }

'abc ac adc abbbc'.gsub(/ab+c/) { puts $~.begin(0) }

$~

$`

sentence = 'that is quite a fabricated tale'

sentence.scan(/t.*?a/).map { $~.begin(0) }

sentence.gsub(/t.*?a/).map { $~.begin(0) }

sentence = 'that is quite a fabricated tale'

sentence =~ /a.*(q.*(f.*b).*c)(.*a)/

$&

$1

$2

$+

$4

$~[-2]

$~.values_at(1, 3)

## Using hashes

h = { '1' => 'one', '2' => 'two', '4' => 'four' }

'9234012'.gsub(/1|2|4/, h)

h.default = 'X'

'9234012'.gsub(/./, h)

swap = { 'cat' => 'tiger', 'tiger' => 'cat' }

'cat tiger dog tiger cat'.gsub(/cat|tiger/, swap)

h = { 'hand' => 1, 'handy' => 2, 'handful' => 3, 'a^b' => 4 }

pat = Regexp.union(h.keys.sort_by { |w| -w.length })

pat

'handful hand pin handy (a^b)'.gsub(pat, h)

## Substitution in conditional expression

num = '4'

puts "#{num} apples" if num.sub!(/5/) { $&.to_i ** 2 }

puts "#{num} apples" if num.sub!(/4/) { $&.to_i ** 2 }

word, cnt = ['coffining', 0]

cnt += 1 while word.sub!(/fin/, '')

[word, cnt]

