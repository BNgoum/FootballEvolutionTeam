class AddDefaultValueToArgent < ActiveRecord::Migration[5.0]
  def change
  	change_column :equipe_persos, :argent, :integer, :default => 1200
  end
end
