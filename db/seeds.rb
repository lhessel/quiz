# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(:username => 'demouser', :password => 'password')

Question.create(:question => 'Welcher Buchstabe steht im Alphabet an der vierten Stelle?', :answer0 => 'C', :answer1 => 'A', :answer2 => 'D', :answer3 => 'B', :correctAnswer => 2, :difficulty => 1, :contributedBy => 1)
Question.create(:question => 'Was ist 2+2+2+3*4?', :answer0 => '27', :answer1 => '18', :answer2 => '12', :answer3 => '16', :correctAnswer => 1, :difficulty => 2, :contributedBy => 1)
Question.create(:question => 'Letzte Frage', :answer0 => 'Gewinnen!', :answer1 => 'Verlieren', :answer2 => 'Verlieren', :answer3 => 'Verlieren', :correctAnswer => 0, :difficulty => 3, :contributedBy => 1)