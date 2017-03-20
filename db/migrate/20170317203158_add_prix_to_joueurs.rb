class AddPrixToJoueurs < ActiveRecord::Migration[5.0]
  def change
    add_column :joueurs, :prix, :integer
  end
end
