class TableJoueurs < ActiveRecord::Migration[5.0]
  def change
  	create_table :joueurs
  	add_column :joueurs, :statsgenerale, :integer
  	add_column :joueurs, :poste, :string
  	add_column :joueurs, :club, :string
  	add_column :joueurs, :nationalite, :string
  	add_column :joueurs, :name, :string
  	add_column :joueurs, :pac, :integer
  	add_column :joueurs, :dri, :integer
  	add_column :joueurs, :tir, :integer
  	add_column :joueurs, :def, :integer
  	add_column :joueurs, :pas, :integer
  	add_column :joueurs, :phy, :integer
  	add_column :joueurs, :qualite, :string
  end
end
