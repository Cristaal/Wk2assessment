require('pry')
class Phone
  @@phones = []

  attr_reader(:number_type, :id, :number)

  define_method(:initialize) do |attributes|
    @number = attributes.fetch(:number)
    @number_type = attributes.fetch(:number_type)
    @id = @@phones.length().+(1)
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_singleton_method(:clear) do
    @@phones = []
  end

  define_method(:save) do
    @@phones.push(self)
  end
end
