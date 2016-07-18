class CreateDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |t|
      t.column(:description, :string)

    end

    add_column(:employees, :division_id, :integer)
  end
end
