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
con_nodes = front_page.search("table[summary='List od Dun Laoghaire Rathdown Councillors in Alphabetical order']/tr")
con_table=con_nodes.map(&:tr)
con_table.each_with_index do |con_string,i|
  con_items = con_string.search('//text()')
  puts 'working'
  con_items.each do |con_text|
    puts con_text
  end
end


