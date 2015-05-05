require('spec_helper')


describe(Phone) do

  describe('#area_code') do
    it('returns an area code') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      expect(test_phone_number.area_code()).to(eq('503'))
    end
  end

  describe('#number') do
    it('returns a phone number') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      expect(test_phone_number.number()).to(eq('555-1234'))
    end
  end

  describe('#type') do
    it('returns the type of phone number it is') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      expect(test_phone_number.type()).to(eq('home'))
    end
  end

  describe('.all') do
    it('returns an empty array') do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves a phone object to the numbers class instance') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      test_phone_number.save()
      expect(Phone.all()).to(eq([test_phone_number]))
    end
  end

  describe('.clear') do
    it('empties the array of saved phone numbers') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      test_phone_number.save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of the phone object') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      test_phone_number.save()
      expect(test_phone_number.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns a phone object from its id') do
      test_phone_number = Phone.new(:area_code => '503', :number => '555-1234', :type => 'home')
      test_phone_number.save()
      test_phone_number_2 = Phone.new(:area_code => '404', :number => '456-7890', :type => 'cell')
      test_phone_number_2.save()
      expect(Phone.find(2)).to(eq(test_phone_number_2))
    end
  end
end
