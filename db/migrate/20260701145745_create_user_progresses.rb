class CreateUserProgresses < ActiveRecord::Migration[8.1]
  def change
    create_table :user_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :level, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
