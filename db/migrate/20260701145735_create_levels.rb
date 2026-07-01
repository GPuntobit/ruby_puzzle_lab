class CreateLevels < ActiveRecord::Migration[8.1]
  def change
    create_table :levels do |t|
      t.string :title
      t.text :description
      t.string :level_type
      t.text :solution

      t.timestamps
    end
  end
end
