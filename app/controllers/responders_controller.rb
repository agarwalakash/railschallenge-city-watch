class RespondersController < ApplicationController
  before_action :set_responder, only: [:show, :edit, :update, :destroy]

  # GET /responders
  # GET /responders.json
  def index
    @responders = Responder.all
  end

  # GET /responders/1
  # GET /responders/1.json
  def show
  end

  # GET /responders/new
  def new
    @responder = Responder.new
  end

  # GET /responders/1/edit
  def edit
  end

  # POST /responders
  # POST /responders.json
  def create
    @responder = Responder.new(responder_params)

    respond_to do |format|
      if @responder.save
        format.html { redirect_to @responder, notice: 'Responder was successfully created.' }
        format.json { render :show, status: :created, location: @responder }
      else
        format.html { render :new }
        format.json { render json: @responder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responders/1
  # PATCH/PUT /responders/1.json
  def update
    respond_to do |format|
      if @responder.update(responder_params)
        format.html { redirect_to @responder, notice: 'Responder was successfully updated.' }
        format.json { render :show, status: :ok, location: @responder }
      else
        format.html { render :edit }
        format.json { render json: @responder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responders/1
  # DELETE /responders/1.json
  def destroy
    @responder.destroy
    respond_to do |format|
      format.html { redirect_to responders_url, notice: 'Responder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_responder
      @responder = Responder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def responder_params
      params.require(:responder).permit(:name, :responder_type)
    end
end
