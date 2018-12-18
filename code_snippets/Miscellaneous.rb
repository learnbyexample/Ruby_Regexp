h = { '1' => 'one', '2' => 'two', '4' => 'four' }

'9234012'.gsub(/[124]/) { h[$&] }

'9234012'.gsub(/[124]/, h)

h.default = 'X'

'9234012'.gsub(/\d/, h)

swap = { 'cat' => 'tiger', 'tiger' => 'cat' }

'cat tiger dog tiger cat'.gsub(/\w+/) { swap[$&] || $& }

'cat tiger dog tiger cat'.gsub(/cat|tiger/, swap)

h = { 'hand' => 1, 'handy' => 2, 'handful' => 3 }

re = Regexp.union(h.keys.sort_by { |w| -w.length })

'handful hand pin handy'.gsub(re, h)

'123-87-593 42 foo'.scan(/\G\S/)

'123-87-593 42 foo'.gsub(/\G\S/, '*')

'123-87-593 42 foo'.scan(/\G\d+-?/)

'123-87-593 42 foo'.gsub(/\G(\d+)(-?)/, '(\1)\2')

'cat12 bat pin'.gsub(/\G\w(?=\w)/, '\0:')

'par tar-den hen-food mood'.gsub(/\G[a-z ]/, '(\0)')

'a + (b * c) - (d / e)'.scan(/\([^()]++\)/)

'((f+x)^y-42)*((3-g)^z+2)'.scan(/\([^()]++\)/)

'((f+x)^y-42)*((3-g)^z+2)'.scan(/\((?:[^()]++|\([^()]++\))++\)/)

'a + (b) + ((c)) + (((d)))'.scan(/\((?:[^()]++|\([^()]++\))++\)/)

lvl2 = /\(               #literal (
          (?:            #start of non-capturing group
            [^()]++      #non-parentheses characters
            |            #OR
            \([^()]++\)  #level-one regexp
          )++            #end of non-capturing group, 1 or more times
        \)               #literal )
       /x

'((f+x)^y-42)*((3-g)^z+2)'.scan(lvl2)

'a + (b) + ((c)) + (((d)))'.scan(lvl2)

lvln = /\(               #literal (
          (?:            #start of non-capturing group
            [^()]++      #non-parentheses characters
            |            #OR
            \g<0>        #recursive call
          )++            #end of non-capturing group, 1 or more times
        \)               #literal )
       /x

'a + (b * c) - (d / e)'.scan(lvln)

'((f+x)^y-42)*((3-g)^z+2)'.scan(lvln)

'a + (b) + ((c)) + (((d)))'.scan(lvln)

'(3+a) * ((r-2)*(t+2)/6) + 42 * (a(b(c(d(e)))))'.scan(lvln)

num = '4'

puts "#{num} apples" if num.sub!(/\d+/) { $&.to_i ** 2 }

word, cnt = ['coffining', 0]

cnt += 1 while word.sub!(/fin/, '')

[word, cnt]

row = '421,foo,2425,42,5,foo,6,6,42'

nil while row.gsub!(/(?<=\A|,)([^,]++).*\K,\1(?=,|\z)/, '')

row

