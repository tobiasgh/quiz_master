class QuizAnswerKey < ActiveRecord::Base
  has_many :quiz_items, dependent: :destroy
  accepts_nested_attributes_for :quiz_items, allow_destroy: true

  validates :title, presence: true
end
