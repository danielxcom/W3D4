class Poll < ApplicationRecord
  validates :title, presence: true
  validates_uniqueness_of :title 
  belongs_to :authors,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_many :questions,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

end
