class OxfordWordsController < ApplicationController
  def index
    @oxford_words = OxfordWord.all
  end

  def show
    @oxford_word = OxfordWord.find(params[:id])
  end

  def new
    @oxford_word = OxfordWord.new
  end

  def edit
    @oxford_word = OxfordWord.find(params[:id])
  end

  def create
    @oxford_word = OxfordWord.new(oxford_word_params)

    if @oxford_word.save
      redirect_to @oxford_word
    else
      render 'new'
    end
  end

  def update
    @oxford_word = OxfordWord.find(params[:id])

    if @oxford_word.save
      redirect_to @oxford_word
    else
      render 'edit'
    end
  end

  def destroy
    @oxford_word = OxfordWord.find(params[:id])
    @oxford_word.destroy
    redirect_to oxford_words_path
  end

  private

  def oxford_word_params
    params.require(:oxford_word).permit(:word)
  end
end
