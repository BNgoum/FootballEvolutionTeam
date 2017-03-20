class AddEstAcheteToJoueurs < ActiveRecord::Migration[5.0]
  def change
    add_column :joueurs, :estAchete, :boolean, default: false
  end
end
