require('spec_helper')

describe(Employee) do
  describe('#division') do
    it('tells which division the employee belongs to') do
      test_division = Division.create({:description => "IT"})
      rick = Employee.create({:name => "Rick", :division_id => test_division.id})
      expect(rick.division()).to(eq(test_division))
    end
  end
end
