class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :users_lessons_count, :user_lessons_count
    #rename_column from users_lessons_count to user_lessons_count
  end
end
