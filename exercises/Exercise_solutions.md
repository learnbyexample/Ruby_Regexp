# Exercise solutions

>![info](../images/info.svg) Refer to [exercises folder](https://github.com/learnbyexample/Ruby_Regexp/tree/master/exercises) for input files required to solve the exercises.

>![info](../images/info.svg) Solutions for [Exercises.md](https://github.com/learnbyexample/Ruby_Regexp/blob/master/exercises/Exercises.md) is presented here.

<br>

# Regexp introduction

**a)** Check whether the given strings contain `0xB0`. Display a boolean result as shown below.

```ruby
>> line1 = 'start address: 0xA0, func1 address: 0xC0'
>> line2 = 'end address: 0xFF, func2 address: 0xB0'

>> line1.match?(/0xB0/)
=> false
>> line2.match?(/0xB0/)
=> true
```

**b)** For the given input file, print all lines containing the string `two`.

```ruby
# note that expected output shown here is wrapped to fit pdf width
>> filename = 'programming_quotes.txt'

>> word = /two/

>> puts File.foreach(filename).grep(word)
"Some people, when confronted with a problem, think - I know, I'll use regular
expressions. Now they have two problems" by Jamie Zawinski
"So much complexity in software comes from trying to make one thing do two
things" by Ryan Singer
```

**c)** Replace all occurrences of `5` with `five` for the given string.

```ruby
>> ip = 'They ate 5 apples and 5 oranges'

>> ip.gsub(/5/, 'five')
=> "They ate five apples and five oranges"
```

**d)** Replace first occurrence of `5` with `five` for the given string.

```ruby
>> ip = 'They ate 5 apples and 5 oranges'

>> ip.sub(/5/, 'five')
=> "They ate five apples and 5 oranges"
```

**e)** For the given array, filter all elements that do *not* contain `e`.

```ruby
>> items = %w[goal new user sit eat dinner]

>> items.grep_v(/e/)
=> ["goal", "sit"]
```

**f)** Replace all occurrences of `note` irrespective of case with `X`.

```ruby
>> ip = 'This note should not be NoTeD'

>> ip.gsub(/note/i, 'X')
=> "This X should not be XD"
```

**g)** For the given input string, print all lines NOT containing the string `2`

```ruby
'> purchases = %q{items qty
'> apple 24
'> mango 50
'> guava 42
'> onion 31
>> water 10}

>> num = /2/

>> puts purchases.each_line.grep_v(num)
items qty
mango 50
onion 31
water 10
```

**h)** For the given array, filter all elements that contains either `a` or `w`.

```ruby
>> items = %w[goal new user sit eat dinner]

>> items.filter { |e| e.match?(/a/) || e.match?(/w/) }
=> ["goal", "new", "eat"]
```

**i)** For the given array, filter all elements that contains both `e` and `n`.

```ruby
>> items = %w[goal new user sit eat dinner]

>> items.filter { |e| e.match?(/e/) && e.match?(/n/) }
=> ["new", "dinner"]
```

**j)** For the given string, replace `0xA0` with `0x7F` and `0xC0` with `0x1F`.

```ruby
>> ip = 'start address: 0xA0, func1 address: 0xC0'

>> ip.gsub(/0xA0/, '0x7F').gsub(/0xC0/, '0x1F')
=> "start address: 0x7F, func1 address: 0x1F"
```

**k)** Find the starting index of the first occurrence of `is` for the given input string.

```ruby
>> ip = 'match this after the history lesson'

>> ip =~ /is/
=> 8
```

<br>

# Anchors

**a)** Check if the given strings start with `be`.

```ruby
>> line1 = 'be nice'
>> line2 = '"best!"'
>> line3 = 'better?'
>> line4 = 'oh no\nbear spotted'

>> pat = /\Abe/

>> pat.match?(line1)
=> true
>> pat.match?(line2)
=> false
>> pat.match?(line3)
=> true
>> pat.match?(line4)
=> false
```

**b)** For the given input string, change only whole word `red` to `brown`

```ruby
>> words = 'bred red spread credible'

>> words.gsub(/\bred\b/, 'brown')
=> "bred brown spread credible"
```

**c)** For the given input array, filter all elements containing `42` surrounded by word characters.

```ruby
>> items = ['hi42bye', 'nice1423', 'bad42', 'cool_42a', 'fake4b']

>> items.grep(/\B42\B/)
=> ["hi42bye", "nice1423", "cool_42a"]
```

**d)** For the given input array, filter all elements that start with `den` or end with `ly`

```ruby
>> items = ['lovely', "1\ndentist", '2 lonely', 'eden', "fly\n", 'dent']

>> items.filter { |e| e.match?(/\Aden/) || e.match?(/ly\z/) }
=> ["lovely", "2 lonely", "dent"]
```

**e)** For the given input string, change whole word `mall` to `1234` only if it is at start of line.

```ruby
'> para = %q{ball fall wall tall
'> mall call ball pall
'> wall mall ball fall
>> mallet wallet malls}

>> puts para.gsub(/^mall\b/, '1234')
ball fall wall tall
1234 call ball pall
wall mall ball fall
mallet wallet malls
```

**f)** For the given array, filter all elements having a line starting with `den` or ending with `ly`.

```ruby
>> items = ['lovely', "1\ndentist", '2 lonely', 'eden', "fly\nfar", 'dent']

>> items.filter { |e| e.match?(/^den/) || e.match?(/ly$/) }
=> ["lovely", "1\ndentist", "2 lonely", "fly\nfar", "dent"]
```

**g)** For the given input array, filter all whole elements `12\nthree` irrespective of case.

```ruby
>> items = ["12\nthree\n", "12\nThree", "12\nthree\n4", "12\nthree"]

>> items.grep(/\A12\nthree\z/i)
=> ["12\nThree", "12\nthree"]
```

**h)** For the given input array, replace `hand` with `X` for all words that start with `hand` followed by at least one word character.

```ruby
>> items = %w[handed hand handy unhanded handle hand-2]

>> items.map { |e| e.sub(/\bhand\B/, 'X') }
=> ["Xed", "hand", "Xy", "unhanded", "Xle", "hand-2"]
```

**i)** For the given input array, filter all elements starting with `h`. Additionally, replace `e` with `X` for these filtered elements.

```ruby
>> items = %w[handed hand handy unhanded handle hand-2]

>> items.filter_map { |e| e.gsub(/e/, 'X') if e.match?(/\Ah/) }
=> ["handXd", "hand", "handy", "handlX", "hand-2"]
```

