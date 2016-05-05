class AddNssfnToEmps < ActiveRecord::Migration
  def change
    add_column :emps, :nssfn, :string
  end
end
