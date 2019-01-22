# Regexp literal and operators

Refer to [exercises folder](https://github.com/learnbyexample/Ruby_Regexp/tree/master/exercises) for input files required to solve the exercises.

**a)** For the given input file, print all lines containing the string `two`

```ruby
# note that expected output shown here is wrapped to fit pdf width
>> filename = 'programming_quotes.txt'
>> word = //    ##### add your solution here

>> puts File.foreach(filename).grep(word)
"Some people, when confronted with a problem, think - I know, I'll use regular expressions.
Now they have two problems" by Jamie Zawinski
"So much complexity in software comes from trying to make one thing do two things" by Ryan Singer
```

**b)** For the given input string, print all lines NOT containing the string `2`

```ruby
>> purchases = %q{items qty
apple 24
mango 50
guava 42
onion 31
water 10}
>> num = //     ##### add your solution here

>> puts purchases.each_line.grep_v(num)
items qty
mango 50
onion 31
water 10
```

<br>

# Anchors

**a)** For the given **url**, count the total number of lines that contain `is` or `the` as whole words.

```ruby
>> require 'open-uri'
>> scarlet_pimpernel_link = 'https://www.gutenberg.org/cache/epub/60/pg60.txt'
>> word1 = //       ##### add your solution here
>> word2 = //       ##### add your solution here

>> cnt = 0
>> open(scarlet_pimpernel_link) do |ip_file|
?>   ip_file.each do |line|
?>     cnt += 1 if line.match?(word1) || line.match?(word2)
>>   end
>> end

>> puts cnt
3737
```

**b)** For the given input string, change only whole word `red` to `brown`

```ruby
>> words = 'bred red spread credible'

>> words.gsub()     ##### add your solution here
=> "bred brown spread credible"
```

**c)** For the given input list, filter all elements that contains `42` surrounded by word characters.

```ruby
>> words = ['hi42bye', 'nice1423', 'bad42', 'cool_42a', 'fake4b']

>> words.grep()     ##### add your solution here
=> ["hi42bye", "nice1423", "cool_42a"]
```

**d)** For the given input list, filter all elements that start with `den` or end with `ly`

```ruby
>> foo = ['lovely', '1 dentist', '2 lonely', 'eden', 'fly away', 'dent']

>> foo.select {}    ##### add your solution here
=> ["lovely", "2 lonely", "dent"]
```

**e)** For the given input string, change whole word `mall` only if it is at start of line.

```ruby
>> para = %q{ball fall wall tall
mall call ball pall
wall mall ball fall}

>> puts para.gsub()     ##### add your solution here
ball fall wall tall
1234 call ball pall
wall mall ball fall
```

<br>

# Alternation and Grouping

**a)** For the given input list, filter all elements that start with `den` or end with `ly`

```ruby
>> foo = ['lovely', '1 dentist', '2 lonely', 'eden', 'fly away', 'dent']

>> foo.grep()       ##### add your solution here
=> ["lovely", "2 lonely", "dent"]
```

**b)** For the given **url**, count the total number of lines that contain `removed` or `rested` or
`received` or `replied` or `refused` or `retired` as whole words.

```ruby
>> require 'open-uri'
>> scarlet_pimpernel_link = 'https://www.gutenberg.org/cache/epub/60/pg60.txt'
>> words = //       ##### add your solution here

>> cnt = 0
>> open(scarlet_pimpernel_link) do |ip_file|
?>   ip_file.each do |line|
?>     cnt += 1 if line.match?(words)
>>   end
>> end

>> puts cnt
83
```

<br>

# Escaping metacharacters

**a)** Transform given input strings to expected output using same logic on both strings.

```ruby
>> str1 = '(9-2)*5+qty/3'
>> str2 = '(qty+4)/2-(9-2)*5+pq/4'

##### add your solution here for str1
=> "35+qty/3"
##### add your solution here for str2
=> "(qty+4)/2-35+pq/4"
```

**b)** Replace any matching item from given list with `X` for given input strings.

```ruby
>> items = ['a.b', '3+n', 'x\y\z', 'qty||price', '{n}']
>> alt_re =     ##### add your solution here

>> '0a.bcd'.gsub(alt_re, 'X')
=> "0Xcd"
>> 'E{n}AMPLE'.gsub(alt_re, 'X')
=> "EXAMPLE"
>> '43+n2 ax\y\ze'.gsub(alt_re, 'X')
=> "4X2 aXe"
```

<br>

# Dot metacharacter and Quantifiers