<br>

# Alternation and Grouping

**a)** For the given input array, filter all elements that start with `den` or end with `ly`

```ruby
>> items = ['lovely', "1\ndentist", '2 lonely', 'eden', "fly\n", 'dent']

>> items.grep(/\Aden|ly\z/)
=> ["lovely", "2 lonely", "dent"]
```

**b)** For the given array, filter all elements having a line starting with `den` or ending with `ly`

```ruby
>> items = ['lovely', "1\ndentist", '2 lonely', 'eden', "fly\nfar", 'dent']

>> items.grep(/^den|ly$/)
=> ["lovely", "1\ndentist", "2 lonely", "fly\nfar", "dent"]
```

**c)** For the given input strings, replace all occurrences of `removed` or `reed` or `received` or `refused` with `X`.

```ruby
>> s1 = 'creed refuse removed read'
>> s2 = 'refused reed redo received'

>> pat = /re(mov|ceiv|fus|)ed/

>> s1.gsub(pat, 'X')
=> "cX refuse X read"
>> s2.gsub(pat, 'X')
=> "X X redo X"
```

**d)** For the given input strings, replace all matches from the array `words` with `A`.

```ruby
>> s1 = 'plate full of slate'
>> s2 = "slated for later, don't be late"
>> words = %w[late later slated]

>> pat = Regexp.union(words.sort_by { |w| -w.length })

>> s1.gsub(pat, 'A')
=> "pA full of sA"
>> s2.gsub(pat, 'A')
=> "A for A, don't be A"
```

**e)** Filter all whole elements from the input array `items` that exactly matches any of the elements present in the array `words`.

```ruby
>> items = ['slate', 'later', 'plate', 'late', 'slates', 'slated ']
>> words = %w[late later slated]

>> pat = Regexp.union(words.sort_by { |w| -w.length })
>> pat = /\A(#{pat.source})\z/

>> items.grep(pat)
=> ["later", "late"]
```

<br>

# Escaping metacharacters

**a)** Transform given input strings to expected output using same logic on both strings.

```ruby
>> str1 = '(9-2)*5+qty/3'
>> str2 = '(qty+4)/2-(9-2)*5+pq/4'

>> str1.gsub('(9-2)*5', '35')
=> "35+qty/3"
>> str2.gsub('(9-2)*5', '35')
=> "(qty+4)/2-35+pq/4"
```

**b)** Replace `(4)\|` with `2` only at the start or end of given input strings.

```ruby
>> s1 = '2.3/(4)\|6 foo 5.3-(4)\|'
>> s2 = '(4)\|42 - (4)\|3'
>> s3 = "two - (4)\\|\n"

>> pat = /\A\(4\)\\\||\(4\)\\\|\z/

>> s1.gsub(pat, '2')
=> "2.3/(4)\\|6 foo 5.3-2"
>> s2.gsub(pat, '2')
=> "242 - (4)\\|3"
>> s3.gsub(pat, '2')
=> "two - (4)\\|\n"
```

**c)** Replace any matching item from given array with `X` for given input strings. Match the elements from `items` literally. Assume no two elements of `items` will result in any matching conflict.

```ruby
>> items = ['a.b', '3+n', 'x\y\z', 'qty||price', '{n}']

>> pat = Regexp.union(items)

>> '0a.bcd'.gsub(pat, 'X')
=> "0Xcd"
>> 'E{n}AMPLE'.gsub(pat, 'X')
=> "EXAMPLE"
>> '43+n2 ax\y\ze'.gsub(pat, 'X')
=> "4X2 aXe"
```

**d)** Replace backspace character `\b` with a single space character for the given input string.

```ruby
>> ip = "123\b456"
>> puts ip
12456

>> ip.gsub(/\x08/, ' ')
=> "123 456"
```

**e)** Replace all occurrences of `\o` with `o`.

```ruby
>> ip = 'there are c\omm\on aspects am\ong the alternati\ons'

>> ip.gsub(/\\o/, 'o')
=> "there are common aspects among the alternations"
```

**f)** Replace any matching item from the array `eqns` with `X` for given the string `ip`. Match the items from `eqns` literally.

```ruby
>> ip = '3-(a^b)+2*(a^b)-(a/b)+3'
>> eqns = %w[(a^b) (a/b) (a^b)+2]

>> pat = Regexp.union(eqns.sort_by { |w| -w.length })

>> ip.gsub(pat, 'X')
=> "3-X*X-X+3"
```

<br>

# Dot metacharacter and Quantifiers

>![info](../images/info.svg) Since `.` metacharacter doesn't match newline character by default, assume that the input strings in the following exercises will not contain newline characters.

**a)** Replace `42//5` or `42/5` with `8` for the given input.

```ruby
>> ip = 'a+42//5-c pressure*3+42/5-14256'

>> ip.gsub(%r{42//?5}, '8')
=> "a+8-c pressure*3+8-14256"
```

**b)** For the array `items`, filter all elements starting with `hand` and ending with at most one more character or `le`.

```ruby
>> items = %w[handed hand handled handy unhand hands handle]

>> items.grep(/\Ahand(.|le)?\z/)
=> ["hand", "handy", "hands", "handle"]
```

**c)** Use `split` method to get the output as shown for the given input strings.

```ruby
>> eqn1 = 'a+42//5-c'
>> eqn2 = 'pressure*3+42/5-14256'
>> eqn3 = 'r*42-5/3+42///5-42/53+a'

>> pat = %r{42//?5}

>> eqn1.split(pat)
=> ["a+", "-c"]
>> eqn2.split(pat)
=> ["pressure*3+", "-14256"]
>> eqn3.split(pat)
=> ["r*42-5/3+42///5-", "3+a"]
```

**d)** For the given input strings, remove everything from the first occurrence of `i` till end of the string.

```ruby
>> s1 = 'remove the special meaning of such constructs'
>> s2 = 'characters while constructing'

>> pat = /i.*/

>> s1.sub(pat, '')
=> "remove the spec"
>> s2.sub(pat, '')
=> "characters wh"
```

**e)** For the given strings, construct a regexp to get output as shown.

```ruby
>> str1 = 'a+b(addition)'
>> str2 = 'a/b(division) + c%d(#modulo)'
>> str3 = 'Hi there(greeting). Nice day(a(b)'

>> remove_parentheses = /\(.*?\)/

>> str1.gsub(remove_parentheses, '')
=> "a+b"
>> str2.gsub(remove_parentheses, '')
=> "a/b + c%d"
>> str3.gsub(remove_parentheses, '')
=> "Hi there. Nice day"
```

