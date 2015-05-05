class Address
  attr_reader(:street, :city, :state, :zip_code, :contact_id)

  define_method(:initialize) do |attributes|
    @street = attributes.fetch(:street)
    @city = attributes.fetch(:city)
    @state = attributes.fetch(:state)
    @zip_code = attributes.fetch(:zip_code)
    @contact_id = attributes.fetch(:contact_id)
  end

  define_method(:save) do
    DB.exec("INSERT INTO address (street, city, state, contact_id, zip) VALUES ('#{@street}', '#{@city}', '#{@state}', #{@contact_id}, #{@zip}) RETURNING id;")
  end

  define_singleton_method(:all) do
    returned_address = DB.exec("SELECT * FROM address;")
    address_list = []
    returned_address.each() do |address|
      street = address.fetch('street')
      city = address.fetch('city')
      state = address.fetch('state')
      contact_id = address.fetch('contact_id').to_i()
      zip = address.fetch('zip').to_i()
      address_list.push(Address.new({:street => street, :city => city, :state => state, :contact_id => contact_id, :zip => zip}))
    end
    address_list
  end
end
