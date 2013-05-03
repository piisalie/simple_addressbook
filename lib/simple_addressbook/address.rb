module SimpleAddressBook
  class Address
    def initialize(args)
      setup_name(args.shift)
      setup_address(args.shift)
      setup_zip(args.shift)
      setup_city(args.shift)
      setup_state(args.shift)
    end

    attr_reader :name, :street_address, :zip_code, :city, :state 

    private

    def setup_name(name)
      @name = downcase_and_encode(name)
    end

    def setup_address(address)
      @street_address = downcase_and_encode(address)
    end

    def setup_zip(zip)
      @zip_code = zip.to_i
    end

    def setup_city(city)
      @city = downcase_and_encode(city)
    end

    def setup_state(state)
      @state = downcase_and_encode(state)
    end

    def downcase_and_encode(string)
      return string.downcase.encode('UTF-8')
    end
  end
end
