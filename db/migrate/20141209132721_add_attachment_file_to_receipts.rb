class AddAttachmentFileToReceipts < ActiveRecord::Migration
  def self.up
    change_table :receipts do |t|

      t.attachment :file

    end
  end

  def self.down

    remove_attachment :receipts, :file

  end
end
