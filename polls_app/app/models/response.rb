class Response < ApplicationRecord
  belongs_to :respondant,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question



  def self.record_response(user, answer)
    Response.create!(user_id: user.id, answer_id: answer.id)
  end


  def sibling_responses
    Response.select(:id)
    .joins(:question)
    .where('question_id = questions.id')
    .where.not(id: self.id)
  end
end
