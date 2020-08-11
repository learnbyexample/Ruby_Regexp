## Custom character sets

%w[cute cat cot coat cost scuttle].grep(/c[ou]t/)

'meeting cute boat site foot'.gsub(/[aeo]+t/, 'X')

## Range of characters

'Sample123string42with777numbers'.scan(/[0-9]+/)

'coat Bin food tar12 best'.scan(/\b[a-z]+\b/)

'coat Bin food tar12 best'.scan(/\b[a-z0-9]+\b/)

'coat tin food put stoop best'.scan(/\b[p-z][a-z]*\b/)

'coat tin food put stoop best'.scan(/\b[a-fp-t]+\b/)

## Negating character sets

'Sample123string42with777numbers'.scan(/[^0-9]+/)

'foo:123:bar:baz'.sub(/\A([^:]+:){2}/, '')

'foo=42; baz=123'.sub(/=[^=]+\z/, '')

dates = '2020/04/25,1986/Mar/02,77/12/31'

dates.scan(%r{([^/]+)/([^/]+)/([^/,]+),?})

words = %w[tryst fun glyph pity why]

words.grep(/\A[^aeiou]+\z/)

words.grep_v(/[aeiou]/)

## Set intersection

'tryst glyph pity why'.scan(/\b[^aeiou]+\b/)

'tryst glyph pity why'.scan(/\b[a-z&&[^aeiou]]+\b/)

## Matching metacharacters literally

'ab-cd gh-c 12-423'.scan(/\b[a-z-]{2,}\b/)

'ab-cd gh-c 12-423'.scan(/\b[a-z\-0-9]{2,}\b/)

'f*(a^b) - 3*(a+b)'.scan(/a[+^]b/)

'f*(a^b) - 3*(a+b)'.scan(/a[\^+]b/)

'words[5] = tea'[/[a-z\[\]0-9]+/]

puts '5ba\babc2'[/[a\\b]+/]

## Escape sequence character sets

'128A foo1 fe32 34 bar'.scan(/\b\h+\b/)

'128A foo1 fe32 34 bar'.scan(/\b\h+\b/).map(&:hex)

'Sample123string42with777numbers'.split(/\d+/)

'foo=5, bar=3; x=83, y=120'.scan(/\d+/).map(&:to_i)

'sea eat car rat eel tea'.scan(/\b\w/).join

'tea sea-pit sit-lean bean'.scan(/[\w\s]+/)

'Sample123string42with777numbers'.gsub(/\D+/, '-')

'foo=5, bar=3; x=83, y=120'.gsub(/\W+/, '')

"   1..3  \v\f  foo_baz 42\tzzz   \r\n1-2-3  ".scan(/\S+/)

"food\r\ngood"[/d\Rg/]

## Named character sets

'Sample123string42with777numbers'.split(/[[:digit:]]+/)

"   1..3  \v\f  foo_baz 42\tzzz   \r\n1-2-3  ".scan(/[[:^space:]]+/)

'tea sea-pit sit-lean bean'.scan(/[[:word:][:space:]]+/)

'Sample123string42with777numbers'.scan(/[[:alpha:]]+/)

ip = '"Hi", there! How *are* you? All fine here.'

ip.gsub(/[[:punct:]]+/, '')

ip.gsub(/[[^.!?]&&[:punct:]]+/, '')

## Numeric ranges

'23 154 12 26 98234'.scan(/\b[12]\d\b/)

'23 154 12 26 98234'.scan(/\b\d{3,}\b/)

'0501 035 154 12 26 98234'.scan(/\b0*+\d{3,}\b/)

'45 349 651 593 4 204'.scan(/\d++/).filter { |n| n.to_i < 350 }

'45 349 651 593 4 204'.gsub(/\d++/) { (200..650) === $&.to_i ? 0 : 1 }

