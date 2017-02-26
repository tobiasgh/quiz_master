class QuestionType < ActiveRecord::Base
  has_many :quiz_item

  validates :question_type, presence: true
end