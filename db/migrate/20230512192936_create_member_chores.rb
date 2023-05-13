# db/migrate/20230512192936_create_member_chores.rb
class CreateMemberChores < ActiveRecord::Migration[7.0]
  def change
    create_table :member_chores do |t|
      t.references :member, null: false, foreign_key: true
      t.references :chore, null: false, foreign_key: true

      t.timestamps
    end
  end
end
