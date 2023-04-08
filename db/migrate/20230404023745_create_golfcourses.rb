class CreateGolfcourses < ActiveRecord::Migration[6.1]
  def change
    create_table :golfcourses do |t|

      t.references :user, foreign_key: true
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
