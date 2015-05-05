require('rspec')
require('pg')
require('address')
require('contact')
require('email')
require('phone')

DB= PG.connect({:dbname => 'address_book_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM address *;")
    DB.exec("DELETE FROM contact *;")
    DB.exec("DELETE FROM email *;")
    DB.exec("DELETE FROM phone *;")
  end
end
