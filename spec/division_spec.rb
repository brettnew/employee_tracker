require('spec_helper')

describe(Division) do
  describe("employees") do
    it "tells which employees are in the division" do
      test_division = Division.create({:description => "IT"})
      rick = Employee.create({:name => "Rick", :division_id => test_division.id})
      steve = Employee.create({:name => "Steve", :division_id => test_division.id})
    expect(test_division.employees()).to(eq([rick, steve]))  
    end
  end
end
