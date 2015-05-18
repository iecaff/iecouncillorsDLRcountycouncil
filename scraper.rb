require 'scraperwiki'
require 'mechanize'


mechanize = Mechanize.new

con_record = {
:auth =>     '',
:lea 	=>     '',
:name =>	'',
:party =>	'',
:email =>	'',
:phone =>	'',
:mobile =>	'',
:image =>	'',
:address => ''
}

con_area = ''
con_ward = ''
con_name = ''
con_party = ''
con_email = ''
con_phone = ''
con_mobile = ''
con_image = ''
con_address = ''

con_info = ['Area:','Ward:','Elected:','Party:','Address:','Email:','Phone:','Mobile:','Fax:',nil]

front_page = mechanize.get('http://www.dlrcoco.ie/aboutus/councilbusiness/listofcouncillors/')
con_table = front_page.search("table[class='List od Dun Laoghaire Rathdown Councillors in Alphabetical order']//text()")
con_text=con_table.map(&:text).delete_if{|x| x !~ /\w/}
con_text.each_with_index do |con_string,i|
  puts con_string
end

