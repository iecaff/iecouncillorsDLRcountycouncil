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
    [:image, 'td[1]/div[1]/img/src()'],
    [:name, 'td[2]//text()'],
    [:phone, 'td[3]//text()'],
    [:email, 'td[4]//text()'],
    [:area, 'td[5]//text()'],
  ].each do |name, xpath|
    detail[name] = con_row.at(xpath).to_s.strip
  end
  con_detail
end
pp con_details
