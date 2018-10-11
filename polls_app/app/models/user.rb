class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :name 

  has_many :authored_polls,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Poll

  has_many :responses,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :Response
end
