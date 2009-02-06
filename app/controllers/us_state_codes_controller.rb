class UsStateCodesController < ApplicationController
  # GET /us_state_codes
  # GET /us_state_codes.xml
  def index
    @us_state_codes = UsStateCode.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @us_state_codes }
    end
  end

  # GET /us_state_codes/1
  # GET /us_state_codes/1.xml
  def show
    @us_state_code = UsStateCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @us_state_code }
    end
  end

  # GET /us_state_codes/new
  # GET /us_state_codes/new.xml
  def new
#    @us_state_code = UsStateCode.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.xml  { render :xml => @us_state_code }
#    end
  end

  # GET /us_state_codes/1/edit
  def edit
#    @us_state_code = UsStateCode.find(params[:id])
  end

  # POST /us_state_codes
  # POST /us_state_codes.xml
  def create
#    @us_state_code = UsStateCode.new(params[:us_state_code])
#
#    respond_to do |format|
#      if @us_state_code.save
#        flash[:notice] = 'UsStateCode was successfully created.'
#        format.html { redirect_to(@us_state_code) }
#        format.xml  { render :xml => @us_state_code, :status => :created, :location => @us_state_code }
#      else
#        format.html { render :action => "new" }
#        format.xml  { render :xml => @us_state_code.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # PUT /us_state_codes/1
  # PUT /us_state_codes/1.xml
  def update
#    @us_state_code = UsStateCode.find(params[:id])
#
#    respond_to do |format|
#      if @us_state_code.update_attributes(params[:us_state_code])
#        flash[:notice] = 'UsStateCode was successfully updated.'
#        format.html { redirect_to(@us_state_code) }
#        format.xml  { head :ok }
#      else
#        format.html { render :action => "edit" }
#        format.xml  { render :xml => @us_state_code.errors, :status => :unprocessable_entity }
#      end
#    end
  end

  # DELETE /us_state_codes/1
  # DELETE /us_state_codes/1.xml
  def destroy
#    @us_state_code = UsStateCode.find(params[:id])
#    @us_state_code.destroy
#
#    respond_to do |format|
#      format.html { redirect_to(us_state_codes_url) }
#      format.xml  { head :ok }
#    end
  end
end
