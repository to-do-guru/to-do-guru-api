class CreateChores < ActiveRecord::Migration[7.0]
  def change
    create_table :chores do |t|
      t.references :household, null: false, foreign_key: true
      t.string :name
      t.integer :duration
      t.integer :day, default: 0

      t.timestamps
    end
  end
end
