class RechnungsController < ApplicationController
  def index
		if params[:wg_id] != nil
			@wg = Wg.find(params[:wg_id])
			@rechnungen = @wg.rechnungs.order(:rechnungsdatum.to_s + " DESC")
		else
			@rechnungen = Rechnung.all
		end
  end

  def new
		@rechnung = Rechnung.new(:wg_id => params[:wg_id])
  end

  def create
		@rechnung = Rechnung.new(params[:rechnung])
		# @rechnung.recreate_from_file
		if @rechnung.save 
			begin
				@rechnung.recreate_from_file
				@rechnung.save!
				flash[:notice] = "Rechnung gespeichert"
				redirect_to wg_rechnungs_path(params[:wg_id])
				return
			rescue Exception => e
				puts e.inspect
				flash[:error] = "Sorry, ein Fehler ist aufgetreten"
				redirect_to :action => 'new'
			end
		else
			flash[:alert] = "Sorry, ein Fehler ist aufgetreten"
			render :action => 'new'
		end
  end

  def edit
  end

  def update
  end

  def destroy
		@rechnung = Rechnung.find(params[:id])
    @rechnung.destroy

    respond_to do |format|
      format.html { redirect_to(rechnungs_url) }
      format.xml  { head :ok }
    end
  end

	def show
		@rechnung = Rechnung.find(params[:id])
		if params[:wg_id] != nil
			@wg = Wg.find(params[:wg_id])
		end
	end


end
