class AddJoueursToEquipes < ActiveRecord::Migration[5.0]
  def change
    add_column :equipes, :joueurs_count, :integer, default: 0
  end
end
