class GbpnzdM5sController < ApplicationController
  before_action :set_gbpnzd_m5, only: %i[ show edit update destroy ]

  # GET /gbpnzd_m5s or /gbpnzd_m5s.json
  def index
    @gbpnzd_m5s = GbpnzdM5.all.order_by(time: :desc)
  end

  # GET /gbpnzd_m5s/1 or /gbpnzd_m5s/1.json
  def show
  end

  # GET /gbpnzd_m5s/new
  def new
    @gbpnzd_m5 = GbpnzdM5.new
  end

  # GET /gbpnzd_m5s/1/edit
  def edit
  end

  # POST /gbpnzd_m5s or /gbpnzd_m5s.json
  def create
    @gbpnzd_m5 = GbpnzdM5.new(gbpnzd_m5_params)

    respond_to do |format|
      if @gbpnzd_m5.save
        format.html { redirect_to gbpnzd_m5_url(@gbpnzd_m5), notice: "Gbpnzd m5 was successfully created." }
        format.json { render :show, status: :created, location: @gbpnzd_m5 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gbpnzd_m5.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gbpnzd_m5s/1 or /gbpnzd_m5s/1.json
  def update
    respond_to do |format|
      if @gbpnzd_m5.update(gbpnzd_m5_params)
        format.html { redirect_to gbpnzd_m5_url(@gbpnzd_m5), notice: "Gbpnzd m5 was successfully updated." }
        format.json { render :show, status: :ok, location: @gbpnzd_m5 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gbpnzd_m5.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gbpnzd_m5s/1 or /gbpnzd_m5s/1.json
  def destroy
    @gbpnzd_m5.destroy

    respond_to do |format|
      format.html { redirect_to gbpnzd_m5s_url, notice: "Gbpnzd m5 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gbpnzd_m5
      @gbpnzd_m5 = GbpnzdM5.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gbpnzd_m5_params
      params.require(:gbpnzd_m5).permit(:time, :open, :high, :low, :close, :change, :percentage, :bb_upper, :bb_middle, :bb_lower)
    end
end
