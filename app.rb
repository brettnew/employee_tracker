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
  division = Division.new({:description => description, :id => nil})
  division.save()
  @divisions = Division.all()
  erb(:index)
end

post('/employees') do
  name = params.fetch('name')
  division_id = params.fetch('division_id')
  employee = Employee.new({:name => name, :division_id => division_id, :id => nil})
  employee.save()
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:index)
end
