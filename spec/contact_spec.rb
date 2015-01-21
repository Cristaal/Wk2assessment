require ('rspec')
require ('contact')
require('phone')
require('pry')


describe(Contact) do
  before() do
    Contact.clear()
  end

  describe('#name') do
    it("returns the name of the contact") do
      test_contact = Contact.new({:name => "Michael", :numbers => ["520.331.8888"]})
      expect(test_contact.name()).to(eq("Michael"))
    end
  end

  describe('#add_number') do
    it("saves phone numbers to an array for a contact") do
      test_number = Contact.new({:name => "Michael"})
      test_number.add_number("520.331.8888")
      expect(test_number.numbers()).to(eq(["520.331.8888"]))
    end
  end

  describe('#numbers') do
    it("returns an phone number for a contact") do
      test_number = Contact.new({:name => "Michael"})
      test_number.add_number("520.331.8888")
      test_number.add_number("530.828.2222")
      test_number.save()
      expect(test_number.numbers()).to(eq(["520.331.8888", "530.828.2222"]))
    end
  end

  describe('.all') do
    it('is empty before putting a contact into it') do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves the contact name to the array of saved names") do
      Contact.new({:name => "Michael"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a contact by its id number") do
      test_contact = Contact.new({:name => "Michael"})
      test_contact.save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe("#add_number_type") do
    it("adds the number type to the array of the contact it is called on") do
      test_contact = Contact.new({:name => "Michael"})
      test_contact.save()
      test_number = Phone.new({:number_type => "work"})
      test_number.save()
      test_contact.add_number_type(test_number)
      expect(test_contact.numbers()).to(eq([test_number]))
    end
  end
end
