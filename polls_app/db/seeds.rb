# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all


fiver = User.create!([
  {name: 'Slippery_J'},
  {name: 'Meatball Joe'},
  {name: 'Christian Poll Server'},
  {name: 'Bob'},
  {name: 'Franklin Douglas'}
  ])

polls = Poll.create!([
  {title: 'Is Pizza a Vegi?', user_id: fiver.first.id},
  {title: 'Are we sentient?', user_id: fiver.third.id},
  {title: 'Is Nasa pulling wool over our eyes?', user_id: fiver.second.id}
  ])

questions = Question.create([
  {text: 'Do you think a pizza is a vegi?', poll_id: polls.first.id },
  {text: 'Do you make this decision of your own free will?', poll_id: polls.second.id},
  {text: 'Is the earth flat?', poll_id: polls.third.id }
  ])

answers = AnswerChoice.create([

  {body: 'Agree', question_id: questions.first.id },
  {body: 'Agree', question_id: questions.second.id },
  {body: 'Agree', question_id: questions.third.id },
  {body: 'Disagree', question_id: questions.first.id },
  {body: 'Disagree', question_id: questions.second.id },
  {body: 'Disagree', question_id: questions.third.id }
  ])

Response.record_response(fiver.first, answers.last)
Response.record_response(fiver.second, answers.last)
Response.record_response(fiver.fifth, answers.first)
Response.record_response(fiver.third, answers.second)
Response.record_response(fiver.fourth, answers.fifth)