**f)** Correct the given regexp to get the expected output.

```ruby
>> words = 'plink incoming tint winter in caution sentient'

# wrong output
>> change = /int|in|ion|ing|inco|inter|ink/
>> words.gsub(change, 'X')
=> "plXk XcomXg tX wXer X cautX sentient"

# expected output
>> change = /in(ter|co|t|g|k)?|ion/
>> words.gsub(change, 'X')
=> "plX XmX tX wX X cautX sentient"
```

**g)** For the given greedy quantifiers, what would be the equivalent form using `{m,n}` representation?

* `?` is same as `{,1}`
* `*` is same as `{0,}`
* `+` is same as `{1,}`

**h)** `(a*|b*)` is same as `(a|b)*` — true or false?

False. Because `(a*|b*)` will match only sequences like `a`, `aaa`, `bb`, `bbbbbbbb`. But `(a|b)*` can match a mixed sequence like `ababbba` too.

**i)** For the given input strings, remove everything from the first occurrence of `test` (irrespective of case) till end of the string, provided `test` isn't at the end of the string.

```ruby
>> s1 = 'this is a Test'
>> s2 = 'always test your RE for corner cases'
>> s3 = 'a TEST of skill tests?'

>> pat = /test.+/i

>> s1.sub(pat, '')
=> "this is a Test"
>> s2.sub(pat, '')
=> "always "
>> s3.sub(pat, '')
=> "a "
```

**j)** For the input array `words`, filter all elements starting with `s` and containing `e` and `t` in any order.

```ruby
>> words = %w[sequoia subtle exhibit asset sets tests site]

>> words.grep(/\As.*(e.*t|t.*e)/)
=> ["subtle", "sets", "site"]
```

**k)** For the input array `words`, remove all elements having less than `6` characters.

```ruby
>> words = %w[sequoia subtle exhibit asset sets tests site]

>> words.grep(/.{6,}/)
=> ["sequoia", "subtle", "exhibit"]
```

**l)** For the input array `words`, filter all elements starting with `s` or `t` and having a maximum of `6` characters.

```ruby
>> words = %w[sequoia subtle exhibit asset sets tests site]

>> words.grep(/\A(s|t).{,5}\z/)
=> ["subtle", "sets", "tests", "site"]
```

**m)** Can you reason out why this code results in the output shown? The aim was to remove all `<characters>` patterns but not the `<>` ones. The expected result was `'a 1<> b 2<> c'`.

The use of `.+` quantifier after `<` means that `<>` cannot be a possible match to satisfy `<.+?>`. So, after matching `<` (which occurs after `1` and `2` in the given input string) the regular expression engine will look for next occurrence of `>` character to satisfy the given pattern. To solve such cases, you need to use character classes, which is discussed in a later chapter, to specify which particular set of characters should be matched by the `+` quantifier instead of `.` metacharacter.

```ruby
>> ip = 'a<apple> 1<> b<bye> 2<> c<cat>'

>> ip.gsub(/<.+?>/, '')
=> "a 1 2"
```

**n)** Use `split` method to get the output as shown below for given input strings.

```ruby
>> s1 = 'go there  ::   this :: that'
>> s2 = 'a::b :: c::d e::f :: 4::5'
>> s3 = '42:: hi::bye::see :: carefully'

>> pat = / +:: +/

>> s1.split(pat, 2)
=> ["go there", "this :: that"]
>> s2.split(pat, 2)
=> ["a::b", "c::d e::f :: 4::5"]
>> s3.split(pat, 2)
=> ["42:: hi::bye::see", "carefully"]
```

**o)** For the given input strings, match if the string starts with optional space characters followed by at least two `#` characters.

```ruby
>> s1 = '   ## header2'
>> s2 = '#### header4'
>> s3 = '# comment'
>> s4 = 'normal string'
>> s5 = 'nope ## not this'

>> pat = /\A *\#{2,}/

>> s1.match?(pat)
=> true
>> s2.match?(pat)
=> true
>> s3.match?(pat)
=> false
>> s4.match?(pat)
=> false
>> s5.match?(pat)
=> false
```

<br>

# Working with matched portions

**a)** For the given strings, extract the matching portion from first `is` to last `t`.

```ruby
>> str1 = 'This the biggest fruit you have seen?'
>> str2 = 'Your mission is to read and practice consistently'

>> pat = /is.*t/

>> str1[pat]
=> "is the biggest fruit"
>> str2[pat]
=> "ission is to read and practice consistent"
```

**b)** Find the starting index of first occurrence of `is` or `the` or `was` or `to` for the given input strings.

```ruby
>> s1 = 'match after the last newline character'
>> s2 = 'and then you want to test'
>> s3 = 'this is good bye then'
>> s4 = 'who was there to see?'

>> pat = /is|the|was|to/

>> s1 =~ pat
=> 12
>> s2 =~ pat
=> 4
>> s3 =~ pat
=> 2
>> s4 =~ pat
=> 4
```

**c)** Find the starting index of last occurrence of `is` or `the` or `was` or `to` for the given input strings.

```ruby
>> s1 = 'match after the last newline character'
>> s2 = 'and then you want to test'
>> s3 = 'this is good bye then'
>> s4 = 'who was there to see?'

>> pat = /.*(is|the|was|to)/

>> s1.match(pat).begin(1)
=> 12
>> s2.match(pat).begin(1)
=> 18
>> s3.match(pat).begin(1)
=> 17
>> s4.match(pat).begin(1)
=> 14
```

**d)** The given input string contains `:` exactly once. Extract all characters after the `:` as output.

```ruby
>> ip = 'fruits:apple, mango, guava, blueberry'

# can also use: ip[/:(.*)/, 1]
>> ip.match(/:(.*)/)[1]
'apple, mango, guava, blueberry'
```

**e)** The given input strings contains some text followed by `-` followed by a number. Replace that number with its `log` value using `Math.log()`.

```ruby
>> s1 = 'first-3.14'
>> s2 = 'next-123'

>> pat = /-(.+)/

>> s1.sub(pat) { "-#{Math.log($1.to_f)}" }
=> "first-1.144222799920162"
>> s2.sub(pat) { "-#{Math.log($1.to_f)}" }
=> "next-4.812184355372417"
```

**f)** Replace all occurrences of `par` with `spar`, `spare` with `extra` and `park` with `garden` for the given input strings.

