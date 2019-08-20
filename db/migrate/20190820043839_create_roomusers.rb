class CreateRoomusers < ActiveRecord::Migration[6.0]
  def change
    create_table :roomusers do |t|
      t.references :room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
