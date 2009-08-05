class RolesController < ApplicationController
  before_filter :verificar_permiso

  def index
    @roles = Rol.paginate(:page => @page)
  end

  def new
    @controladores = Rol.list_controllers
    @rol = Rol.new(:permisos_attributes => @controladores.map{|c| {:controlador => c[0], :acciones => c[1]} })
  end

  def create
    rol = Rol.new(params[:rol])
    if rol.save
      flash[:notice] = "El Rol a sido correctamente salvado."
      redirect_to roles_path
    else
      render :new
    end
  end

  def edit
    @rol = Rol.find(params[:id], :include => :permisos)
    # Metodos necesario para poder actualizar los roles y acciones nuevas o que hayan cambiado en los controladores
    @rol.actualizar  
  end

  def update
    @rol = Rol.find(params[:id])
    if @rol.update_attributes(params[:rol]) 
      flash[:notice] = "Se actualizado el Rol correctamente."
      redirect_to roles_url
    end
  end

  def destroy
    @rol = Rol.find(params[:id])
    @rol.destroy
    flash[:notice] = "Se ha borrado correctamente el rol #{@rol}."
    redirect_to roles_url
  end

end
