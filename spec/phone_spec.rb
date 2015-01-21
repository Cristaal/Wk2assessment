require ('rspec')
require ('contact')
require('phone')
require('pry')

describe(Phone) do
  
  describe(".all") do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe('#save') do
    it("saves phone number types to the class variable array") do
      test_number = Phone.new({:number_type => "work"})
      test_number.save()
      expect(Phone.all()).to(eq([test_number]))
    end
  end


  describe('#number_type') do
    it("returns the type of phone number") do
      test_number = Phone.new({:number_type => "work"})
      expect(test_number.number_type()).to(eq("work"))
    end
  end
end
