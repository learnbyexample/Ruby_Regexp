sentence = 'This is a sample string'

sentence.include?('is')

sentence.include?('z')

sentence.match?(/is/)

sentence.match?(/z/)

sentence.match?(/is/, 2)

sentence.match?(/is/, 6)

pet = /dog/

'They bought a dog'.match?(pet)

'A cat crossed their path'.match?(pet)

"cat\tdog".match?(/\t/)

"cat\tdog".match?(/\a/)

greeting = 'hi'

/#{greeting} there/

/#{greeting.upcase} there/

/#{2**4} apples/

sentence = 'This is a sample string'

sentence =~ /is/

sentence =~ /z/

sentence !~ /z/

sentence !~ /is/

puts 'hi' if sentence =~ /is/

puts 'hi' if sentence !~ /z/

sentence = 'This is a sample string'

/is/ === sentence

/z/ === sentence

words = %w[cat parrot whale]

words.all?(/a/)

words.none?(/w/)

