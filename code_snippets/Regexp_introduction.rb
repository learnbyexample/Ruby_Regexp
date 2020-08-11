## match? method

sentence = 'This is a sample string'

sentence.include?('is')

sentence.include?('z')

sentence.match?(/is/)

sentence.match?(/z/)

sentence = 'This is a sample string'

sentence.match?(/is/, 2)

sentence.match?(/is/, 6)

sentence = 'This is a sample string'

sentence.match?(/this/)

sentence.match?(/this/i)

## Regexp literal reuse and interpolation

pet = /dog/i

pet

'They bought a Dog'.match?(pet)

'A cat crossed their path'.match?(pet)

"cat\tdog".match?(/\t/)

"cat\tdog".match?(/\a/)

greeting = 'hi'

/#{greeting} there/

/#{greeting.upcase} there/

/#{2**4} apples/

## sub and gsub methods

greeting = 'Have a nice weekend'

greeting.sub(/e/, 'E')

greeting.gsub(/e/, 'E')

word = 'cater'

word.sub(/cat/, 'wag')

word

word.sub!(/cat/, 'wag')

word

## Regexp operators

sentence = 'This is a sample string'

sentence =~ /is/

sentence =~ /z/

sentence !~ /z/

sentence !~ /is/

sentence = 'This is a sample string'

puts 'hi' if sentence =~ /is/

puts 'oh' if sentence !~ /z/

sentence = 'This is a sample string'

/is/ === sentence

/z/ === sentence

words = %w[cat attempt tattle]

words.grep(/tt/)

words.all?(/at/)

words.none?(/temp/)

