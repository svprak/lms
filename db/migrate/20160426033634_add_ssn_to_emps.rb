class AddSsnToEmps < ActiveRecord::Migration
  def change
    add_column :emps, :ssn, :string
  end
end
