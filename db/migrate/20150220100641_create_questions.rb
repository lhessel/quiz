class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :answer0
      t.string :answer1
      t.string :answer2
      t.string :answer3
      t.integer :correctAnswer
      t.integer :difficulty
      t.integer :contributedBy

      t.timestamps
    end
  end
end
