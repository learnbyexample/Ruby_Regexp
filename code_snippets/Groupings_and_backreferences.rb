## Backreferences

'[52] apples [and] [31] mangoes'.gsub(/\[(\d+)\]/, '\1')

'_foo_ __123__ _baz_'.gsub(/(_)?_/, '\1')

'52 apples and 31 mangoes'.gsub(/\d+/, '(\0)')

'Hello world'.sub(/.*/, 'Hi. \0. Have a nice day')

'fork,42,nice,3.14'.sub(/,.+/, '\0,\`')

'good,bad 42,24'.gsub(/(\w+),(\w+)/, '\2,\1')

%w[effort flee facade oddball rat tool].grep(/(\w)\1/)

'aa a a a 42 f_1 f_1 f_13.14'.gsub(/\b(\w+)( \1)+\b/, '\1')

'two one 5 one2 three'.match?(/([a-z]+).*\12/)

'two one 5 one2 three'.match?(/([a-z]+).*\k<1>2/)

s = 'abcdefghijklmna1d'

s.sub(/(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.)(.).*\1\x31/, 'X')

## Non-capturing groups

'cost akin more east run against'.scan(/\b\w*(?:st|in)\b/)

'123hand42handy777handful500'.split(/hand(?:y|ful)?/)

'1,2,3,4,5,6,7'.sub(/\A(([^,]+,){3})([^,]+)/, '\1(\3)')

'1,2,3,4,5,6,7'.sub(/\A((?:[^,]+,){3})([^,]+)/, '\1(\2)')

s = 'hi 123123123 bye 456123456'

s.scan(/(123)+/)

s.scan(/(?:123)+/)

s.gsub(/(123)+/, 'X')

row = 'one,2,3.14,42,five'

puts row.sub(/\A([^,]+,){3}([^,]+)/, '\1"\2"')

puts row.sub(/\A((?:[^,]+,){3})([^,]+)/, '\1"\2"')

'cost akin more east run against'.gsub(/\b\w*(st|in)\b/).to_a

'cost akin more east run against'.gsub(/\b\w*(st|in)\b/).map(&:upcase)

'effort flee facade oddball rat tool'.gsub(/\b\w*(\w)\1\w*\b/).to_a

## Subexpression calls

row = 'today,2008-03-24,food,2012-08-12,nice,5632'

row[/(\d{4}-\d{2}-\d{2}).*\g<1>/]

d = '2008-03-24,2012-08-12 2017-06-27,2018-03-25 1999-12-23,2001-05-08'

d.scan(/(\d{4}-\d{2}-\d{2}),\g<1>/)

d.gsub(/(\d{4}-\d{2}-\d{2}),\g<1>/, '\1')

d.gsub(/((\d{4}-\d{2}-\d{2})),\g<2>/, '\1')

## Recursive matching

eqn0 = 'a + (b * c) - (d / e)'

eqn0.scan(/\([^()]++\)/)

eqn1 = '((f+x)^y-42)*((3-g)^z+2)'

eqn1.scan(/\([^()]++\)/)

eqn1 = '((f+x)^y-42)*((3-g)^z+2)'

eqn1.scan(/\((?:[^()]++|\([^()]++\))++\)/)

eqn2 = 'a + (b) + ((c)) + (((d)))'

eqn2.scan(/\((?:[^()]++|\([^()]++\))++\)/)

lvl2 = /\(               #literal (
          (?:            #start of non-capturing group
            [^()]++      #non-parentheses characters
            |            #OR
            \([^()]++\)  #level-one regexp
          )++            #end of non-capturing group, 1 or more times
        \)               #literal )
       /x

eqn1.scan(lvl2)

eqn2.scan(lvl2)

lvln = /\(               #literal (
          (?:            #start of non-capturing group
            [^()]++      #non-parentheses characters
            |            #OR
            \g<0>        #recursive call
          )++            #end of non-capturing group, 1 or more times
        \)               #literal )
       /x

eqn0.scan(lvln)

eqn1.scan(lvln)

eqn2.scan(lvln)

eqn3 = '(3+a) * ((r-2)*(t+2)/6) + 42 * (a(b(c(d(e)))))'

eqn3.scan(lvln)

## Named capture groups

'good,bad 42,24'.gsub(/(?<fw>\w+),(?<sw>\w+)/, '\k<sw>,\k<fw>')

'good,bad 42,24'.gsub(/(?'fw'\w+),(?'sw'\w+)/, '\k<sw>,\k<fw>')

row = 'today,2008-03-24,food,2012-08-12,nice,5632'

row[/(?<date>\d{4}-\d{2}-\d{2}).*\g<date>/]

details = '2018-10-25,car'

/(?<date>[^,]+),(?<product>[^,]+)/ =~ details

date

product

details = '2018-10-25,car,2346'

details.match(/(?<date>[^,]+),(?<product>[^,]+)/).named_captures

details.match(/(?<date>[^,]+),([^,]+)/).named_captures

s = 'good,bad 42,24'

s.gsub(/(?<fw>\w+),(?<sw>\w+)/).map { $~.named_captures }

## Negative backreferences

'1,2,3,3,5'.match?(/\A([^,]+,){2}([^,]+),\k<-1>,/)

## Conditional groups

words = %w[<hi> bye bad> <good> 42 <3]

words.grep(/\A(<)?\w+(?(1)>)\z/)

words.grep(/\A(?:<\w+>|\w+)\z/)

words.grep(/\A(?:<?\w+>?)\z/)

words = ['(hi)', 'good-bye', 'bad', '(42)', '-oh', 'i-j', '(-)']

words.grep(/\A(?:(\()?\w+(?(1)\)|-\w+))\z/)

