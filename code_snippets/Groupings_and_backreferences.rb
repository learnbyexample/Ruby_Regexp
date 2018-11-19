'[52] apples and [31] mangoes'.gsub(/\[(\d+)\]/, '\1')

'_foo_ __123__ _baz_'.gsub(/(_)?_/, '\1')

'52 apples and 31 mangoes'.gsub(/\d+/, '(\0)')

'Hello world'.sub(/.*/, 'Hi. \0. Have a nice day')

'a,b 42,24'.gsub(/(\w+),(\w+)/, '\2,\1')

%w[effort flee facade oddball rat tool].grep(/\b\w*(\w)\1\w*\b/)

'a a a walking for for a cause'.gsub(/\b(\w+)( \1)+\b/, '\1')

row = 'today,2008-03-24,food,2012-08-12,nice,5632'

row.match(/(\d{4}-\d{2}-\d{2}).*\g<1>/)[0]

'Sample123string42with777numbers'.split(/\d+/)

'Sample123string42with777numbers'.split(/(\d+)/)

'cost akin more east run against'.scan(/\b\w*(?:st|in)\b/)

'123hand42handy777handful500'.split(/hand(?:y|ful)?/)

'1,2,3,4,5,6,7'.sub(/\A(([^,]+,){3})([^,]+)/, '\1(\3)')

'1,2,3,4,5,6,7'.sub(/\A((?:[^,]+,){3})([^,]+)/, '\1(\2)')

'cost akin more east run against'.gsub(/\b\w*(st|in)\b/).to_a

'cost akin more east run against'.gsub(/\b\w*(st|in)\b/).map(&:upcase)

'effort flee facade oddball rat tool'.gsub(/\b\w*(\w)\1\w*\b/).to_a

'a,b 42,24'.gsub(/(?<fw>\w+),(?<sw>\w+)/, '\k<sw>,\k<fw>')

'a,b 42,24'.gsub(/(?'fw'\w+),(?'sw'\w+)/, '\k<sw>,\k<fw>')

row = 'today,2008-03-24,food,2012-08-12,nice,5632'

row.match(/(?<date>\d{4}-\d{2}-\d{2}).*\g<date>/)[0]

details = '2018-10-25,car'

/(?<date>[^,]+),(?<product>[^,]+)/ =~ details

date

product

