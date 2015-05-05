class Phone
  attr_reader(:area_code, :number, :type, :contact_id)

  define_method(:initialize) do |attributes|
    @area_code = attributes.fetch(:area_code)
    @number = attributes.fetch(:number)
    @type = attributes.fetch(:type)
    @contact_id = attributes.fetch(:contact_id)
  end

  define_method(:save) do
    DB.exec("INSERT INTO phone_numbers (area_code, number, type, contact_id) VALUES (#{@area_code}, #{@number}, '#{@type}', #{@contact_id})")
  end

  define_singleton_method(:all) do
    returned_phone = DB.exec("SELECT * FROM phone_numbers;")
    phone_numbers = []
    returned_phone.each() do |phone_number|
      area_code = phone_number.fetch('area_code').to_i()
      number = phone_number.fetch('number').to_i()
      type = phone_number.fetch('type')
      contact_id = phone_number.fetch('contact_id')
      phone_numbers.push(Phone.new({:area_code => area_code, :number => number, :type => type, :contact_id = contact_id}))
    end
    phone_numbers
  end
end