```ruby
>> str1 = 'apartment has a park'
>> str2 = 'do you have a spare cable'
>> str3 = 'write a parser'

>> pat = /park?|spare/
>> h = { 'par' => 'spar', 'spare' => 'extra', 'park' => 'garden' }

>> str1.gsub(pat, h)
=> "aspartment has a garden"
>> str2.gsub(pat, h)
=> "do you have a extra cable"
>> str3.gsub(pat, h)
=> "write a sparser"
```

**g)** Extract all words between `(` and `)` from the given input string as an array. Assume that the input will not contain any broken parentheses.

```ruby
>> ip = 'another (way) to reuse (portion) matched (by) capture groups'

# as nested array output
>> ip.scan(/\((.*?)\)/)
=> [["way"], ["portion"], ["by"]]

# as array of strings output
>> ip.gsub(/\((.*?)\)/).map { $1 }
=> ["way", "portion", "by"]
```

**h)** Extract all occurrences of `<` up to next occurrence of `>`, provided there is at least one character in between `<` and `>`.

```ruby
>> ip = 'a<apple> 1<> b<bye> 2<> c<cat>'

>> ip.scan(/<.+?>/)
=> ["<apple>", "<> b<bye>", "<> c<cat>"]
```

**i)** Use `scan` to get the output as shown below for the given input strings. Note the characters used in the input strings carefully.

```ruby
>> row1 = '-2,5 4,+3 +42,-53 4356246,-357532354 '
>> row2 = '1.32,-3.14 634,5.63 63.3e3,9907809345343.235 '

>> pat = /(.+?),(.+?) /

>> row1.scan(pat)
=> [["-2", "5"], ["4", "+3"], ["+42", "-53"], ["4356246", "-357532354"]]
>> row2.scan(pat)
=> [["1.32", "-3.14"], ["634", "5.63"], ["63.3e3", "9907809345343.235"]]
```

**j)** This is an extension to the previous question.

* For `row1`, find the sum of integers of each array element. For example, sum of `-2` and `5` is `3`.
* For `row2`, find the sum of floating-point numbers of each array element. For example, sum of `1.32` and `-3.14` is `-1.82`.

```ruby
>> row1 = '-2,5 4,+3 +42,-53 4356246,-357532354 '
>> row2 = '1.32,-3.14 634,5.63 63.3e3,9907809345343.235 '

# should be same as previous question
>> pat = /(.+?),(.+?) /

>> row1.scan(pat).map { |a, b| a.to_i + b.to_i }
=> [3, 7, -11, -353176108]

>> row2.scan(pat).map { |a, b| a.to_f + b.to_f }
=> [-1.82, 639.63, 9907809408643.234]
```

**k)** Use `split` method to get the output as shown below.

```ruby
>> ip = '42:no-output;1000:car-truck;SQEX49801'

>> ip.split(/:.+?-(.+?);/)
=> ["42", "output", "1000", "truck", "SQEX49801"]
```

**l)** Convert the comma separated strings to corresponding `hash` objects as shown below. Note that the input strings have an extra `,` at the end.

```ruby
>> row1 = 'name:rohan,maths:75,phy:89,'
>> row2 = 'name:rose,maths:88,phy:92,'

>> pat = /(.+?):(.+?),/

>> row1.scan(pat).to_h
=> {"name"=>"rohan", "maths"=>"75", "phy"=>"89"}
>> row2.scan(pat).to_h
=> {"name"=>"rose", "maths"=>"88", "phy"=>"92"}
```

<br>

# Character class

**a)** For the array `items`, filter all elements starting with `hand` and ending with `s` or `y` or `le`.

```ruby
>> items = %w[-handy hand handy unhand hands handle]

>> items.grep(/\Ahand([sy]|le)\z/)
=> ["handy", "hands", "handle"]
```

**b)** Replace all whole words `reed` or `read` or `red` with `X`.

```ruby
>> ip = 'redo red credible :read: rod reed'

>> ip.gsub(/\bre[ae]?d\b/, 'X')
=> "redo X credible :X: rod X"
```

**c)** For the array `words`, filter all elements containing `e` or `i` followed by `l` or `n`. Note that the order mentioned should be followed.

```ruby
>> words = %w[surrender unicorn newer door empty eel pest]

>> words.grep(/[ei].*[ln]/)
=> ["surrender", "unicorn", "eel"]
```

**d)** For the array `words`, filter all elements containing `e` or `i` and `l` or `n` in any order.

```ruby
>> words = %w[surrender unicorn newer door empty eel pest]

>> words.grep(/[ei].*[ln]|[ln].*[ei]/)
=> ["surrender", "unicorn", "newer", "eel"]
```

**e)** Convert the comma separated strings to corresponding `hash` objects as shown below.

```ruby
>> row1 = 'name:rohan,maths:75,phy:89'
>> row2 = 'name:rose,maths:88,phy:92'

>> pat = /([^:]+):([^,]+),?/

>> row1.scan(pat).to_h
=> {"name"=>"rohan", "maths"=>"75", "phy"=>"89"}
>> row2.scan(pat).to_h
=> {"name"=>"rose", "maths"=>"88", "phy"=>"92"}
```

**f)** Delete from `(` to the next occurrence of `)` unless they contain parentheses characters in between.

```ruby
>> str1 = 'def factorial()'
>> str2 = 'a/b(division) + c%d(#modulo) - (e+(j/k-3)*4)'
>> str3 = 'Hi there(greeting). Nice day(a(b)'

>> remove_parentheses = /\([^()]*\)/

>> str1.gsub(remove_parentheses, '')
=> "def factorial"
>> str2.gsub(remove_parentheses, '')
=> "a/b + c%d - (e+*4)"
>> str3.gsub(remove_parentheses, '')
=> "Hi there. Nice day(a"
```

**g)** For the array `words`, filter all elements not starting with `e` or `p` or `u`.

```ruby
>> words = %w[surrender unicorn newer door empty eel pest]

>> words.grep(/\A[^epu]/)
=> ["surrender", "newer", "door"]
```

**h)** For the array `words`, filter all elements not containing `u` or `w` or `ee` or `-`.

```ruby
>> words = %w[p-t you tea heel owe new reed ear]

>> words.grep_v(/[uw-]|ee/)
=> ["tea", "ear"]
```

**i)** The given input strings contain fields separated by `,` and fields can be empty too. Replace last three fields with `WHTSZ323`.

