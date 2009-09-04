class SolicitudesController < ApplicationController
  before_filter :verificar_permiso, :except => [:index]
  before_filter :verificar_permiso_actualizacion, :only => [:edit, :update, :destroy]

  # GET /solicitudes
  # GET /solicitudes.xml
  def index
    # Buscar todas las solicitudes realizadas por el usuario
#    @solicitudes = Solicitud.paginate(:page => @page, :include => :usuario, :conditions => ["estado >=? AND usuario_id=?", 0, current_user.id])
    options = params
    options[:page] = @page
    @solicitudes = Solicitud.filtro(options)
    # Muestra las solicitudes segun el estado
    @aprobar = Solicitud.puede_aprobar_superior?
    respond_to do |format| 
      if request.xhr?
        format.html {render :partial => "lista"}
      else
        format.html
      end
      format.xml { render :xml => @solicitudes }
    end
  end

  # GET /solicitudes/1
  # GET /solicitudes/1.xml
  def show
    @solicitud = Solicitud.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @solicitud }
    end
  end

  # GET /solicitudes/new
  # GET /solicitudes/new.xml
  def new
     @solicitud = Solicitud.new(:solicitud_detalles_attributes => [{}])
  end

  # GET /solicitudes/1/edit
  def edit
    @solicitud = Solicitud.find(params[:id])
  end

  # POST /solicitudes
  # POST /solicitudes.xml
  def create
    @solicitud = Solicitud.new(params[:solicitud])
    respond_to do |format|
      if @solicitud.save
        flash[:notice] = 'La solicitud a sido correctamente creada.'
        format.html { redirect_to(@solicitud) }
        format.xml  { render :xml => @solicitud, :status => :created, :location => @solicitud }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solicitud.errors, :status => :unprocessable_entity }
      end
     end
  end

  # PUT /solicitudes/1
  # PUT /solicitudes/1.xml
  def update
    @solicitud = Solicitud.find(params[:id])
    respond_to do |format|
      if @solicitud.update_attributes(params[:solicitud])
        flash[:notice] = 'La solicitud a sido correctamente actualizada.'
        format.html { redirect_to(@solicitud) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # Hay que revisar con mas detalle que es lo que se debe hacer con las solicitudes
  # antes de eliminarlas
  # DELETE /solicitudes/1
  # DELETE /solicitudes/1.xml
  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy

    respond_to do |format|
      format.html { redirect_to(solicitudes_url) }
      format.xml  { head :ok }
    end
  end

  # Creación de metodos basado en los estados
  # en caso de que se aumenten estados se crearan los metodos necesarios
  # para aprobaciones, esto debido a la forma que se manejan los roles y permisos
  # IMPORTANTE: vean el código de config/routes.rb para entender mejor
  Solicitud.rutas_estados.each do |k, ruta|
    define_method ruta do
      solicitud = Solicitud.find(params[:id])
      if solicitud.cambiar_estado?(k)
        render :json => {:success => true, :estado => Solicitud.estados[k][1] }
      else
        render :json => {:success => false }
      end
    end
  end

 
  # Permite regresar a un estado anterior
  def desaprobar
    solicitud = Solicitud.find(params[:id])
    render :json => {:success => solicitud.desabilitar_estado() }
  end

  protected
  # Verifica si es que el usuario puede actualizar su solicitud
  # dependiendo en el estado que este y los accesos que el mismo tenga
  def verificar_permiso_actualizacion
    solicitud = Solicitud.find(params[:id])
    ruta = Solicitud.estados[solicitud.read_attribute(:estado)][0]
    p = Permiso.find_by_rol_id_and_controlador(current_user.rol_id, params[:controller])
    # Si no tiene permiso es redireccionado
    unless p.acciones[ruta] or Solicitud.estado_inicial[0] == solicitud.read_attribute(:estado)
      flash[:notice] = "Usted ya no puede editar esta solicitud"
      redirect_to solicitudes_path
    end
  end
end
