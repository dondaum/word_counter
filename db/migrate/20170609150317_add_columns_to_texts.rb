class AddColumnsToTexts < ActiveRecord::Migration[5.0]
  def change
    add_column :texts, :sentiment, :string
    add_column :texts, :score, :decimal
  end
end
