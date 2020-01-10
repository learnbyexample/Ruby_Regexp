%w[cute cat cot coat cost scuttle].grep(/c[ou]t/)

'meeting cute boat site foot'.gsub(/[aeo]+t/, 'X')

'Sample123string42with777numbers'.scan(/[0123456789]+/)

'Sample123string42with777numbers'.scan(/[0-9]+/)

'coat Bin food tar12 best'.scan(/\b[a-z]+\b/)

'coat Bin food tar12 best'.scan(/\b[a-z0-9]+\b/)

'coat tin food put stoop best'.scan(/\b[p-z][a-z]*\b/)

'coat tin food put stoop best'.scan(/\b[a-fp-t]+\b/)

'23 154 12 26 98234'.scan(/\b[12][0-9]\b/)

'23 154 12 26 98234'.scan(/\b[0-9]{3,}\b/)

'0501 035 154 12 26 98234'.scan(/\b0*+[0-9]{3,}\b/)

'45 349 651 593 4 204'.gsub(/[0-9]+/) { $&.to_i < 350 ? 0 : 1 }

'45 349 651 593 4 204'.gsub(/[0-9]+/) { (200..650) === $&.to_i ? 0 : 1 }

'Sample123string42with777numbers'.scan(/[^0-9]+/)

'foo=42; baz=123'.sub(/\A[^=]+/, '')

'foo:123:bar:baz'.sub(/\A([^:]+:){2}/, '')

'foo=42; baz=123'.sub(/=[^=]+\z/, '')

words = %w[tryst fun glyph pity why]

words.grep(/\A[^aeiou]+\z/)

words.grep_v(/[aeiou]/)

'tryst glyph pity why'.scan(/\b[^aeiou]+\b/)

'tryst glyph pity why'.scan(/\b[a-z&&[^aeiou]]+\b/)

'ab-cd gh-c 12-423'.scan(/\b[a-z-]{2,}\b/)

'ab-cd gh-c 12-423'.scan(/\b[a-z\-0-9]{2,}\b/)

'f*(a^b) - 3*(a+b)'.scan(/a[+^]b/)

'f*(a^b) - 3*(a+b)'.scan(/a[\^+]b/)

'words[5] = tea'.match(/[a-z\[\]0-9]+/)

puts '5ba\babc2'.match(/[a\\b]+/)

'128A foo1 fe32 34 bar'.scan(/\b\h+\b/)

'128A foo1 fe32 34 bar'.scan(/\b\h+\b/).map(&:hex)

'Sample123string42with777numbers'.split(/\d+/)

'foo=5, bar=3; x=83, y=120'.scan(/\d+/).map(&:to_i)

'sea eat car rat eel tea'.scan(/\b\w/).join

'tea sea-pit sit-lean bean'.scan(/[\w\s]+/)

'Sample123string42with777numbers'.gsub(/\D+/, '-')

"   1..3  \v\f  foo_baz 42\tzzz   \r\n1-2-3  ".scan(/\S+/)

'Sample123string42with777numbers'.split(/[[:digit:]]+/)

"   1..3  \v\f  foo_baz 42\tzzz   \r\n1-2-3  ".scan(/[[:^space:]]+/)

'tea sea-pit sit-lean bean'.scan(/[[:word:][:space:]]+/)

'Sample123string42with777numbers'.scan(/[[:alpha:]]+/)

'"Hi", there! How *are* you? All fine here.'.gsub(/[[:punct:]]+/, '')

'"Hi", there! How *are* you? All fine here.'.gsub(/[[^.!?]&&[:punct:]]+/, '')