**Note** that some exercises are intentionally designed to be complicated to solve with regular
expressions alone. Try to use normal string methods, break down the problem into multiple steps, etc.
Some exercises will become easier to solve with techniques presented in chapters to come. Going through
the exercises a second time after finishing entire book will be fruitful as well.

**a)** Use regular expression to get the output as shown for the given strings.

```ruby
>> eqn1 = 'a+42//5-c'
>> eqn2 = 'pressure*3+42/5-14256'
>> eqn3 = 'r*42-5/3+42///5-42/53+a'

>> expr =       ##### add your solution here
##### add your solution here for eqn1
=> ["a+", "-c"]
##### add your solution here for eqn2
=> ["pressure*3+", "-14256"]
##### add your solution here for eqn3
=> ["r*42-5/3+42///5-", "3+a"]
```

**b)** For the given strings, construct a regexp to get output as shown.

```ruby
>> str1 = 'a+b(addition)'
>> str2 = 'a/b(division) + c%d(#modulo)'
>> str3 = 'Hi there(greeting). Nice day(a(b)'
>> remove_parentheses = //      ##### add your solution here

>> str1.gsub(remove_parentheses, '')
=> "a+b"
>> str2.gsub(remove_parentheses, '')
=> "a/b + c%d"
>> str3.gsub(remove_parentheses, '')
=> "Hi there. Nice day"
```

**c)** Remove leading/trailing whitespaces from all the individual fields of these csv strings.

```ruby
>> csv1 = ' comma  ,separated ,values '
=> " comma  ,separated ,values "
>> csv2 = 'good bad,nice  ice  , 42 , ,   stall   small'
=> "good bad,nice  ice  , 42 , ,   stall   small"

##### add your solution here for csv1
=> "comma,separated,values"
##### add your solution here for csv2
=> "good bad,nice  ice,42,,stall   small"
```

**d)** Correct the given regexp to get the expected output.

```ruby
>> words = 'plink incoming tint winter in caution sentient'

# wrong output
>> change = /int|in|ion|ing|inco|inter|ink/
=> /int|in|ion|ing|inco|inter|ink/
>> words.gsub(change, 'X')
=> "plXk XcomXg tX wXer X cautX sentient"

# expected output
>> change = //      ##### add your solution here
>> words.gsub(change, 'X')
=> "plX XmX tX wX X cautX sentient"
```

**e)** For the given greedy quantifiers, what would be the equivalent form using `{m,n}` representation?

* `?` is same as
* `*` is same as
* `+` is same as

**f)** `(a*|b*)` is same as `(a|b)*` - true or false?

<br>

# Working with matched portions

**a)** For the given strings, extract the matching portion from first `is` to last `t`

```ruby
>> str1 = 'What is the biggest fruit you have seen?'
>> str2 = 'Your mission is to read and practice consistently'

>> expr = //        ##### add your solution here
>> str1[expr]
=> "is the biggest fruit"
>> str2[expr]
=> "ission is to read and practice consistent"
```

**b)** Transform the given input strings to expected output as shown.

```ruby
>> row1 = '-2,5 4,+3 +42,-53 '
##### add your solution here for row1
=> [3, 7, -11]

>> row2 = '1.32,-3.14 634,5.63 '
##### add your solution here for row2
=> [-1.82, 639.63]
```

<br>

# Character class

**a)** Delete all pair of parentheses, unless they contain a parentheses character.

```ruby
>> str1 = 'def factorial()'
>> str2 = 'a/b(division) + c%d(#modulo) - (e+(j/k-3)*4)'
>> str3 = 'Hi there(greeting). Nice day(a(b)'

>> remove_parentheses = //      ##### add your solution here
>> str1.gsub(remove_parentheses, '')
=> "def factorial"
>> str2.gsub(remove_parentheses, '')
=> "a/b + c%d - (e+*4)"
>> str3.gsub(remove_parentheses, '')
=> "Hi there. Nice day(a"
```

**b)** Output true/false depending upon input string containing any number sequence
that is greater than `624`

```ruby
>> str1 = 'hi0000432abcd'
##### add your solution here for str1
=> false

>> str2 = '42_624 0512'
##### add your solution here for str2
=> false

>> str3 = '3.14 96 2 foo1234baz'
##### add your solution here for str3
=> true
```

**c)** Split the given strings based on consecutive sequence of digit or whitespace characters.

```ruby
>> str1 = "lion \t Ink32onion Nice"
>> str2 = "**1\f2\n3star\t7 77\r**"

>> expr = //        ##### add your solution here
>> str1.split(expr)
=> ["lion", "Ink", "onion", "Nice"]
>> str2.split(expr)
=> ["**", "star", "**"]
```

