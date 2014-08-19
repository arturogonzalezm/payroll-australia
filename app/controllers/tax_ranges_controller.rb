class TaxRangesController < ApplicationController
  before_action :set_tax_range, only: [:show, :edit, :update, :destroy]

  # GET /tax_ranges
  # GET /tax_ranges.json
  def index
    @tax_ranges = TaxRange.all
  end

  # GET /tax_ranges/1
  # GET /tax_ranges/1.json
  def show
  end

  # GET /tax_ranges/new
  def new
    @tax_range = TaxRange.new
  end

  # GET /tax_ranges/1/edit
  def edit
  end

  # POST /tax_ranges
  # POST /tax_ranges.json
  def create
    @tax_range = TaxRange.new(tax_range_params)

    respond_to do |format|
      if @tax_range.save
        format.html { redirect_to @tax_range, notice: 'Tax range was successfully created.' }
        format.json { render :show, status: :created, location: @tax_range }
      else
        format.html { render :new }
        format.json { render json: @tax_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tax_ranges/1
  # PATCH/PUT /tax_ranges/1.json
  def update
    respond_to do |format|
      if @tax_range.update(tax_range_params)
        format.html { redirect_to @tax_range, notice: 'Tax range was successfully updated.' }
        format.json { render :show, status: :ok, location: @tax_range }
      else
        format.html { render :edit }
        format.json { render json: @tax_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tax_ranges/1
  # DELETE /tax_ranges/1.json
  def destroy
    @tax_range.destroy
    respond_to do |format|
      format.html { redirect_to tax_ranges_url, notice: 'Tax range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tax_range
      @tax_range = TaxRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tax_range_params
      params.require(:tax_range).permit(:income_min, :income_max, :rate, :tax_from_lower_range)
    end
end
