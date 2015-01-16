require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')
require('pry')

get('/') do
  erb(:index)
end

post("/index") do
  contact_entry = Contact.new({:name => params.fetch('contact_name')})
  contact_entry.add_number(params.fetch('contact_number'))
  contact_entry.save()
  erb(:index)
end

get('/contact_detail/:id') do
  @contact = Contact.find(params.fetch('id').to_i())
  erb(:contact_detail)
end

post("/additional_number") do
  @contact = Contact.find(params.fetch('contact_id').to_i())
  @contact.add_number(params.fetch('additional_number'))
  erb(:contact_detail)
end
