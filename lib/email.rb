class Email
  attr_reader(:user_name, :domain, :contact_id)

  define_method(:initialize) do |attributes|
    @user_name = attributes.fetch(:user_name)
    @domain = attributes.fetch(:domain)
    @contact_id = attributes.fetch(:contact_id)
  end

  define_method(:save) do
    DB.exec("Insert INTO emails (user_name, domain, contact_id) VALUES ('#{@user_name}', '#{@domain}', #{@contact_id})")
  end

  define_singleton_method(:all) do
    returned_emails = DB.exec("SELECT * FROM emails;")
    emails = []
    returned_emails.each() do |email|
      user_name = email.fetch('user_name')
      domain = email.fetch('domain')
      contact_id = email.fetch('contact_id')
      emails.push(Email.new({:user_name => user_name, :domain => domain, :contact_id => contact_id}))
    end
    emails
  end
end