```ruby
>> row1 = '(2),kite,12,,D,C,,'
>> row2 = 'hi,bye,sun,moon'

>> pat = /(,[^,]*){3}\z/

>> row1.sub(pat, ',WHTSZ323')
=> "(2),kite,12,,D,WHTSZ323"
>> row2.sub(pat, ',WHTSZ323')
=> "hi,WHTSZ323"
```

**j)** Split the given strings based on consecutive sequence of digit or whitespace characters.

```ruby
>> str1 = "lion \t Ink32onion Nice"
>> str2 = "**1\f2\n3star\t7 77\r**"

>> pat = /[\d\s]+/

>> str1.split(pat)
=> ["lion", "Ink", "onion", "Nice"]
>> str2.split(pat)
=> ["**", "star", "**"]
```

**k)** Delete all occurrences of the sequence `<characters>` where `characters` is one or more non `>` characters and cannot be empty.

```ruby
>> ip = 'a<apple> 1<> b<bye> 2<> c<cat>'

>> ip.gsub(/<[^>]+>/, '')
=> "a 1<> b 2<> c"
```

**l)** `\b[a-z](on|no)[a-z]\b` is same as `\b[a-z][on]{2}[a-z]\b`. True or False? Sample input lines shown below might help to understand the differences, if any.

False. `[on]{2}` will also match `oo` and `nn`.

```ruby
>> puts "known\nmood\nknow\npony\ninns"
known
mood
know
pony
inns
```

**m)** For the given array, filter all elements containing any number sequence greater than `624`.

```ruby
>> items = ['h0000432ab', 'car00625', '42_624 0512', '96 foo1234baz 3.14 2']

>> items.filter { |e| e.gsub(/\d+/).any? { $&.to_i > 624 } }
=> ["car00625", "96 foo1234baz 3.14 2"]
```

**n)** Count the maximum depth of nested braces for the given strings. Unbalanced or wrongly ordered braces should return `-1`. Note that this will require a mix of regular expressions and Ruby code.

```ruby
?> def max_nested_braces(ip)
?>   cnt = 0
?>   cnt += 1 while ip.gsub!(/\{[^{}]*\}/, '')
?>   return ip.match?(/[{}]/) ? -1 : cnt
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

**o)** By default, `split` method will split on whitespace and remove empty strings from the result. Which regexp based method would you use to replicate this functionality?

```ruby
>> ip = " \t\r  so  pole\t\t\t\n\nlit in to \r\n\v\f  "

>> ip.split
=> ["so", "pole", "lit", "in", "to"]

>> ip.scan(/\S+/)
=> ["so", "pole", "lit", "in", "to"]
```

**p)** Convert the given input string to two different arrays as shown below. You can optimize the regexp based on characters present in the input string.

```ruby
>> ip = "price_42 roast^\t\n^-ice==cat\neast"

>> ip.split(/\W+/)
=> ["price_42", "roast", "ice", "cat", "east"]

>> ip.split(/(\W+)/)
=> ["price_42", " ", "roast", "^\t\n^-", "ice", "==", "cat", "\n", "east"]
```

**q)** Filter all elements whose first non-whitespace character is not a `#` character. Any element made up of only whitespace characters should be ignored as well.

```ruby
>> items = ['    #comment', "\t\napple #42", '#oops', 'sure', 'no#1', "\t\r\f"]

# can also use: items.grep(/\A\s*[^#\s]/)
>> items.grep(/\A\s*+[^#]/)
=> ["\t\napple #42", "sure", "no#1"]
```

**r)** Extract all whole words for the given input strings. However, based on user input `ignore`, do not match words if they contain any character present in the `ignore` variable. Assume that `ignore` variable will not contain any regexp metacharacter.

```ruby
>> s1 = 'match after the last newline character'
>> s2 = 'and then you want to test'

>> ignore = 'aty'
>> pat = /\b[\w&&[^#{ignore}]]+\b/
>> s1.scan(pat)
=> ["newline"]
>> s2.scan(pat)
=> []

>> ignore = 'esw'
>> pat = /\b[\w&&[^#{ignore}]]+\b/
>> s1.scan(pat)
=> ["match"]
>> s2.scan(pat)
=> ["and", "you", "to"]
```

<br>

# Groupings and backreferences

**a)** Replace the space character that occurs after a word ending with `a` or `r` with a newline character.

```ruby
>> ip = 'area not a _a2_ roar took 22'

>> puts ip.gsub(/([ar]) /, "\\1\n")
area
not a
_a2_ roar
took 22
```

**b)** Add `[]` around words starting with `s` and containing `e` and `t` in any order.

```ruby
>> ip = 'sequoia subtle exhibit asset sets tests site'

>> ip.gsub(/\bs\w*(t\w*e|e\w*t)\w*/, '[\0]')
=> "sequoia [subtle] exhibit asset [sets] tests [site]"
```

**c)** Replace all whole words with `X` that start and end with the same word character. Single character word should get replaced with `X` too, as it satisfies the stated condition.

```ruby
>> ip = 'oreo not a _a2_ roar took 22'

>> ip.gsub(/\b(\w|(\w)\w*\2)\b/, 'X')
=> "X not X X X took X"
```

**d)** Convert the given **markdown** headers to corresponding **anchor** tag. Consider the input to start with one or more `#` characters followed by space and word characters. The `name` attribute is constructed by converting the header to lowercase and replacing spaces with hyphens. Can you do it without using a capture group?

```ruby
>> header1 = '# Regular Expressions'
>> header2 = '## Named capture groups'

>> anchor = /\w.*/

>> header1.sub(anchor) { "<a name='#{$&.downcase.tr(' ', '-')}'></a>#{$&}" }
=> "# <a name='regular-expressions'></a>Regular Expressions"
>> header2.sub(anchor) { "<a name='#{$&.downcase.tr(' ', '-')}'></a>#{$&}" }
=> "## <a name='named-capture-groups'></a>Named capture groups"
```

**e)** Convert the given **markdown** anchors to corresponding **hyperlinks**.

```ruby
>> anchor1 = "# <a name='regular-expressions'></a>Regular Expressions"
>> anchor2 = "## <a name='subexpression-calls'></a>Subexpression calls"

>> hyperlink = %r{[^']+'([^']+)'></a>(.+)}

>> anchor1.sub(hyperlink, '[\2](#\1)')
=> "[Regular Expressions](#regular-expressions)"
>> anchor2.sub(hyperlink, '[\2](#\1)')
=> "[Subexpression calls](#subexpression-calls)"
```

