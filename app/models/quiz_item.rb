class QuizItem < ActiveRecord::Base
  belongs_to :quiz_answer_key
  belongs_to :question_type

  has_many :choices
  accepts_nested_attributes_for :choices, allow_destroy: true, reject_if: proc { |attributes| attributes['content'].blank? }

  validates :question, presence: true
  validate :uniqueness_of_choices, unless: proc { |qi| qi.choices.empty? }

  def uniqueness_of_choices
    contents = choices.collect { |choice| choice.content.downcase unless choice.marked_for_destruction? }.compact
    errors.add(:base, I18n.t('quiz_item.validate_uniqueness_of_choices')) unless contents.uniq.length == contents.length
  end

  def accepted_answers
    choices.collect { |choice| choice.content.downcase if choice.is_correct }.compact
  end
end
