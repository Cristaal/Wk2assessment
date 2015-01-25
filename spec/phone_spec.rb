require ('rspec')
require ('contact')
require('phone')
require('pry')

describe(Phone) do

  before() do
    Phone.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe(".clear") do
    it("clears out the phone array") do
      test_number = Phone.new({:number_type => "work"})
      test_number.save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("returns the id of the phone number type.") do
      test_number = Phone.new({:number_type => "cell", :number => "520.331.8888"})
      expect(test_number.id()).to(eq(1))
    end
  end


  describe('#save') do
    it("saves phone number types to the class variable array") do
      test_number = Phone.new({:number_type => "work", :number => "503.247.7777"})
      test_number.save()
      expect(Phone.all()).to(eq([test_number]))
    end
  end


  describe('#number_type') do
    it("returns the type of phone number") do
      test_number = Phone.new({:number_type => "work", :number => "503.247.7777"})
      test_number.save()
      expect(test_number.number_type()).to(eq("work"))
    end
  end
end
