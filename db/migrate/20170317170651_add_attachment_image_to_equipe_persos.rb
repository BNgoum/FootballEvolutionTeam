class AddAttachmentImageToEquipePersos < ActiveRecord::Migration
  def self.up
    change_table :equipe_persos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :equipe_persos, :image
  end
end
