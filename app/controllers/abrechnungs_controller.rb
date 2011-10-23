class AbrechnungsController < ApplicationController
  # GET /abrechnungs
  # GET /abrechnungs.xml
  def index
		@wg = Wg.find(params[:wg_id])
		@rechnung = Rechnung.find(params[:rechnung_id])
		@abrechnungs = Abrechnung.where(:rechnung_id => @rechnung.id)
	
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @abrechnungs }
    end
  end

  # GET /abrechnungs/1
  # GET /abrechnungs/1.xml
  def show
    @abrechnung = Abrechnung.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @abrechnung }
    end
  end

  # GET /abrechnungs/new
  # GET /abrechnungs/new.xml
  def new
    @abrechnung = Abrechnung.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @abrechnung }
    end
  end

  # GET /abrechnungs/1/edit
  def edit
    @abrechnung = Abrechnung.find(params[:id])
  end

  # POST /abrechnungs
  # POST /abrechnungs.xml
  def create
    redirect_to wg_rechnung_abrechnungs_path(params[:wg_id],params[:rechnung_id])  unless params[:abrechnung].present? && params[:abrechnung][:rechnung_id].present? && params[:abrechnung][:user_id].present?
		@user = User.find(params[:abrechnung][:user_id])
		@rechnung = Rechnung.find(params[:abrechnung][:rechnung_id])
	
		@abrechnung = Abrechnung.find_or_create_by_rechnung_id_and_user_id(:rechnung_id => params[:abrechnung][:rechnung_id], :user_id => params[:abrechnung][:user_id])
		# @abrechnung = Abrechnung.new(params[:abrechnung])
		
		mail = RechnungMailer.neue_rechnung(@user,@rechnung)
		mail.deliver
		@abrechnung.mail = mail
    respond_to do |format|
      if @abrechnung.save
        format.html { redirect_to(wg_rechnung_abrechnungs_path(params[:wg_id],params[:rechnung_id]), :notice => 'Abrechnung wurde verschickt.') }
        format.xml  { render :xml => @abrechnung, :status => :created, :location => @abrechnung }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @abrechnung.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /abrechnungs/1
  # PUT /abrechnungs/1.xml
  def update
    @abrechnung = Abrechnung.find(params[:id])

    respond_to do |format|
      if @abrechnung.update_attributes(params[:abrechnung])
        format.html { redirect_to(@abrechnung, :notice => 'Abrechnung was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @abrechnung.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /abrechnungs/1
  # DELETE /abrechnungs/1.xml
  def destroy
    @abrechnung = Abrechnung.find(params[:id])
    @abrechnung.destroy

    respond_to do |format|
      format.html { redirect_to(abrechnungs_url) }
      format.xml  { head :ok }
    end
  end
end
