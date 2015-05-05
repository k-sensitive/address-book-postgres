class Contact
  attr_reader(:first_name, :last_name, :birthday, :id,)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birthday = attributes.fetch(:birthday)

  end

  define_singleton_method(:all) do
    returned_contact = DB.exec("SELECT * FROM contacts;")
    contacts = []
    returned_contact.each() do |contact|
      first_name = first_name.fetch('first_name')
      last_name = last_name.fetch('last_name')
      birthday = birthday.fetch('birthday')
      contacts.push(Contact.new({:first_name => first_name, :last_name => last_name, :birthday => birthday}))
    end
    contacts
  end

  define_method(:save) do
    @@contacts.push(self)
  end


  define_method(:add_number) do |phone_number|
    @phone_numbers.push(phone_number)
  end

  define_method(:add_email) do |email|
    @emails.push(email)
  end

  define_method(:add_address) do |address|
    @addresses.push(address)
  end
end