**f)** Count the number of whole words that have at least two occurrences of consecutive repeated alphabets. For example, words like `stillness` and `Committee` should be counted but not words like `root` or `readable` or `rotational`.

```ruby
'> ip = %q{oppressed abandon accommodation bloodless
'> carelessness committed apparition innkeeper
'> occasionally afforded embarrassment foolishness
'> depended successfully succeeded
>> possession cleanliness suppress}

>> ip.scan(/\b(\w*(\w)\2){2}\w*\b/).size
=> 13
```

**g)** For the given input string, replace all occurrences of digit sequences with only the unique non-repeating sequence. For example, `232323` should be changed to `23` and `897897` should be changed to `897`. If there no repeats (for example `1234`) or if the repeats end prematurely (for example `12121`), it should not be changed.

```ruby
>> ip = '1234 2323 453545354535 9339 11 60260260'

>> ip.gsub(/\b(\d+)\1+\b/, '\1')
=> "1234 23 4535 9339 1 60260260"
```

**h)** Replace sequences made up of words separated by `:` or `.` by the first word of the sequence. Such sequences will end when `:` or `.` is not followed by a word character.

```ruby
>> ip = 'wow:Good:2_two:five: hi-2 bye kite.777.water.'

>> ip.gsub(/(\w+)[:.](\w+[:.])+/, '\1')
=> "wow hi-2 bye kite"
```

**i)** Replace sequences made up of words separated by `:` or `.` by the last word of the sequence. Such sequences will end when `:` or `.` is not followed by a word character.

```ruby
>> ip = 'wow:Good:2_two:five: hi-2 bye kite.777.water.'

>> ip.gsub(/((\w+)[:.])+/, '\2')
=> "five hi-2 bye water"
```

**j)** Split the given input string on one or more repeated sequence of `cat`.

```ruby
>> ip = 'firecatlioncatcatcatbearcatcatparrot'

>> ip.split(/(?:cat)+/)
=> ["fire", "lion", "bear", "parrot"]
```

**k)** For the given input string, find all occurrences of digit sequences with at least one repeating sequence. For example, `232323` and `897897`. If the repeats end prematurely, for example `12121`, it should not be matched.

```ruby
>> ip = '1234 2323 453545354535 9339 11 60260260'

>> pat = /\b(\d+)\1+\b/

# entire sequences in the output
>> ip.gsub(pat).map { $& }
=> ["2323", "453545354535", "11"]

# only the unique sequence in the output
>> ip.gsub(pat).map { $1 }
=> ["23", "4535", "1"]
```

**l)** Convert the comma separated strings to corresponding `hash` objects as shown below. The keys are `name`, `maths` and `phy` for the three fields in the input strings.

```ruby
>> row1 = 'rohan,75,89'
>> row2 = 'rose,88,92'

>> pat = /(?<name>[^,]+),(?<maths>[^,]+),(?<phy>[^,]+)/

>> row1.match(pat).named_captures
=> {"name"=>"rohan", "maths"=>"75", "phy"=>"89"}
>> row2.match(pat).named_captures
=> {"name"=>"rose", "maths"=>"88", "phy"=>"92"}
```

**m)** Surround all whole words with `()`. Additionally, if the whole word is `imp` or `ant`, delete them. Can you do it with single substitution?

```ruby
>> ip = 'tiger imp goat eagle ant important'

>> ip.gsub(/\b(?:imp|ant|(\w+))\b/, '(\1)')
=> "(tiger) () (goat) (eagle) () (important)"
```

**n)** Filter all elements that contains a sequence of lowercase alphabets followed by `-` followed by digits. They can be optionally surrounded by `{{` and `}}`. Any partial match shouldn't be part of the output.

```ruby
>> ip = %w[{{apple-150}} {{mango2-100}} {{cherry-200 grape-87 {{go-to}}]

>> ip.grep(/\A({{)?[a-z]+-\d+(?(1)}})\z/)
=> ["{{apple-150}}", "grape-87"]
```

**o)** Extract all hex character sequences, with `0x` optional prefix. Match the characters case insensitively, and the sequences shouldn't be surrounded by other word characters.

```ruby
>> str1 = '128A foo 0xfe32 34 0xbar'
>> str2 = '0XDEADBEEF place 0x0ff1ce bad'

>> hex_seq = /\b(?:0x)?\h+\b/i

>> str1.scan(hex_seq)
=> ["128A", "0xfe32", "34"]
>> str2.scan(hex_seq)
=> ["0XDEADBEEF", "0x0ff1ce", "bad"]
```

**p)** Replace sequences made up of words separated by `:` or `.` by the first/last word of the sequence and the separator. Such sequences will end when `:` or `.` is not followed by a word character.

```ruby
>> ip = 'wow:Good:2_two:five: hi-2 bye kite.777.water.'

# first word of the sequence
>> ip.gsub(/((\w+[:.]))\g<2>+/, '\1')
=> "wow: hi-2 bye kite."

# last word of the sequence
>> ip.gsub(/(\w+[:.])\g<1>+/, '\1')
=> "five: hi-2 bye water."
```

**q)** For the given input strings, extract `if` followed by any number of nested parentheses. Assume that there will be only one such pattern per input string.

```ruby
>> ip1 = 'for (((i*3)+2)/6) if(3-(k*3+4)/12-(r+2/3)) while()'
>> ip2 = 'if+while if(a(b)c(d(e(f)1)2)3) for(i=1)'

>> pat = /if(\((?:[^()]++|\g<1>)++\))/

>> ip1[pat]
=> "if(3-(k*3+4)/12-(r+2/3))"
>> ip2[pat]
=> "if(a(b)c(d(e(f)1)2)3)"
```

<br>

# Lookarounds

>![info](../images/info.svg) Please use lookarounds for solving the following exercises even if you can do it without lookarounds. Unless you cannot use lookarounds for cases like variable length lookbehinds.

**a)** Replace all whole words with `X` unless it is preceded by `(` character.

```ruby
>> ip = '(apple) guava berry) apple (mango) (grape'

>> ip.gsub(/(?<!\()\b\w+/, 'X')
=> "(apple) X X) X (mango) (grape"
```

**b)** Replace all whole words with `X` unless it is followed by `)` character.

```ruby
>> ip = '(apple) guava berry) apple (mango) (grape'

>> ip.gsub(/\b\w+\b(?!\))/, 'X')
=> "(apple) X berry) X (mango) (X"
```

