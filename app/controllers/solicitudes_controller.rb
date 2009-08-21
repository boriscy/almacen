class SolicitudesController < ApplicationController
  before_filter :verificar_permiso, :except => [:index]

  # GET /solicitudes
  # GET /solicitudes.xml
  def index
    @solicitudes = Solicitud.paginate(:page => @page, :include => :usuario,
        :conditions => ["estado >=?", 0])
    respond_to do |format| 
      format.html
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
      render :json => {:success => solicitud.cambiar_estado(k) }
    end
  end

 
  # Permite regresar a un estado anterior
  def desaprobar
    solicitud = Solicitud.find(params[:id])
    render :json => {:success => solicitud.desabilitar_estado() }
  end
end
