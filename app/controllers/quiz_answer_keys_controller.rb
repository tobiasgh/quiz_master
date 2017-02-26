class QuizAnswerKeysController < ApplicationController
  before_action :set_quiz_answer_key, only: [:show, :destroy, :edit_quiz_item_sequence, :update_quiz_item_sequence, :add_quiz_item]
  load_and_authorize_resource only: [:index, :archive, :show, :new, :edit, :update, :destroy, :edit_quiz_item_sequence, :update_quiz_item_sequence, :add_quiz_item]

  def index
    respond_to do |format|
      format.html
      format.json { render json: QuizAnswerKeysDatatable.new(view_context) }
    end
  end

  def show
    @quiz_items = @quiz_answer_key.quiz_items
  end

  def new
    @quiz_answer_key = QuizAnswerKey.new
  end

  def create
    @quiz_answer_key = QuizAnswerKey.create(quiz_answer_key_params)
    respond_to do |format|
      if @quiz_answer_key.save
        format.html { redirect_to @quiz_answer_key, notice: I18n.t('quiz_answer_key.was_successfully_created') }
        format.json { render :show, status: :created, location: @applicant }
      else
        format.html { render :new }
        format.json { render json: @quiz_answer_key.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    @quiz_answer_key ||= QuizAnswerKey.find(params[:id])
    respond_to do |format|
      if @quiz_answer_key.update(quiz_answer_key_params)
        format.html { redirect_to @quiz_answer_key, notice: I18n.t('quiz_answer_key.was_successfully_updated') }
        format.json { render :show, status: :ok, location: @quiz_answer_key }
      else
        format.html { render :add_quiz_item, formats: [:js] }
        format.json { render json: @quiz_answer_key.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @quiz_answer_key.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: I18n.t('quiz_answer_key.was_successfully_destroyed') }
      format.json { head :no_content }
    end
  end

  def edit_quiz_item_sequence
  end

  def update_row_order
    @quiz_item = QuizItem.find(params[:quiz_item][:quiz_item_id])
    @quiz_item.row_order_position = params[:quiz_item][:row_order_position]
    @quiz_item.quiz_answer_key.rearrange_quiz_item_sequence if @quiz_item.save

    render nothing: true
  end

  def add_quiz_item
    @quiz_item = QuizItem.new
    @quiz_item.choices.build
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def set_quiz_answer_key
    @quiz_answer_key = QuizAnswerKey.find(params[:id])
  end

  def quiz_answer_key_params
    params.require(:quiz_answer_key).permit(
      :title,
      :passing_rate,
      :time_limit,
      :is_randomized,
      quiz_items_attributes: [
        :id,
        :quiz_answer_key_id,
        :instructions,
        :question,
        :question_type_id,
        :point,
        :sequence_number,
        choices_attributes: [
          :id,
          :quiz_item_id,
          :content,
          :is_correct,
          :_destroy
        ]
      ]
    )
  end
end
