class FragrancesController < ApplicationController
  before_action :set_fragrance, only: %i[ show edit update destroy ]

  # GET /fragrances or /fragrances.json
  def index
    render json: Fragrance.all
  end

  # GET /fragrances/1 or /fragrances/1.json
  def show
  end

  # GET /fragrances/new
  def new
    @fragrance = Fragrance.new
  end

  # GET /fragrances/1/edit
  def edit
  end

  # POST /fragrances or /fragrances.json
  def create
    @fragrance = Fragrance.new(fragrance_params)

    respond_to do |format|
      if @fragrance.save
        format.html { redirect_to fragrance_url(@fragrance), notice: "Fragrance was successfully created." }
        format.json { render :show, status: :created, location: @fragrance }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fragrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fragrances/1 or /fragrances/1.json
  def update
    respond_to do |format|
      if @fragrance.update(fragrance_params)
        format.html { redirect_to fragrance_url(@fragrance), notice: "Fragrance was successfully updated." }
        format.json { render :show, status: :ok, location: @fragrance }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fragrance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fragrances/1 or /fragrances/1.json
  def destroy
    @fragrance.destroy

    respond_to do |format|
      format.html { redirect_to fragrances_url, notice: "Fragrance was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fragrance
      @fragrance = Fragrance.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fragrance_params
      params.require(:fragrance).permit(:name, :x, :y)
    end
end
