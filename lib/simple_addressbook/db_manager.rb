require 'pg'

module SimpleAddressBook
  class DBManager
    def initialize(name)
      @db = PG.connect(dbname: name)
    end

    def add_address(address)
      @db.exec("INSERT INTO addresses (
                  name, street_address, zip_code, city, state)
                VALUES ($1, $2, $3, $4, $5);",
               [address.name, address.street_address,
                address.zip_code, address.city, address.state])
    end

    def setup_tables
      @db.exec(<<END_SQL)
CREATE TABLE addresses (
  id             SERIAL PRIMARY KEY,
  name           VARCHAR NOT NULL,
  street_address VARCHAR NOT NULL,
  zip_code       INTEGER NOT NULL,
  city           VARCHAR NOT NULL,
  state          VARCHAR NOT NULL
  );
END_SQL
    end
  end
end
