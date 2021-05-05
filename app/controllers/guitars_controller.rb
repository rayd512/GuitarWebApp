class GuitarsController < ApplicationController
  before_action :set_guitar, only: [:show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [:show_all, :search]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /guitars or /guitars.json
  def index
    @guitars = current_user.guitars if user_signed_in?
  end


  # GET /guitars/1 or /guitars/1.json
  def show
  end

  def search
    public_guitars = Guitar.where("public = ?", true)
    @guitars = public_guitars.search(params[:search]).to_set
    user_results = User.search(params[:search])
    user_results.each do |user|
      @guitars = @guitars.merge(user.guitars.where("public = ?", true).to_set)
    end

  end

  # GET /guitars/new
  def new
    @guitar = Guitar.new
  end

  def show_all
    @guitars = Guitar.all.where("public = ?", true)
  end

  # GET /guitars/1/edit
  def edit
  end

  # POST /guitars or /guitars.json
  def create
    @guitar = Guitar.new(guitar_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @guitar.save
        format.html { redirect_to @guitar, notice: "Guitar was successfully created." }
        format.json { render :show, status: :created, location: @guitar }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @guitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guitars/1 or /guitars/1.json
  def update
    respond_to do |format|
      if @guitar.update(guitar_params)
        format.html { redirect_to @guitar, notice: "Guitar was successfully updated." }
        format.json { render :show, status: :ok, location: @guitar }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @guitar.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guitars/1 or /guitars/1.json
  def destroy
    @guitar.destroy
    respond_to do |format|
      format.html { redirect_to guitars_url, notice: "Guitar was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @guitar = current_user.guitars.find_by(id: params[:id])
    redirect_to guitars_path, notice: "Not Authorized" if @guitar.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guitar
      @guitar = Guitar.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def guitar_params
      params.require(:guitar).permit(:name, :brand, :price, :serial, :img, :public)
    end
end
