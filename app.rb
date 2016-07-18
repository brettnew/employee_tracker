require('pg')
require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
also_reload("lib/**/*.rb")

get('/') do
  @divisions = Division.all()
  erb(:index)
end

get('/divisions') do
  description = params.fetch('description')
  @division = Division.new({:description => description})
  @divisions = Division.all()
end

get('/employees') do
  name = params.fetch('name')
  @employee = Employee.new({:name => name})
  @employees = Employee.all()
end
