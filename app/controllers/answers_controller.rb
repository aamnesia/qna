class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_question, only: :create
  before_action :load_answer, only: :destroy

  def create
    @answer = @question.answers.new(answer_params)
    @answer.user = current_user

    if @answer.save
      redirect_to @question, notice: 'Your answer successfully created.'
    else
      redirect_to @question, notice: 'Not saved.'
    end
  end

  def destroy
    @answer.destroy if current_user.author?(@answer)
    redirect_to @answer.question, notice: 'Your answer successfully deleted.'
  end

  private

  def load_answer
    @answer = Answer.find(params[:id])
  end

  def load_question
    @question = Question.find(params[:question_id])
  end

  def answer_params
    params.require(:answer).permit(:body)
  end
end