**c)** Replace all whole words with `X` unless it is preceded by `(` or followed by `)` characters.

```ruby
>> ip = '(apple) guava berry) apple (mango) (grape'

>> ip.gsub(/(?<!\()\b\w+\b(?!\))/, 'X')
=> "(apple) X berry) X (mango) (grape"
```

**d)** Extract all whole words that do not end with `e` or `n`.

```ruby
>> ip = 'at row on urn e note dust n'

>> ip.scan(/\b\w+\b(?<![en])/)
=> ["at", "row", "dust"]
```

**e)** Extract all whole words that do not start with `a` or `d` or `n`.

```ruby
>> ip = 'at row on urn e note dust n'

>> ip.scan(/(?![adn])\b\w+\b/)
=> ["row", "on", "urn", "e"]
```

**f)** Extract all whole words only if they are followed by `:` or `,` or `-`.

```ruby
>> ip = 'poke,on=-=so:ink.to/is(vast)ever-sit'

>> ip.scan(/\w+(?=[:,-])/)
=> ["poke", "so", "ever"]
```

**g)** Extract all whole words only if they are preceded by `=` or `/` or `-`.

```ruby
>> ip = 'poke,on=-=so:ink.to/is(vast)ever-sit'

# can also use: ip.scan(%r{[=/-]\K\w+})
>> ip.scan(%r{(?<=[=/-])\w+})
=> ["so", "is", "sit"]
```

**h)** Extract all whole words only if they are preceded by `=` or `:` and followed by `:` or `.`.

```ruby
>> ip = 'poke,on=-=so:ink.to/is(vast)ever-sit'

# can also use: ip.scan(/[=:]\K\w+(?=[:.])/)
>> ip.scan(/(?<=[=:])\w+(?=[:.])/)
=> ["so", "ink"]
```

**i)** Extract all whole words only if they are preceded by `=` or `:` or `.` or `(` or `-` and not followed by `.` or `/`.

```ruby
>> ip = 'poke,on=-=so:ink.to/is(vast)ever-sit'

# can also use: ip.scan(%r{[=:.(-]\K\w+\b(?![/.])})
>> ip.scan(%r{(?<=[=:.(-])\w+\b(?![/.])})
=> ["so", "vast", "sit"]
```

**j)** Remove leading and trailing whitespaces from all the individual fields where `,` is the field separator.

```ruby
>> csv1 = " comma  ,separated ,values \t\r "
>> csv2 = 'good bad,nice  ice  , 42 , ,   stall   small'

>> remove_whitespace = /(?<![^,])\s+|\s+(?![^,])/

>> csv1.gsub(remove_whitespace, '')
=> "comma,separated,values"
>> csv2.gsub(remove_whitespace, '')
=> "good bad,nice  ice,42,,stall   small"
```

**k)** Filter all elements that satisfy all of these rules:

* should have at least two alphabets
* should have at least 3 digits
* should have at least one special character among `%` or `*` or `#` or `$`
* should not end with a whitespace character

```ruby
>> pwds = ['hunter2', 'F2H3u%9', "*X3Yz3.14\t", 'r2_d2_42', 'A $B C1234']

>> rule_chk = /(?=(.*[a-zA-Z]){2})(?=(.*\d){3})(?!.*\s\z).*[%*#$]/

>> pwds.grep(rule_chk)
=> ["F2H3u%9", "A $B C1234"]
```

**l)** For the given string, surround all whole words with `{}` except for whole words `par` and `cat` and `apple`.

```ruby
>> ip = 'part; cat {super} rest_42 par scatter apple spar'

>> ip.gsub(/\b(?!(?:par|cat|apple)\b)\w+\b/, '{\0}')
=> "{part}; cat {{super}} {rest_42} par {scatter} apple {spar}"
```

**m)** Extract integer portion of floating-point numbers for the given string. A number ending with `.` and no further digits should not be considered.

```ruby
>> ip = '12 ab32.4 go 5 2. 46.42 5'

>> ip.scan(/\d+(?=\.\d+)/)
=> ["32", "46"]
```

**n)** For the given input strings, extract all overlapping two character sequences.

```ruby
>> s1 = 'apple'
>> s2 = '1.2-3:4'

>> pat = /.(?=(.))/

>> s1.gsub(pat).map { $& + $1 }
=> ["ap", "pp", "pl", "le"]
>> s2.gsub(pat).map { $& + $1 }
=> ["1.", ".2", "2-", "-3", "3:", ":4"]
```

**o)** The given input strings contain fields separated by `:` character. Delete `:` and the last field if there is a digit character anywhere before the last field.

```ruby
>> s1 = '42:cat'
>> s2 = 'twelve:a2b'
>> s3 = 'we:be:he:0:a:b:bother'

>> pat = /(\d.*):.*/

>> s1.sub(pat, '\1')
=> "42"
>> s2.sub(pat, '\1')
=> "twelve:a2b"
>> s3.sub(pat, '\1')
=> "we:be:he:0:a:b"
```

**p)** Extract all whole words unless they are preceded by `:` or `<=>` or `----` or `#`.

```ruby
>> ip = '::very--at<=>row|in.a_b#b2c=>lion----east'

>> ip.scan(/(?<![:#]|<=>|-{4})\b\w+/)
=> ["at", "in", "a_b", "lion"]
```

**q)** Match strings if it contains `qty` followed by `price` but not if there is **whitespace** or the string `error` between them.

```ruby
>> str1 = '23,qty,price,42'
>> str2 = 'qty price,oh'
>> str3 = '3.14,qty,6,errors,9,price,3'
>> str4 = "42\nqty-6,apple-56,price-234,error"
>> str5 = '4,price,3.14,qty,4'

# can also use: neg = /qty((?!\s|error).)*price/
>> neg = /qty(?~\s|error)price/

>> str1.match?(neg)
=> true
>> str2.match?(neg)
=> false
>> str3.match?(neg)
=> false
>> str4.match?(neg)
=> true
>> str5.match?(neg)
=> false
```

**r)** Can you reason out why the output shown is different for these two regular expressions?

`\b` matches both the start and end of word locations. In the below example, `\b..\b` doesn't necessarily mean that first `\b` will match only the start of word location and second `\b` will match only the end of word location. They can be any combination! For example, `I` followed by space in the input string here is using start of word location for both whereas space followed by `2` is using end of word location for both.

