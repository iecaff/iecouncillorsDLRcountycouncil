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

front_page = mechanize.get('http://www.dublincity.ie/main-menu-your-council-your-city-councillors/full-councillor-list')
page_urls = front_page.search('div#ctl00_PlaceHolderMain_ctl02__ControlWrapper_RichHtmlField a')
con_info = ['Area:','Ward:','Elected:','Party:','Address:','Email:','Phone:','Mobile:','Fax:',nil]
