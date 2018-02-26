# top to bottom
class ExClassesController < ApplicationController
  def index
    @ex_classes = ExClass.all
  end

  def new
    # if ExClass.exists?
    #   "NOPENOPE"
    # else
    @ex_class = ExClass.new
    # end
  end

  def create
    # if ExClass.find_by(:word)
    #   @exclass = "ALREADY IN DB"
    # else
      @ex_class = ExClass.new(ex_class_params)
    # end
    # ExClass.where(:word => @ex_class.word).first_or_create
    if @ex_class.save
      redirect_to @ex_class
    else
      render 'new'
    end
  end

  def show
    # @ex_class = ExClass.find(params[:id])
    # @ex_class = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{params[:word]}",
    #   :headers => {
    #     "Accept": "application/json",
    #     "app_id": "#{ENV['OXFORD_APP_ID']}",
    #     "app_key": "#{ENV['OXFORD_APP_KEY']}"
    #   })
    #
    #   if @ex_class.include?('!DOCTYPE')
    #     @ex_class = "SORRY, THAT'S NOT A WORD"
    #   end
    @ex_class = params[:word]
  end

  def edit
    @ex_class = ExClass.find(params[:id])
    if @ex_class.save
      redirect_to @word
    else
      render 'new'
    end
  end

  def update
    @ex_class = ExClass.find(params[:id])
    if @ex_class.update(ex_class_params)
      redirect_to @word
    else
      render 'new'
    end
  end

  def destroy
    @ex_class = ExClass.find(params[:id])
    @ex_class.destroy
    redirect_to ex_classes_path
  end

  private

    # def ex_class_params
    #   params.require(:ex_class).permit(:word)
    # end
end
