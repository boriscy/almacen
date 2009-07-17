class SolicitudesController < ApplicationController
  # GET /Solicituds
  # GET /Solicituds.xml
  
  def index
    #@solicitudes = Solicitud.all
    #page = params[:page] || 1
    @solicitudes = Solicitud.paginate(:page => @page)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @solicitudes }
    end
  end

  # GET /Solicituds/1
  # GET /Solicituds/1.xml
  def show
    @solicitud = Solicitud.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @solicitud }
    end
  end

  # GET /Solicituds/new
  # GET /Solicituds/new.xml
  def new
    @solicitud = Solicitud.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @Solicitud }
    end
  end

  # GET /Solicituds/1/edit
  def edit
    @solicitud = Solicitud.find(params[:id])
  end

  # POST /Solicituds
  # POST /Solicituds.xml
  def create
    @solicitud = Solicitud.new(params[:usuario])

    respond_to do |format|
      if @solicitud.save
        flash[:notice] = 'El usuario fue creado exitosamente.'
        format.html { redirect_to(@solicitud) }
        format.xml  { render :xml => @solicitud, :status => :created, :location => @solicitud }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @solicitud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Solicituds/1
  # PUT /Solicituds/1.xml
  def update
    @solicitud = Solicitud.find(params[:id])

    respond_to do |format|
      if @solicitud.update_attributes(params[:usuario])
        flash[:notice] = 'El usuario fue correctamente actualizado.'
        format.html { redirect_to(@solicitud) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @solicitud.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Solicituds/1
  # DELETE /Solicituds/1.xml
  def destroy
    @solicitud = Solicitud.find(params[:id])
    @solicitud.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end

end
