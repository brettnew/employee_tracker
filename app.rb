require('pg')
require "pry"
require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
also_reload("lib/**/*.rb")

get('/') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:index)
end

post('/divisions') do
  description = params.fetch('description')
  division = Division.create({:description => description, :id => nil})
  division.save()
  @divisions = Division.all()
  erb(:index)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch('division_id')
  employee = Employee.create({:name => name, :division_id => division_id, :id => nil})
  employee.save()
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end

get('/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @divisions = Division.all()
  erb(:division)
end

patch('/divisions/:id') do
  description = params.fetch("name")
  @division = Division.find(params.fetch('id').to_i())
  @division.update({:description => description})
  @divisions = Division.all()
  erb(:index)
end

delete('/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @division.destroy()
  @divisions = Division.all()
  erb(:index)
end

get('/divisions/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end