<br>

# Groupings and backreferences

**a)** The given string has fields separated by `:` and each field has a floating point
number followed by a `,` and a string. If the floating point number has only one digit
precision, append `0` and swap the strings separated by `,` for that particular field.

```ruby
>> row = '3.14,hi:42.5,bye:1056.1,cool:00.9,fool'
=> "3.14,hi:42.5,bye:1056.1,cool:00.9,fool"

>> expr = //        ##### add your solution here
>> row.gsub()       ##### add your solution here
=> "3.14,hi:bye,42.50:cool,1056.10:fool,00.90"
```

**b)** Count the number of words that have at least two consecutive repeated alphabets,
for ex: words like `stillness` and `Committee` but not words like `root` or `readable` or `rotational`.
Consider word to be as defined in regular expression parlance and word split across two lines as two
different words.

```ruby
>> require 'open-uri'
>> scarlet_pimpernel_link = 'https://www.gutenberg.org/cache/epub/60/pg60.txt'
>> word = //        ##### add your solution here

>> cnt = 0
>> open(scarlet_pimpernel_link) do |ip_file|
?>   ip_file.each do |line|
?>     cnt += line.scan(/\w+/).count { |w| w.match?(word) }
>>   end
>> end

>> puts cnt
219
```

**c)** Convert the given **markdown** headers to corresponding **anchor** tag.
Consider the input to start with one or more `#` characters followed by space and word characters.
The `name` attribute is constructed by converting the header to lowercase and replacing spaces
with hyphens. Can you do it without using a capture group?

```ruby
>> header1 = '# Regular Expressions'
>> header2 = '## Named capture groups'
>> anchor = //      ##### add your solution here

##### add your solution here for header1
=> "# <a name='regular-expressions'></a>Regular Expressions"

##### add your solution here for header2
=> "## <a name='named-capture-groups'></a>Named capture groups"
```

**d)** Convert the given **markdown** anchors to corresponding **hyperlinks**.

```ruby
>> anchor1 = "# <a name='regular-expressions'></a>Regular Expressions"
>> anchor2 = "## <a name='subexpression-calls'></a>Subexpression calls"
>> hyperlink =      ##### add your solution here

##### add your solution here for anchor1
=> "[Regular Expressions](#regular-expressions)"

##### add your solution here for anchor2
=> "[Subexpression calls](#subexpression-calls)"
```

**e)** Use appropriate regular expression method to get the expected output for given string.

```ruby
>> str1 = "price_42 roast:\t\n:-ice==cat\neast"

##### add your solution here
=> ["price_42", " ", "roast", ":\t\n:-", "ice", "==", "cat", "\n", "east"]
```

**f)** Extract all hex character sequences, with optional prefix. Match the
characters case insensitively, and the sequences shouldn't be surrounded by
other word characters.

```ruby
>> hex_seq = //     ##### add your solution here

>> str1 = '128A foo 0xfe32 34 0xbar'
>> str1.scan(hex_seq)
=> ["128A", "0xfe32", "34"]

>> str2 = '0XDEADBEEF lace 0x0ff1ce bad'
>> str2.scan(hex_seq)
=> ["0XDEADBEEF", "0x0ff1ce", "bad"]
```

<br>

# Lookarounds

**a)** Remove leading and trailing whitespaces from all the individual fields of these csv strings.

```ruby
>> csv1 = ' comma  ,separated ,values '
>> csv2 = 'good bad,nice  ice  , 42 , ,   stall   small'

>> remove_whitespace = //       ##### add your solution here
>> csv1.gsub(remove_whitespace, '')
=> "comma,separated,values"
>> csv2.gsub(remove_whitespace, '')
=> "good bad,nice  ice,42,,stall   small"
```

**b)** Filter all elements that satisfy all of these rules:

* should have at least two alphabets
* should have at least 3 digits
* should have at least one special character among `%` or `*` or `#` or `$`
* should not end with a whitespace character

```ruby
>> pwds = ['hunter2', 'F2H3u%9', "*X3Yz3.14\t", 'r2_d2_42', 'A $B C1234']

>> pwds.grep()      ##### add your solution here
=> ["F2H3u%9", "A $B C1234"]
```

**c)** Match strings if it doesn't contain whitespace or the string `error` between
the strings `qty` and `price`

```ruby
>> str1 = '23,qty,price,42'
>> str2 = 'qty price,oh'
>> str3 = '3.14,qty,6,errors,9,price,3'
>> str4 = 'qty-6,apple-56,price-234,error'

>> neg = //     ##### add your solution here
>> str1.match?(neg)
=> true
>> str2.match?(neg)
=> false
>> str3.match?(neg)
=> false
>> str4.match?(neg)
=> true
```

