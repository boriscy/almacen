class SolicitudesController < ApplicationController
  before_filter :verificar_permiso_actualizacion, :only => [:edit, :update, :destroy]
  # Asignacion de partial y de estado
  # # Asignacion de partial y de estado
  before_filter :asignar_partial, :only => [:index, :show]

  # Existen 3 tipos de busqueda
  # 1.- Cuando esta en estado "inicial" (propias)
  # 2.- Cuando esta en estaro "superior" (propias, subordinados, rechazadas, toda, todas, pendientes)
  # 3.- Permite todas filtrar por usuario y estado
  # Lo ideal seria agrupar todos los estados
  # ==== Ejemplos
  #   params[:estados] # => [1,2,3]

  # GET /solicitudes
  # GET /solicitudes.xml
  def index
    # Buscar todas las solicitudes realizadas por el usuario
    @solicitudes = Solicitud.paginate(:page => @page, :conditions => asignar_condiciones())
    # Muestra las solicitudes segun el estado
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @solicitud }
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

  # Creación de metodos mediante metaprogramación basado en los estados
  # en caso de que se aumenten estados se crearan los metodos necesarios
  # para aprobaciones, esto debido a la forma que se manejan los roles y permisos
  # IMPORTANTE: vean el código de config/routes.rb para entender mejor
  Solicitud.rutas_estados.each do |ruta|
    define_method ruta[:ruta] do
      solicitud = SolicitudEstado.find(params[:id])
      k = params[:rechazar] ? (ruta[:estado] * -1) : ruta[:estado]
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
  # Realiza la asignacion del partial que debe usar un usuario denpendiendo
  # del nivel de autorizacion que tiene para una solicitud y las rutas a las cuales puede
  # tener acceso. No solo asigna el partial sino tambien el estado maximo que puede tener
  # acceso el usuario en este controlador
  def asignar_partial
    @estado = SolicitudEstado.maximo_estado_permitido
    case @estado[:estado]
    when Solicitud.estado_inicial[0]
      @partial = "inicial"
    when (Solicitud.estado_inicial[0] - 1)
      @partial = "superior"
    else
      @partial = "aprobacion"
    end
  end

  # Verifica si es que el usuario puede actualizar su solicitud, para edit, update y destroy
  # dependiendo en el estado que este y los accesos que el mismo tenga
  def verificar_permiso_actualizacion
    solicitud = Solicitud.find(params[:id])
    ruta = Solicitud.estados[solicitud.read_attribute(:estado)][0]
    p = Permiso.controlador(params[:controller])
    # Si no tiene permiso es redireccionado
    unless p.acciones[ruta] or Solicitud.estado_inicial[0] == solicitud.read_attribute(:estado)
      flash[:notice] = "Usted ya no puede editar esta solicitud"
      redirect_to solicitudes_path
    end
  end

  # Realiza la asignacion de opciones para la busqueda en el index
  def asignar_condiciones(estado = @estado)
    conditions = {}
    case estado[:estado]
    when Solicitud.estado_inicial[0]
      conditions = {:usuario_id => current_user.id}
    when (Solicitud.estado_inicial[0] - 1)
      conditions = {:usuario_id => [current_user.id] + current_user.subordinado_ids}
    else
      if params[:usuarios]
        conditions.merge({:usuario_id => params[:usuarios]})
      end
    end

    if params[:estados]
      conditions[:estado] = params[:estados]
    end
    conditions

  end
end
