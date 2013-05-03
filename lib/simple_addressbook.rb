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

  def self.lookup_address(address_book_name, find_by, entry)
    connect_database(address_book_name)
  end

  private

  def self.connect_database(name)
    @db = DBManager.new(name)
  end

  def self.setup_database(name)
    system("createdb #{name}")
  end
end
