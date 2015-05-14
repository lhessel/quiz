class RemoveUserFromQuizzes < ActiveRecord::Migration
  def change
    remove_column :quizzes, :user, :integer
  end
end
