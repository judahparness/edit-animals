class EnclosuresController < ApplicationController
  before_action :set_enclosure, only: [:show, :edit, :update]

  # GET /enclosures
  # GET /enclosures.json
  def index
    @enclosures = Enclosure.all
  end

  # GET /enclosures/1
  # GET /enclosures/1.json
  def show
    @animal_enclosure = AnimalEnclosure.where(:enclosure_id=>@enclosure)
  end

  # GET /enclosures/new
  def new
    @enclosure = Enclosure.new
  end

  # GET /enclosures/1/edit
  def edit
  end

  # POST /enclosures
  # POST /enclosures.json
  def create
    aep = animal_enclosure_params["animal_id"]
    @enclosure = Enclosure.new(enclosure_params)

    respond_to do |format|
      if @enclosure.save
        # check if the user has specified an animal for the new enclosure
        unless aep == nil
          # our test is true so create a new AnimalEnclosure relationship record and save it
          @animal_enclosure = AnimalEnclosure.create(:animal_id=>aep, :enclosure_id=>@enclosure.id)

          format.html { redirect_to @enclosure, notice: "Enclosure was successfully created with animal #{Animal.find(aep).name}." }
        else
          format.html { redirect_to @enclosure, notice: "Enclosure was successfully created without animals." }
        end
        format.json { render :show, status: :created, location: @enclosure }
      else
        format.html { render :new }
        format.json { render json: @enclosure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /enclosures/1
  # PATCH/PUT /enclosures/1.json
  def update
    aep = animal_enclosure_params["animal_id"]
    query = AnimalEnclosure.find_by(:enclosure_id=>@enclosure.id)

    respond_to do |format|
      if @enclosure.update(enclosure_params)
        # Update animal/enclosure relationship as necessary
          if query == nil
            # No relationship found so create a new one
            AnimalEnclosure.create(:animal_id=>aep, :enclosure_id=>@enclosure.id)

            format.html { redirect_to @enclosure, notice: "Enclosure was successfully updated with animal #{Animal.find(aep).name}." }
          else
            # Destroy previous relationship and create a new one
            query.destroy
            AnimalEnclosure.create(:animal_id=>aep, :enclosure_id=>@enclosure.id)

            format.html { redirect_to @enclosure, notice: "Enclosure was successfully created without animals." }
          end
        format.json { render :show, status: :ok, location: @enclosure }
      else
        format.html { render :edit }
        format.json { render json: @enclosure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /enclosures/1
  # DELETE /enclosures/1.json
  #def destroy
  #  @enclosure.destroy
  #  respond_to do |format|
  #    format.html { redirect_to enclosures_url, notice: 'Enclosure was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_enclosure
      @enclosure = Enclosure.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def enclosure_params
      params.require(:enclosure).permit(:enclosure_number, :enclosure_type)
    end

    def animal_enclosure_params
      params.require(:animal_enclosure).permit("animal_id")
    end
end
