class GbpnzdsController < ApplicationController
  before_action :set_gbpnzd, only: %i[ show edit update destroy ]

  # GET /gbpnzds or /gbpnzds.json
  def index
    @gbpnzds = Gbpnzd.all.last(100)
  end

  # GET /gbpnzds/1 or /gbpnzds/1.json
  def show
  end

  # GET /gbpnzds/new
  def new
    @gbpnzd = Gbpnzd.new
  end

  # GET /gbpnzds/1/edit
  def edit
  end

  # POST /gbpnzds or /gbpnzds.json
  def create
    @gbpnzd = Gbpnzd.new(gbpnzd_params)

    respond_to do |format|
      if @gbpnzd.save
        format.html { redirect_to gbpnzd_url(@gbpnzd), notice: "Gbpnzd was successfully created." }
        format.json { render :show, status: :created, location: @gbpnzd }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gbpnzd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gbpnzds/1 or /gbpnzds/1.json
  def update
    respond_to do |format|
      if @gbpnzd.update(gbpnzd_params)
        format.html { redirect_to gbpnzd_url(@gbpnzd), notice: "Gbpnzd was successfully updated." }
        format.json { render :show, status: :ok, location: @gbpnzd }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gbpnzd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gbpnzds/1 or /gbpnzds/1.json
  def destroy
    @gbpnzd.destroy

    respond_to do |format|
      format.html { redirect_to gbpnzds_url, notice: "Gbpnzd was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gbpnzd
      @gbpnzd = Gbpnzd.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gbpnzd_params
      params.require(:gbpnzd).permit(:epoch, :quote)
    end
end
