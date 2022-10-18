class Admin::QuestionsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answer = Answer.new
    #ログインユーザーの回答数
    @reply = Reply.new
  end
  
  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to request.referer
  end
end
