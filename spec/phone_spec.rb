require ('rspec')
require ('contact')
require('phone')
require('pry')

  describe('#phone') do
    it("returns an additional phone number") do
      Phone.clear()
      test_number = Phone.new({:phone => "530.828.2222"})
      test_number.save()
      expect(test_number.phone()).to(eq("530.828.2222"))
    end
  end

  describe('#id') do
    it("returns the id of the phone number") do
      Phone.clear()
      test_number = Phone.new({:phone => "530.828.2222"})
      test_number.save()
      expect(test_number.id()).to(eq(1))
    end
  end

  
