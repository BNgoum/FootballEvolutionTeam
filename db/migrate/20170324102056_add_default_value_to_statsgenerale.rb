class AddDefaultValueToStatsgenerale < ActiveRecord::Migration[5.0]
  def change
  	change_column :equipe_persos, :statsgenerale, :integer, :default => 25
  end
end
