## CommonRegexRuby

require 'commonregex'

data = 'hello 255.21.255.22 okay 23/04/96'

parsed = CommonRegex.new(data)

parsed.get_ipv4

parsed.get_dates

CommonRegex.get_ipv4(data)

CommonRegex.get_dates(data)

new_data = '23.14.2.4.2 255.21.255.22 567.12.2.1'

CommonRegex.get_ipv4(new_data)

