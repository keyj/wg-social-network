class WgsController < ApplicationController
  # GET /wgs
  # GET /wgs.xml
  def index
    @wgs = Wg.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wgs }
    end
  end

  # GET /wgs/1
  # GET /wgs/1.xml
  def show
    @wg = Wg.find(params[:id])
		if @wg.users.include?(current_user)
    	respond_to do |format|
      	format.html # show.html.erb
      	format.xml  { render :xml => @wg }
			end
    else
			redirect_to(root_url, :alert => 'Sorry, dafuer hast Du keine Berechtigung')
			
		end
  end

  # GET /wgs/new
  # GET /wgs/new.xml
  def new
    @wg = Wg.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wg }
    end
  end

  # GET /wgs/1/edit
  def edit
    @wg = Wg.find(params[:id])
  end

  # POST /wgs
  # POST /wgs.xml
  def create
    @wg = Wg.new(params[:wg])

    respond_to do |format|
      if @wg.save
        format.html { redirect_to(@wg, :notice => 'Wg was successfully created.') }
        format.xml  { render :xml => @wg, :status => :created, :location => @wg }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wgs/1
  # PUT /wgs/1.xml
  def update
    @wg = Wg.find(params[:id])

    respond_to do |format|
      if @wg.update_attributes(params[:wg])
        format.html { redirect_to(@wg, :notice => 'Wg was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wgs/1
  # DELETE /wgs/1.xml
  def destroy
    @wg = Wg.find(params[:id])
    @wg.destroy

    respond_to do |format|
      format.html { redirect_to(wgs_url) }
      format.xml  { head :ok }
    end
  end
end
