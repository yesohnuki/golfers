class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.integer :receiver_id, null: false, foreign_key: true
      t.integer :sender_id, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
