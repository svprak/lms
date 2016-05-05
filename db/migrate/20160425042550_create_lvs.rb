class CreateLvs < ActiveRecord::Migration
  def change
    create_table :lvs do |t|
      t.datetime :lv_date
      t.datetime :lv_from
      t.datetime :lv_to
      t.float :lv_unit
      t.string :lv_type
      t.text :lv_reason
 

      t.timestamps null: false
    end
  end
end
