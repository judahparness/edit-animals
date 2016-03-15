class AnimalEnclosuresController < ApplicationController
  before_action :set_animal_enclosure, only: [:show, :edit, :update]

  # GET /animal_enclosures
  # GET /animal_enclosures.json
  def index
    @animal_enclosures = AnimalEnclosure.all
  end

  # GET /animal_enclosures/1
  # GET /animal_enclosures/1.json
  def show
    @animals = @animal_enclosures.animals
    @enclosure = @animal_enclosures.enclosure
  end

  # GET /animal_enclosures/new
  def new
    @animal_enclosure = AnimalEnclosure.new
  end

  # GET /animal_enclosures/1/edit
  def edit
  end

  # POST /animal_enclosures
  # POST /animal_enclosures.json
  def create
    @animal_enclosure = AnimalEnclosure.new(animal_enclosure_params)

    respond_to do |format|
      if @animal_enclosure.save
        format.html { redirect_to @animal_enclosure, notice: 'Animal enclosure was successfully created.' }
        format.json { render :show, status: :created, location: @animal_enclosure }
      else
        format.html { render :new }
        format.json { render json: @animal_enclosure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animal_enclosures/1
  # PATCH/PUT /animal_enclosures/1.json
  def update
    respond_to do |format|
      if @animal_enclosure.update(animal_enclosure_params)
        format.html { redirect_to @animal_enclosure, notice: 'Animal enclosure was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal_enclosure }
      else
        format.html { render :edit }
        format.json { render json: @animal_enclosure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animal_enclosures/1
  # DELETE /animal_enclosures/1.json
  #def destroy
  #  @animal_enclosure.destroy
  #  respond_to do |format|
  #    format.html { redirect_to animal_enclosures_url, notice: 'Animal enclosure was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal_enclosure
      @animal_enclosure = AnimalEnclosure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_enclosure_params
      params.require(:animal_enclosure).permit(:animal_id, :enclosure_id)
    end
end
