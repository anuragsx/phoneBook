class AddSampleDataToContacts < ActiveRecord::Migration[5.1]
  def change
  	puts "Creating sample contact data..."
  	['Danny', 'Nishant'].each do |name|
  		Contact.create(name: name)
  	end	

	contact1 = Contact.first
	contact2 = Contact.last
	3.times do
		contact1.postal_addresses.create(address: 'sample address')
		contact2.postal_addresses.create(address: 'sample address')
		contact1.phone_numbers.create(phone_no: '9999999999')
		contact2.phone_numbers.create(phone_no: '888888888')
	end	
  end
end
