# db/migrate/20230512192804_create_members.rb
class CreateMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :members do |t|
      t.references :household, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
