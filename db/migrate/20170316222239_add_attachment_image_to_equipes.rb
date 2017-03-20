class AddAttachmentImageToEquipes < ActiveRecord::Migration
  def self.up
    change_table :equipes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :equipes, :image
  end
end
