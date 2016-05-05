class AddEmpIdToLvs < ActiveRecord::Migration
  def change
    add_column :lvs, :emp_id, :integer
  end
end
