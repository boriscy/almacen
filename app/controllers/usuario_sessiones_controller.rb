class UsuarioSessionesController < ApplicationController
  def index
    @usuario_sessiones = UsuarioSession.find(:all)
  end
  
  def show
    @usuario_session = UsuarioSession.find(params[:id])
  end
  
  def new
    @usuario_session = UsuarioSession.new
  end
  
  def create
    @usuario_session = UsuarioSession.new(params[:usuario_session])
    if @usuario_session.save
      flash[:notice] = "Bienvenido Al Sitsema de Almacenes"
      redirect_to @usuario_session
    else
      flash[:notice] = "Usuario y/o Contraseña Incorrectos"
      render :action => 'new'
    end
  end
  
  def edit
    @usuario_session = UsuarioSession.find(params[:id])
  end
  
  def update
    @usuario_session = UsuarioSession.find(params[:id])
    if @usuario_session.update_attributes(params[:usuario_session])
      flash[:notice] = "Usted Actualizo Los Datos Del Usuario."
      redirect_to @usuario_session
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @usuario_session = UsuarioSession.find(params[:id])
    @usuario_session.destroy
    flash[:notice] = "Usted Salio del Sistema de Almacenes"
    redirect_to login_url
    end
end
