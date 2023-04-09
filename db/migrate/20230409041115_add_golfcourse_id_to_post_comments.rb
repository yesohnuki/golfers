class AddGolfcourseIdToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_column :post_comments, :golfcourse_id, :integer
  end
end
