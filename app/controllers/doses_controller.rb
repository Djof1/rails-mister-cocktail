class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :show, :create, :edit, :update]

  # GET /doses
  # GET /doses.json
  def index
    @doses = Dose.all
  end

  # GET /doses/1
  # GET /doses/1.json
  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses
  # POST /doses.json
  def create
    @dose = @cocktail.doses.build(dose_params)
      if @dose.save
      redirect_to cocktail_path(@cocktail.id)
      else
      render :new
      end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json
  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to @dose, notice: 'Dose was successfully updated.' }
        format.json { render :show, status: :ok, location: @dose }
      else
        format.html { render :edit }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose = Dose.find(params['id'])
    id = @dose.cocktail_id
    @dose.destroy

    redirect_to cocktail_path(id)
    # respond_to do |format|
    #   format.html { redirect_to doses_url, notice: 'Dose was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params['cocktail_id'])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
    end
end
