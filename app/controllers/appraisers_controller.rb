class AppraisersController < ApplicationController
  before_action :set_appraiser, only: [:show, :edit, :update, :destroy]

  # GET /appraisers
  # GET /appraisers.json
  def index
    @appraisers = Appraiser.all
  end

  # GET /appraisers/1
  # GET /appraisers/1.json
  def show
  end

  # GET /appraisers/new
  def new
    @appraiser = Appraiser.new
  end

  # GET /appraisers/1/edit
  def edit
  end

  # POST /appraisers
  # POST /appraisers.json
  def create
    @appraiser = Appraiser.new(appraiser_params)

    respond_to do |format|
      if @appraiser.save
        format.html { redirect_to @appraiser, notice: 'Appraiser was successfully created.' }
        format.json { render :show, status: :created, location: @appraiser }
      else
        format.html { render :new }
        format.json { render json: @appraiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appraisers/1
  # PATCH/PUT /appraisers/1.json
  def update
    respond_to do |format|
      if @appraiser.update(appraiser_params)
        format.html { redirect_to @appraiser, notice: 'Appraiser was successfully updated.' }
        format.json { render :show, status: :ok, location: @appraiser }
      else
        format.html { render :edit }
        format.json { render json: @appraiser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appraisers/1
  # DELETE /appraisers/1.json
  def destroy
    @appraiser.destroy
    respond_to do |format|
      format.html { redirect_to appraisers_url, notice: 'Appraiser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appraiser
      @appraiser = Appraiser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appraiser_params
      params.require(:appraiser).permit(:name)
    end
end
