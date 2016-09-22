class WordsController < ApplicationController
  def index
    # @words = Word.find(:all, :order => "id desc", :limit => 5).reverse
    @words = Word.order("created_at desc").limit(5)
  end

  def show
    @word = Word.find(params[:id])
  end

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(word_params)
    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Sentence was successfully created.' }
        format.json { render :show, status: :created, location: @word }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity}
      end
    end
  end

  private
  def word_params
    params.require(:word).permit(:sentence)
  end


end
