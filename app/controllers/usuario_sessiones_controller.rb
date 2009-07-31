class UsuarioSessionesController < ApplicationController
  def show
    @usuario_session = UsuarioSession.find(params[:id])
  end
  
  def new
    @usuario_session = UsuarioSession.new
  end
  
  def create
    @usuario_session = UsuarioSession.new(params[:usuario_session])
    if @usuario_session.save
      flash[:notice] = "Bienvenido Al Sistema de Almacenes"
      redirect_to @usuario_session
    else
      flash[:notice] = "Usuario y/o Contraseña Incorrectos"
      render :action => 'new'
    end
  end
  
  def destroy
    @usuario_session = UsuarioSession.find(params[:id])
    @usuario_session.destroy
    flash[:notice] = "Usted Salio del Sistema de Almacenes"
    redirect_to login_url
  end

end
