class QuizModesController < ApplicationController
  authorize_resource class: false

  def index
    @quizzes = QuizAnswerKey.all
    respond_to do |format|
      format.html
      format.json { render json: QuizModesDatatable.new(view_context) }
    end
  end

  def take_quiz
    @quiz = QuizAnswerKey.find(params[:id])
    @item_number = 0
    @total = @quiz.quiz_items.count
    @question = @quiz.quiz_items[@item_number]
    @progress = ""

    respond_to do |format|
      format.html {}
      format.json { head :no_content }
    end
  end

  def process_answer
    @quiz = QuizAnswerKey.find(params[:response][:quiz_id])
    @question = QuizItem.find(params[:response][:question_id])
    @answer = params[:response][:answer]
    @progress = params[:response][:progress]
    @progress.concat("#{@question.accepted_answers.include?(@answer.downcase)}", ' ')

    @item_number = params[:response][:item_number].to_i
    @total = @quiz.quiz_items.count
    @question = @quiz.quiz_items[@item_number]

    respond_to do |format|
      format.js { render 'quiz_modes/question' }
    end
  end
end
