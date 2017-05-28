class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]
  before_action  :authorize, only: [:edit, :update, :create, :destroy]

  helper_method :counter


  # GET /texts
  # GET /texts.json
  def index
    @texts = Text.all
    @users = User.all
  end

  # GET /texts/1
  # GET /texts/1.json
  def show
  end


  def counter
    input = @text.text
    #input = "dasdsadasdj asdkla lkasdlka as asd sa"
    hash = Hash.new(0)

    input.downcase.scan(/\w+/).each do |x|
      hash[x] += 1
    end
    #hash.sort_by {|x,y| x }
    hash.map{ |y,x| "<strong>#{x}</strong> mal kommt das Wort <strong>'#{y}'</strong> vor, <br>" }.sort.reverse.join("").html_safe

  end


  # GET /texts/new
  def new
    @text = Text.new
  end

  # GET /texts/1/edit
  def edit
  end

  # POST /texts
  # POST /texts.json
  def create
    @text = Text.new(text_params)
    #allocate current_user on text create action. Alternative in text model
    @text.user = current_user

    respond_to do |format|
      if @text.save
        flash[:success] = 'Text erfolgreich gespeichert.'
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, location: @text }
      else
        flash[:alert] = 'Fehler'
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /texts/1
  # PATCH/PUT /texts/1.json
  def update
    respond_to do |format|
      if @text.update(text_params)
        flash[:success] = 'Text erfolgreich geändert.'
        format.html { redirect_to @text}
        format.json { render :show, status: :ok, location: @text }
      else
        flash[:alert] = 'Fehler'
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /texts/1
  # DELETE /texts/1.json
  def destroy
    @text.destroy
    respond_to do |format|
      flash[:success] = 'Text erfolgreich gelöscht.'
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_text
      @text = Text.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def text_params
      params.require(:text).permit(:text)
    end
end
