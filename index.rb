require 'vpim/vcard'
require 'csv'
vcf = open('data/All Contacts_001.vcf')
cards = Vpim::Vcard.decode(vcf)

contacts = []
cards.each_with_index do |card, i|
  contacts << {
    name: card.lines('N') != [] ? card.name.fullname : '',
    email: card.email ? card.email : ''
  }
end

CSV.open('output.csv', 'wb') do |csv|
  csv << ['Email', 'First name']
  contacts.each do | contact|
    csv << [contact[:email], contact[:name]]
  end
end