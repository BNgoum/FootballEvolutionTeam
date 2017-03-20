class TableEquipes < ActiveRecord::Migration[5.0]
  def change
  	create_table :equipes
  	add_column :equipes, :name, :string
  	add_column :equipes, :pays, :string
  	add_column :equipes, :entraineur, :string
  	add_column :equipes, :statsgenerale, :integer
  	add_column :equipes, :nombreJoueurs, :integer
  end
end