<br>

# Modifiers

**a)** Delete from the string `start` if it is at beginning of a line up to
the next occurrence of the string `end` at end of a line. Match these keywords
irrespective of case.

```ruby
>> para = %q{good start
start working on that
project you always wanted
to, do not let it end
hi there
start and end the end
42
Start and try to
finish the End
bye}

>> expr = //        ##### add your solution here
>> puts para.gsub(expr, '')
good start

hi there

42

bye
```

**b)** For the given **markdown** file, replace all occurrences of the string `ruby` (irrespective
of case) with the string `Ruby`. However, any match within code blocks that start with whole line
` ```ruby ` and end with whole line ` ``` ` shouldn't be replaced.
Consider the input file to be small enough to fit memory requirements.

Refer to [exercises folder](https://github.com/learnbyexample/Ruby_Regexp/tree/master/exercises) for input files required to solve the exercises.

```ruby
>> ip_str = File.open('sample.md').read
>> expr = //        ##### add your solution here

>> File.open('sample_mod.md', 'w') do |f|
?>   ip_str.split(expr).each_with_index do |s, i|
?>     f.write(i.odd? ? s : s.gsub(/ruby/i) { $&.capitalize })
>>   end
>> end

>> File.open('sample_mod.md').read ==  File.open('expected.md').read
=> true
```

**c)** Write a string method that changes given input to alternate case (starting with lowercase first)

```ruby
>> def aLtErNaTe_CaSe(ip_str)
     ##### add your solution here
>> end

>> aLtErNaTe_CaSe('HI THERE!')
=> "hI tHeRe!"
>> aLtErNaTe_CaSe('good morning')
=> "gOoD mOrNiNg"
>> aLtErNaTe_CaSe('Sample123string42with777numbers')
=> "sAmPlE123sTrInG42wItH777nUmBeRs"
```

<br>

# String Encoding

**a)** Output `true` or `false` depending on input string made up of ASCII characters or not.
Consider the input to be non-empty strings and any character that isn't part of 7-bit ASCII
set should give `false`

```ruby
>> str1 = '123—456'
>> str2 = 'good fοοd'
>> str3 = 'happy learning!'

##### add your solution here for str1
=> false
##### add your solution here for str2
=> false
##### add your solution here for str3
=> true
```

**b)** Retain only punctuation characters for the given strings (generated from codepoints)

```ruby
>> (0..0x7f).to_a.pack('U*')            ##### add your solution here
=> "!\"#%&'()*,-./:;?@[\\]_{}"
>> (0x80..0xff).to_a.pack('U*')         ##### add your solution here
=> "¡§«¶·»¿"
>> (0x2600..0x27eb).to_a.pack('U*')     ##### add your solution here
=> "❨❩❪❫❬❭❮❯❰❱❲❳❴❵⟅⟆⟦⟧⟨⟩⟪⟫"
```

**c)** Is the following code snippet showing the correct outputs?

```ruby
>> 'fox:αλεπού'.scan(/\w+/)
=> ["fox"]

>> 'fox:αλεπού'.scan(/[[:word:]]+/)
=> ["fox", "αλεπού"]
```

<br>

# Miscellaneous

**a)** Count the maximum depth of nested braces for the given string.
Unbalanced or wrongly ordered braces should return `-1`

```ruby
>> def max_nested_braces(ip)
     ##### add your solution here
>> end

>> max_nested_braces('a*b')
=> 0
>> max_nested_braces('}a+b{')
=> -1
>> max_nested_braces('a*b+{}')
=> 1
>> max_nested_braces('{{a+2}*{b+c}+e}')
=> 2
>> max_nested_braces('{{a+2}*{b+{c*d}}+e}')
=> 3
>> max_nested_braces("{{a+2}*{\n{b+{c*d}}+e*d}}")
=> 4
>> max_nested_braces('a*{b+c*{e*3.14}}}')
=> -1
```

**b)** Replace the string `par` with `spar`, `spare` with `extra` and `park` with `garden`

```ruby
##### add your solution here

>> str1 = 'apartment has a park'
>> str1.gsub()      ##### add your solution here
=> "aspartment has a garden"

>> str2 = 'do you have a spare cable'
>> str2.gsub()      ##### add your solution here
=> "do you have a extra cable"

>> str3 = 'write a parser'
>> str3.gsub()      ##### add your solution here
=> "write a sparser"
```

