require_relative 'simple_addressbook/db_manager'
require_relative 'simple_addressbook/address'

module SimpleAddressBook
  def self.setup(address_book_name)
    setup_database(address_book_name)
    connect_database(address_book_name)
    @db.setup_tables
  end

  def self.add_address(address_book_name, args)
    connect_database(address_book_name)
    @address = Address.new(args)
    @db.add_address(@address)
  end

  def self.lookup_contact(address_book_name, find_by, entry)
    connect_database(address_book_name)
    @db.find_contacts(find_by, entry) { |result| result.each do |contact| display_contact(contact) end }
  end

  private

  def self.display_contact(contact)
    contact.each do |key, value|
      puts "#{key}: #{value}"
    end
  end

  def self.connect_database(name)
    @db = DBManager.new(name)
  end

  def self.setup_database(name)
    system("createdb #{name}")
  end
end