In contrast, the negative lookarounds only ensure that there are no word characters around any two characters. And these assertions will always be satisfied at the start of string and the end of string respectively. But `\b` depends on the presence of word characters. So, `!` at the end of the input string here matches the lookaround assertion but not word boundary.

```ruby
>> ip = 'I have 12, he has 2!'

>> ip.gsub(/\b..\b/, '{\0}')
=> "{I }have {12}{, }{he} has{ 2}!"

>> ip.gsub(/(?<!\w)..(?!\w)/, '{\0}')
=> "I have {12}, {he} has {2!}"
```

**s)** The given input string has fields separated by `:` character. Delete all fields, including the separator, unless the field contains a digit character. Stop deleting once a field with digit character is found.

```ruby
>> row1 = 'vast:a2b2:ride:in:awe:b2b:3list:end'
>> row2 = 'um:no:low:3e:s4w:seer'
>> row3 = 'thr33:f0ur'

>> pat = /\G[^\d:]+:/

>> row1.gsub(pat, '')
=> "a2b2:ride:in:awe:b2b:3list:end"
>> row2.gsub(pat, '')
=> "3e:s4w:seer"
>> row3.gsub(pat, '')
=> "thr33:f0ur"
```

<br>

# Modifiers

**a)** Remove from first occurrence of `hat` to last occurrence of `ice` for the given input strings. Match these markers case insensitively.

```ruby
>> s1 = "But Cool THAT\nsee What okay\nwow quite"
>> s2 = 'it this hat is sliced HIT.'

>> pat = /hat.*it/im

>> s1.sub(pat, '')
=> "But Cool Te"
>> s2.sub(pat, '')
=> "it this ."
```

**b)** Delete from the string `start` if it is at the beginning of a line up to the next occurrence of the string `end` at the end of a line. Match these keywords irrespective of case.

```ruby
'> para = %q{good start
'> start working on that
'> project you always wanted
'> to, do not let it end
'> hi there
'> start and end the end
'> 42
'> Start and try to
'> finish the End
>> bye}

>> pat = /^start.*?end$/im

>> puts para.gsub(pat, '')
good start

hi there

42

bye
```

**c)** For the given **markdown** file, replace all occurrences of the string `ruby` (irrespective of case) with the string `Ruby`. However, any match within code blocks that start with whole line ` ```ruby ` and end with whole line ` ``` ` shouldn't be replaced. Consider the input file to be small enough to fit memory requirements.

Refer to [exercises folder](https://github.com/learnbyexample/Ruby_Regexp/tree/master/exercises) for input files required to solve the exercises.

```ruby
>> ip_str = File.open('sample.md').read
>> pat = /(^```ruby$.*?^```$)/m

>> File.open('sample_mod.md', 'w') do |f|
?>   ip_str.split(pat).each_with_index do |s, i|
?>     f.write(i.odd? ? s : s.gsub(/ruby/i) { $&.capitalize })
>>   end
>> end

>> File.open('sample_mod.md').read == File.open('expected.md').read
=> true
```

**d)** Write a string method that changes given input to alternate case (starting with lowercase first).

```ruby
?> def aLtErNaTe_CaSe(ip_str)
?>   b = true
?>   return ip_str.gsub(/[a-z]/i) { (b = !b) ? $&.upcase : $&.downcase }
>> end

>> aLtErNaTe_CaSe('HI THERE!')
=> "hI tHeRe!"
>> aLtErNaTe_CaSe('good morning')
=> "gOoD mOrNiNg"
>> aLtErNaTe_CaSe('Sample123string42with777numbers')
=> "sAmPlE123sTrInG42wItH777nUmBeRs"
```

**e)** For the given input strings, match all of these three patterns:

* `This` case sensitively
* `nice` and `cool` case insensitively

```ruby
>> s1 = 'This is nice and Cool'
>> s2 = 'Nice and cool this is'
>> s3 = 'What is so nice and cool about This?'

>> pat = /(?=.*nice)(?=.*cool)(?-i:.*This)/i

>> s1.match?(pat)
=> true
>> s2.match?(pat)
=> false
>> s3.match?(pat)
=> true
```

**f)** For the given input strings, match if the string begins with `Th` and also contains a line that starts with `There`.

```ruby
>> s1 = "There there\nHave a cookie"
>> s2 = "This is a mess\nYeah?\nThereeeee"
>> s3 = "Oh\nThere goes the fun"

>> pat = /\A(?=Th)(?m:.*^There)/

>> s1.match?(pat)
=> true
>> s2.match?(pat)
=> true
>> s3.match?(pat)
=> false
```

<br>

# Unicode

**a)** Output `true` or `false` depending on input string made up of ASCII characters or not. Consider the input to be non-empty strings and any character that isn't part of 7-bit ASCII set should give `false`

```ruby
>> str1 = '123—456'
>> str2 = 'good fοοd'
>> str3 = 'happy learning!'

# can also use ! str1.match?(/[^\u{00}-\u{7f}]/)
>> str1.ascii_only?
=> false
>> str2.ascii_only?
=> false
>> str3.ascii_only?
=> true
```

**b)** Retain only punctuation characters for the given strings (generated from codepoints). Use Unicode character set definition for punctuation for solving this exercise.

```ruby
>> s1 = (0..0x7f).to_a.pack('U*')
>> s2 = (0x80..0xff).to_a.pack('U*')
>> s3 = (0x2600..0x27eb).to_a.pack('U*')

>> pat = /\p{^P}/

>> s1.gsub(pat, '')
=> "!\"#%&'()*,-./:;?@[\\]_{}"
>> s2.gsub(pat, '')
=> "¡§«¶·»¿"
>> s3.gsub(pat, '')
=> "❨❩❪❫❬❭❮❯❰❱❲❳❴❵⟅⟆⟦⟧⟨⟩⟪⟫"
```

**c)** Explore the following Q&A threads.

* [stackoverflow: remove emoji from string](https://stackoverflow.com/questions/24672834/how-do-i-remove-emoji-from-string)
* [stackoverflow: why am I seeing different results for these two nearly identical regexp](https://stackoverflow.com/questions/13573136/why-am-i-seeing-different-results-for-these-two-nearly-identical-ruby-regex-patt)
* [stackoverflow: convert unicode number to integer](https://stackoverflow.com/questions/37338708/convert-unicode-number-to-integer-in-ruby)
* [stackoverflow: replacing %uXXXX to the corresponding unicode codepoint](https://stackoverflow.com/questions/28773392/replacing-uxxxx-to-the-corresponding-unicode-codepoint-in-ruby)

