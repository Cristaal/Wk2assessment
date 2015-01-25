class Contact

  attr_reader :name, :numbers, :id
  @@contacts = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @numbers = []
    @id = @@contacts.length().+(1)
  end

  define_singleton_method(:all) do
    @@contacts
  end

  define_method(:add_number) do |number|
    @numbers.push(number)
  end

  define_method(:save) do
    @@contacts.push(self)
  end

  define_singleton_method(:clear) do
    @@contacts = []
  end

  define_singleton_method(:find) do |id|
    found_contact = nil
    @@contacts.each() do |contact|
      if contact.id().eql?(id)
        found_contact = contact
      end
    end
    found_contact
  end
end
