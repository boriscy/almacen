# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :adicionar_paginacion
  # Para poder mostrar Ajax
  layout proc{|controller| controller.request.xhr? ? false : "application"}

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected

  def adicionar_paginacion
    @page = params[:page] || 1
  end
end
