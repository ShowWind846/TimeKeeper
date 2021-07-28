class ChangePostsToNewColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :content, :text
    add_column :posts, :start_day, :date
    add_column :posts, :start_time, :time
    add_column :posts, :end_day, :date
    add_column :posts, :end_time, :time
  end
end
