class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :finalDifficulty
      t.integer :timestamp

      t.timestamps
    end
  end
end
