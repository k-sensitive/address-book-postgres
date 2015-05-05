require('spec_helper')


describe(Address) do

  describe('#street') do
    it('returns a street address') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.street()).to(eq('654 N Broadway Street'))
    end
  end

  describe('#city') do
    it('returns a city') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.city()).to(eq('Portland'))
    end
  end

  describe('#state') do
    it('returns a state') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.state()).to(eq('Oregon'))
    end
  end

  describe('#zip_code') do
    it('returns a zip code') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      expect(test_address.zip_code()).to(eq('97314'))
    end
  end

  describe('#save') do
    it('saves an address object in an array') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      test_address.save()
      expect(Address.all()).to(eq([test_address]))
    end
  end

  describe('.all') do
    it('returns an empty array of address objects') do
      expect(Address.all()).to(eq([]))
    end
  end

  describe('.clear') do
    it('clears the array of addresses for the address class') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      test_address.save()
      Address.clear()
      expect(Address.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of an address object') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      test_address.save()
      expect(test_address.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns an address from its id') do
      test_address = Address.new({:street => '654 N Broadway Street', :city => 'Portland', :state => 'Oregon', :zip_code => '97314'})
      test_address.save()
      test_address_2 = Address.new({:street => '456 N Water Ave', :city => 'Portland', :state => 'Oregon', :zip_code => '97214'})
      test_address_2.save()
      expect(Address.find(2)).to(eq(test_address_2))
    end
  end
end
