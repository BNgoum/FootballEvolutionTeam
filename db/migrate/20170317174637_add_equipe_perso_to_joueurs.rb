class AddEquipePersoToJoueurs < ActiveRecord::Migration[5.0]
  def change
    add_reference :joueurs, :equipe_perso, foreign_key: true
  end
end
