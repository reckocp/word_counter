class WordsController < ApplicationController
  def index
  end

  def show
    @word = Word.find(params[:id])
  end
  
  def new
    @word = Word.new
  end

  def create
    @word = Word.new(params[:sentence])
    if @word.save
      redirect_to word_path
    end
  end


end
