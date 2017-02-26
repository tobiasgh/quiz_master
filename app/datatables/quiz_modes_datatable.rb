class QuizModesDatatable < AjaxDatatablesRails::Base
  include ApplicationHelper
  def_delegators :@view, :params, :h, :link_to, :current_user, :can?, :content_tag, :url_for, :I18n

  def sortable_columns
    @sortable_columns ||= [
      'QuizAnswerKey.title',
      'QuizAnswerKey.passing_rate',
      'QuizAnswerKey.time_limit'
    ]
  end

  def searchable_columns
    @searchable_columns ||= [
      'QuizAnswerKey.title',
      'QuizAnswerKey.passing_rate',
      'QuizAnswerKey.time_limit'
    ]
  end

  private

  def data
    records.map do |record|
      [
        record.title,
        record.passing_rate,
        record.time_limit,
        quiz_mode_index_dropdown(record)
      ]
    end
  end

  def get_raw_records
    quizzes = QuizAnswerKey.all
  end
end
