## OR conditional

'I like cats'.match?(/cat|dog/)

'I like dogs'.match?(/cat|dog/)

'I like parrots'.match?(/cat|dog/)

'catapults concatenate cat scat'.gsub(/\Acat|cat\b/, 'X')

'cat dog bee parrot fox'.gsub(/cat|dog|fox/, 'mammal')

## Regexp.union method

Regexp.union('car', 'jeep')

words = %w[cat dog fox]

pat = Regexp.union(words)

pat

'cat dog bee parrot fox'.gsub(pat, 'mammal')

## Grouping

'red reform read arrest'.gsub(/reform|rest/, 'X')

'red reform read arrest'.gsub(/re(form|st)/, 'X')

'par spare part party'.gsub(/\bpar\b|\bpart\b/, 'X')

'par spare part party'.gsub(/\b(par|part)\b/, 'X')

'par spare part party'.gsub(/\bpar(|t)\b/, 'X')

## Regexp.source method

words = %w[cat par]

alt = Regexp.union(words)

alt

alt_w = /\b(#{alt.source})\b/

alt_w

'cater cat concatenate par spare'.gsub(alt, 'X')

'cater cat concatenate par spare'.gsub(alt_w, 'X')

## Precedence rules

words = 'lion elephant are rope not'

words =~ /on/

words =~ /ant/

words.sub(/on|ant/, 'X')

words.sub(/ant|on/, 'X')

mood = 'best years'

mood =~ /year/

mood =~ /years/

mood.sub(/year|years/, 'X')

mood.sub(/years|year/, 'X')

words = 'ear xerox at mare part learn eye'

words.gsub(/ar|are|art/, 'X')

words.gsub(/are|ar|art/, 'X')

words.gsub(/are|art|ar/, 'X')

words = %w[hand handy handful]

alt = Regexp.union(words.sort_by { |w| -w.length })

alt

'hands handful handed handy'.gsub(alt, 'X')

'hands handful handed handy'.gsub(Regexp.union(words), 'X')

