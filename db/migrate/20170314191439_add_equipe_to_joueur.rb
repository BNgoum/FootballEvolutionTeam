class AddEquipeToJoueur < ActiveRecord::Migration[5.0]
  def change
    add_reference :joueurs, :equipe, foreign_key: true
  end
end
