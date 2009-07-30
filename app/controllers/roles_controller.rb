class RolesController < ApplicationController
  def index
    @roles = Rol.paginate(:page => @page)
  end

  def new
    @controladores = list_controllers
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
  end

  def update
  end

  def destroy
  end


  protected
  # Lista todos los controladores y acciones de la aplicacion
  def list_controllers
    ret = []
    controllers = Dir.new("#{RAILS_ROOT}/app/controllers").entries.sort.select{|c| c =~ /_controller\.rb$/ and c != "application_controller.rb"}
    controllers.each do |controller|
      size = controller.size - 3
      cont = controller[0, size].classify.constantize.new
      actions = (cont.methods - cont.private_methods - cont.protected_methods - ApplicationController.methods - ApplicationController.new.methods).sort
      h = {}
      actions.each{|v| h[v] = "0" }
      ret << [controller[0, size].classify, h]
    end
    ret
  end
end
