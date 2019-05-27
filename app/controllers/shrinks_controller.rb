class ShrinksController < ApplicationController
  before_action :set_shrink, only: [ :edit, :update, :destroy]

  # GET /shrinks
  # GET /shrinks.json
  def index
    @shrinks = Shrink.all
  end

  # GET /shrinks/1
  # GET /shrinks/1.json
  def show
    @shrink = Shrink.find_by_shortname(params["shortname"])
    redirect_to @shrink.proper_url
  end

  # GET /shrinks/new
  def new
    @shrink = Shrink.new
  end

  # GET /shrinks/1/edit
  def edit
  end

  # POST /shrinks
  # POST /shrinks.json
  def create
    @shrink = Shrink.new
    @shrink.originalname = params["shrink"]["originalname"]    
    respond_to do |format|
      if @shrink.compress_and_check_url
        if @shrink.save
          format.html { redirect_to shrinks_path, notice: 'Shrink was successfully created.' }
          format.json { render :show, status: :created, location: @shrink }
        else
          format.html { render :new }
          format.json { render json: @shrink.errors, status: :unprocessable_entity }
        end
      else
        format.html { redirect_to shrinks_path, notice: 'Url is already present.' }
      end
    end
  end

  # PATCH/PUT /shrinks/1
  # PATCH/PUT /shrinks/1.json
  def update
    respond_to do |format|
      if @shrink.update(shrink_params)
        format.html { redirect_to @shrink, notice: 'Shrink was successfully updated.' }
        format.json { render :show, status: :ok, location: @shrink }
      else
        format.html { render :edit }
        format.json { render json: @shrink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shrinks/1
  # DELETE /shrinks/1.json
  def destroy
    @shrink.destroy
    respond_to do |format|
      format.html { redirect_to shrinks_url, notice: 'Shrink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shrink
      @shrink = Shrink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shrink_params
      params.require(:shrink).permit(:originalname, :shortname)
    end
end
