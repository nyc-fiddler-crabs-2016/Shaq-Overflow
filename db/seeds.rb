# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(username: "Shaq", password: "LAkers34", email: "shaq@lakers.bball")
User.create(username: "Kobe", password: "LAkers24", email: "kobe@lakers.bball")
User.create(username: "Yao", password: "Rockets11", email: "yao@rockets.bball")

question = Question.create(title: "What is the Maximum Shooting Distance for a Center?", content: "Please answer quickly, I'm in the middle of a game.", user_id: 1)

answer = question.answers.create(content: "You can't make free throws...", user_id: 3)

answer.comments.create(content: "Too harsh bro", user_id: 2)





