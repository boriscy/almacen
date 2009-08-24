# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  before_filter :adicionar_paginacion

  # Para poder mostrar Ajax
  layout proc{|controller| controller.request.xhr? ? false : "application"}
  helper_method :current_user  
    
   private  
   def current_user_session  
     return @current_user_session if defined?(@current_user_session)  
     @current_user_session = UsuarioSession.find  
   end  
     
   def current_user  
     @current_user = current_user_session && current_user_session.record  
   end  

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  protected
  def adicionar_paginacion
    @page = params[:page] || 1
  end

  # Fución que permite verificar el permiso de un usuario
  def verificar_permiso
    usuario = current_user
    if usuario
      permiso = Permiso.find_by_rol_id_and_controlador(usuario.rol_id, params[:controller])
      unless permiso and permiso.acciones[params[:action]]
        redirect_to "/login"
      end
    else
      redirect_to "/login"
    end
  end
end
