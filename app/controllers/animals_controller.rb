class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show, :edit, :update]

  # GET /animals
  # GET /animals.json
  def index
    @animals = Animal.all
  end

  # GET /animals/1
  # GET /animals/1.json
  def show
    animal_enclosure = AnimalEnclosure.find_by(:animal_id=>@animal)

    unless animal_enclosure == nil
      @enclosure = animal_enclosure.enclosure 
    end
    
    @specie = @animal.specie
  end

  # GET /animals/new
  def new
    @animal = Animal.new
  end

  # GET /animals/1/edit
  def edit
  end

  # POST /animals
  # POST /animals.json
  def create
    aep = animal_enclosure_params["enclosure_id"]
    @animal = Animal.new(animal_params)

    respond_to do |format|
      if @animal.save
        # check if the user has specified an enclosure for the new animal
        unless aep == nil
          # our test is true so create a new AnimalEnclosure relationship record and save it
          @animal_enclosure = AnimalEnclosure.create(:animal_id=>@animal.id, :enclosure_id=>aep)

          format.html { redirect_to @animal, notice: "Animal was successfully created with Enclosure #{@animal_enclosure.enclosure.enclosure_number} (#{@animal_enclosure.enclosure.enclosure_type})." }
        else
          format.html { redirect_to @animal, notice: "Animal was successfully created without Enclosure." }
        end
        format.json { render :show, status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    aep = animal_enclosure_params["enclosure_id"]
    query = AnimalEnclosure.find_by(:animal_id=>@animal.id)

    respond_to do |format|
      if @animal.update(animal_params)
          # Update animal/enclosure relationship as necessary
          if query == nil
            # No relationship found so create a new one
            AnimalEnclosure.create(:animal_id=>@animal.id, :enclosure_id=>aep)

            format.html { redirect_to @animal, notice: "Animal was successfully updated with new Enclosure. #{aep}"  }
          else
            # Destroy previous relationship and create a new one
            query.destroy
            AnimalEnclosure.create(:animal_id=>@animal.id, :enclosure_id=>aep)

            format.html { redirect_to @animal, notice: "Animal was successfully updated and moved to Enclosure #{Enclosure.find(aep).enclosure_number}." }
          end
          format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  #def destroy
  #  @animal.destroy
  #  respond_to do |format|
  #    format.html { redirect_to animals_url, notice: 'Animal was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def animal_params
      params.require(:animal).permit(:name, :specie_id)
    end

    def animal_enclosure_params
      params.require(:animal_enclosure).permit("enclosure_id")
    end
end
