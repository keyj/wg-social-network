class ApplicationController < ActionController::Base
  include RedirectBack
	layout 'new'

	before_filter :set_locale
	before_filter :authenticate_user!
  
  helper_method :resource_class
  protect_from_forgery

  def current_user
    super || NilUser.new
  end

  def user_signed_in?
    !current_user.nil?
  end

	def set_locale
		I18n.locale = "de-DE"
	end
end
