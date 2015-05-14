class CreateJoinTableUsersQuizzes < ActiveRecord::Migration
  def change
		create_join_table :users, :quizzes
  end
end
