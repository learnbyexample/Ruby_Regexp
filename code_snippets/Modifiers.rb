'Cat' =~ /cat/

'Cat' =~ /cat/i

'Cat scat CATER cAts'.scan(/cat/i)

'Sample123string42with777numbers'.scan(/[a-z]+/i)

"Hi there\nHave a Nice Day".sub(/the.*ice/, 'X')

"Hi there\nHave a Nice Day".sub(/the.*ice/m, 'X')

"Hi there\nHave a Nice Day".sub(/the.*day/im, 'Bye')

n = 2

words = %w[car bike bus auto train plane]

words.grep(/\A\w{#{2**n}}\z/o)

words.select.with_index(1) { |w, i| w.match?(/\A\w{#{2**i}}\z/) }

rex = /\A(                 # group-1, captures first 3 columns
           (?:[^,]+,){3}   # non-capturing group to get the 3 columns
         )
         ([^,]+)           # group-2, captures 4th column
      /x

'1,2,3,4,5,6,7'.sub(rex, '\1(\2)')

'cat and dog'.match?(/t a/x)

'cat and dog'.match?(/t\ a/x)

'cat and dog'.match?(/t\x20a/x)

'foo a#b 123'[/a#b/x]

'foo a#b 123'[/a\#b/x]

rex = /\A((?:[^,]+,){3})(?#3-cols)([^,]+)(?#4th-col)/

'1,2,3,4,5,6,7'.sub(rex, '\1(\2)')

'Cat scatter CATER cAts'.scan(/(?i:cat)[a-z]*\b/)

'Cat scatter CATER cAts'.scan(/cat(?-i)[a-z]*\b/i)

'Cat SCatTeR CATER cAts'.scan(/(?-i:Cat)[a-z]*\b/i)

'Cat SCatTeR CATER cAts'.scan(/Cat(?i)[a-z]*\b/)

Regexp.union(/^cat/i, '123')

Regexp.union(/cat/, 'a^b', /the.*ice/im)

