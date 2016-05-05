class CreateEmps < ActiveRecord::Migration
  def change
    create_table :emps do |t|
      t.integer :emp_number
      t.string :first_name
      t.string :last_name
      t.string :emp_sex
      t.string :department
      t.string :position
      t.datetime :hired_date
      t.text :contract_info
      t.string :address

      t.timestamps null: false
    end
  end
end
