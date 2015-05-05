require('spec_helper')


describe(Email) do

  describe('#user_name') do
    it('returns the user name of the email address') do
      test_email = Email.new({:user_name => 'ian', :domain => 'epicodus.com'})
      expect(test_email.user_name()).to(eq('ian'))
    end
  end

  describe('#domain') do
    it('returns the domain of the email object') do
      test_email = Email.new({:user_name => 'ian', :domain => 'epicodus.com'})
      expect(test_email.domain()).to(eq('epicodus.com'))
    end
  end

  describe('.all') do
    it('returns an empty array') do
      expect(Email.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves an email object to the class instance array') do
      test_email = Email.new({:user_name => 'ian', :domain => 'epicodus.com'})
      test_email.save()
      expect(Email.all()).to(eq([test_email]))
    end
  end

  describe('.clear') do
    it('empties the array of saved emails') do
      test_email = Email.new({:user_name => 'ian', :domain => 'epicodus.com'})
      test_email.save()
      Email.clear()
      expect(Email.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('assigns and id to an email') do
      test_email = Email.new({:user_name => 'ian', :domain => 'epicodus.com'})
      test_email.save()
      test_email_2 = Email.new({:user_name => 'kim', :domain => 'gmail.com'})
      test_email_2.save()
      expect(test_email_2.id()).to(eq(2))
    end
  end

  describe('.find') do
    it('returns an email object by its id') do
      test_email = Email.new({:user_name => 'ian', :domain => 'epicodus.com'})
      test_email.save()
      test_email_2 = Email.new({:user_name => 'kim', :domain => 'gmail.com'})
      test_email_2.save()
      expect(Email.find(test_email_2.id())).to(eq(test_email_2))
    end
  end
end
