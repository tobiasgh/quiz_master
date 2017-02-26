class QuizItemsController < ApplicationController
  before_action :set_quiz_item, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  def show
  end

  def edit
    @quiz_answer_key = @quiz_item.quiz_answer_key.id
    @question_type = @quiz_item.question_type.question_type
  end

  def create
    @quiz_item = QuizItem.create(quiz_item_params)
    respond_to do |format|
      if @quiz_item.save
        format.html { redirect_to @quiz_item.quiz_answer_key, notice: I18n.t('quiz_item.was_successfully_created') }
        format.json { render :show, status: :created, location: @quiz_item.quiz_answer_key }
      else
        @quiz_answer_key = params[:quiz_item][:quiz_answer_key_id]
        format.html { render :new }
        format.json { render json: @quiz_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_quiz_item
    @quiz_item = QuizItem.find(params[:id])
  end

  def quiz_item_params
    params.require(:quiz_item).permit(
      :quiz_answer_key_id,
      :question_type_id,
      :question,
      :instructions,
      :point,
      choices_attributes: [
        :id,
        :quiz_item_id,
        :content,
        :is_correct,
        :_destroy
      ]
    )
  end
end
