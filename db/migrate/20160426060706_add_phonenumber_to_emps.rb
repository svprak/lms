class AddPhonenumberToEmps < ActiveRecord::Migration
  def change
    add_column :emps, :phone, :string
  end
end
