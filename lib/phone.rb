require('pry')
class Phone
  attr_reader(:phone, :id)
  @@phones = []

  define_method(:initialize) do |attributes|
    @phone = attributes.fetch(:phone)
    @id = @@contacts.length().+(1)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:save) do
    @@contacts.push(Phone)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end
end
