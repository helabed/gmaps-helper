class CountryCodesController < ApplicationController
  # GET /country_codes
  # GET /country_codes.xml
  def index
    @country_codes = CountryCode.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @country_codes }
    end
  end

  # GET /country_codes/1
  # GET /country_codes/1.xml
  def show
    @country_code = CountryCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @country_code }
    end
  end

  # GET /country_codes/new
  # GET /country_codes/new.xml
  def new
#    @country_code = CountryCode.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @country_code }
#    end
  end

  # GET /country_codes/1/edit
  def edit
#    @country_code = CountryCode.find(params[:id])
  end

  # POST /country_codes
  # POST /country_codes.xml
  def create
#    @country_code = CountryCode.new(params[:country_code])
#
#    respond_to do |format|
#      if @country_code.save
#        flash[:notice] = 'CountryCode was successfully created.'
#        format.html { redirect_to(@country_code) }
#        format.xml  { render :xml => @country_code, :status => :created, :location => @country_code }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @country_code.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # PUT /country_codes/1
  # PUT /country_codes/1.xml
  def update
#    @country_code = CountryCode.find(params[:id])
#
#    respond_to do |format|
#      if @country_code.update_attributes(params[:country_code])
#        flash[:notice] = 'CountryCode was successfully updated.'
#        format.html { redirect_to(@country_code) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @country_code.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # DELETE /country_codes/1
  # DELETE /country_codes/1.xml
  def destroy
#    @country_code = CountryCode.find(params[:id])
#    @country_code.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(country_codes_url) }
#      format.xml  { head :ok }
#    end
  end
end
