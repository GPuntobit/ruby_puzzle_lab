class CreateHints < ActiveRecord::Migration[8.1]
  def change
    create_table :hints do |t|
      t.references :level, null: false, foreign_key: true
      t.text :content
      t.integer :hint_order

      t.timestamps
    end
  end
end
