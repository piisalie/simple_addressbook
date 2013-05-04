require_relative 'lib/simple_addressbook'

SimpleAddressBook.setup("contacts")

address1 = ["Paul", "11392 Someplace", "Oklahoma City", "Ok", "73861"]
address2 = ["Christi", "3333 HighPlace dr.", "Guthrie", "ok", "73990"]
address3 = ["JOE", "4932 Skyline", "guthrie", "OK", "73861"]

SimpleAddressBook.add_address("contacts", address1)
SimpleAddressBook.add_address("contacts", address2)
SimpleAddressBook.add_address("contacts", address3)

SimpleAddressBook.lookup_contact("contacts", "city", "guthrie")
SimpleAddressBook.lookup_contact("contacts", "zip_code", "73861")
