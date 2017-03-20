class AddAttachmentImageToJoueurs < ActiveRecord::Migration
  def self.up
    change_table :joueurs do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :joueurs, :image
  end
end
