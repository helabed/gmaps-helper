class CityGlobalLocationsController < ApplicationController
  # GET /city_global_locations
  # GET /city_global_locations.xml
  def index
    @city_global_locations = CityGlobalLocation.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @city_global_locations }
    end
  end

  # GET /city_global_locations/1
  # GET /city_global_locations/1.xml
  def show
    @city_global_location = CityGlobalLocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @city_global_location }
    end
  end

  # GET /city_global_locations/new
  # GET /city_global_locations/new.xml
  def new
    @city_global_location = CityGlobalLocation.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city_global_location }
    end
  end

  # GET /city_global_locations/1/edit
  def edit
    @city_global_location = CityGlobalLocation.find(params[:id])
  end

  # POST /city_global_locations
  # POST /city_global_locations.xml
  def create
    @city_global_location = CityGlobalLocation.new(params[:city_global_location])

    respond_to do |format|
      if @city_global_location.save
        flash[:notice] = 'CityGlobalLocation was successfully created.'
        format.html { redirect_to(@city_global_location) }
        format.xml  { render :xml => @city_global_location, :status => :created, :location => @city_global_location }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @city_global_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /city_global_locations/1
  # PUT /city_global_locations/1.xml
  def update
    @city_global_location = CityGlobalLocation.find(params[:id])

    respond_to do |format|
      if @city_global_location.update_attributes(params[:city_global_location])
        flash[:notice] = 'CityGlobalLocation was successfully updated.'
        format.html { redirect_to(@city_global_location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @city_global_location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /city_global_locations/1
  # DELETE /city_global_locations/1.xml
  def destroy
    @city_global_location = CityGlobalLocation.find(params[:id])
    @city_global_location.destroy

    respond_to do |format|
      format.html { redirect_to(city_global_locations_url) }
      format.xml  { head :ok }
    end
  end
end
