class CreateEquipePersos < ActiveRecord::Migration[5.0]
  def change
    create_table :equipe_persos do |t|
      t.string :nameteam
      t.string :nametrainer
      t.integer :effectif
      t.string :pays
      t.integer :statsgenerale
      t.integer :argent

      t.timestamps
    end
  end
end
