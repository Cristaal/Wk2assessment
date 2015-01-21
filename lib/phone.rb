require('pry')
class Phone
  @@phone_types = []

  attr_reader(:number_type, :id)

  define_method(:initialize) do |attributes|
    @number_type = attributes.fetch(:number_type)
    @id = @@phone_types.length().+(1)
  end

  define_singleton_method(:all) do
    @@phone_types
  end

  define_singleton_method(:clear) do
    @@phone_types = []
  end

  define_method(:save) do
    @@phone_types.push(self)
  end
end
