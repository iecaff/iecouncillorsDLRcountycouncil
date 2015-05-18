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
con_table = front_page.search("table[summary='List od Dun Laoghaire Rathdown Councillors in Alphabetical order']/tr")
#con_text=con_table.map(&:text).delete_if{|x| x !~ /\w/}
#con_text.each_with_index do |con_string,i|
#  puts con_string
#end
con_details = con_table.collect do |con_row|
  con_detail = {}
  [
    [:title, 'td[3]/div[1]/a/text()'],
    [:name, 'td[3]/div[2]/span/a/text()'],
    [:date, 'td[4]/text()'],
    [:time, 'td[4]/span/text()'],
    [:number, 'td[5]/a/text()'],
    [:views, 'td[6]/text()'],
  ].each do |name, xpath|
    detail[name] = con_row.at(xpath).to_s.strip
  end
  con_detail
end
pp con_details
