class MsnsController < ApplicationController
  # GET /msns
  # GET /msns.xml
  def index
    @msns = Msn.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @msns }
    end
  end

  # GET /msns/1
  # GET /msns/1.xml
  def show
    @msn = Msn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @msn }
    end
  end

  # GET /msns/new
  # GET /msns/new.xml
  def new
    @msn = Msn.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @msn }
    end
  end

  # GET /msns/1/edit
  def edit
    @msn = Msn.find(params[:id])
  end

  # POST /msns
  # POST /msns.xml
  def create
    @msn = Msn.new(params[:msn])

    respond_to do |format|
      if @msn.save
        format.html { redirect_to(@msn, :notice => 'Msn was successfully created.') }
        format.xml  { render :xml => @msn, :status => :created, :location => @msn }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @msn.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /msns/1
  # PUT /msns/1.xml
  def update
    @msn = Msn.find(params[:id])

    respond_to do |format|
      if @msn.update_attributes(params[:msn])
        format.html { redirect_to(@msn, :notice => 'Msn was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @msn.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /msns/1
  # DELETE /msns/1.xml
  def destroy
    @msn = Msn.find(params[:id])
    @msn.destroy

    respond_to do |format|
      format.html { redirect_to(msns_url) }
      format.xml  { head :ok }
    end
  end
end
