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
      flash[:notice] = "Successfully created usuario session."
      redirect_to @usuario_session
    else
      render :action => 'new'
    end
  end
  
  def edit
    @usuario_session = UsuarioSession.find(params[:id])
  end
  
  def update
    @usuario_session = UsuarioSession.find(params[:id])
    if @usuario_session.update_attributes(params[:usuario_session])
      flash[:notice] = "Successfully updated usuario session."
      redirect_to @usuario_session
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @usuario_session = UsuarioSession.find(params[:id])
    @usuario_session.destroy
    flash[:notice] = "Successfully destroyed usuario session."
    redirect_to root_url
  end
end
