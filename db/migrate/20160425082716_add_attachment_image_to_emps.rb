class AddAttachmentImageToEmps < ActiveRecord::Migration
  def self.up
    change_table :emps do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :emps, :image
  end
end
