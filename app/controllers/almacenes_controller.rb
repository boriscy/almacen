class AlmacenesController < ApplicationController
  before_filter :verificar_permiso

  # GET /almacenes
  # GET /almacenes.xml
  def index
    @almacenes = Almacen.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @almacenes }
    end
  end

  # GET /almacenes/1
  # GET /almacenes/1.xml
  def show
    @almacen = Almacen.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @almacen }
    end
  end

  # GET /almacenes/new
  # GET /almacenes/new.xml
  def new
    @almacen = Almacen.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @almacen }
    end
  end

  # GET /almacenes/1/edit
  def edit
    @almacen = Almacen.find(params[:id])
  end

  # POST /almacenes
  # POST /almacenes.xml
  def create
    @almacen = Almacen.new(params[:almacen])

    respond_to do |format|
      if @almacen.save
        flash[:notice] = 'El almacen fue correctamente creado.'
        format.html { redirect_to(@almacen) }
        format.xml  { render :xml => @almacen, :status => :created, :location => @almacen }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @almacen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /almacenes/1
  # PUT /almacenes/1.xml
  def update
    @almacen = Almacen.find(params[:id])

    respond_to do |format|
      if @almacen.update_attributes(params[:almacen])
        flash[:notice] = 'El almacen fue correctamente actualizado.'
        format.html { redirect_to(@almacen) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @almacen.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /almacenes/1
  # DELETE /almacenes/1.xml
  def destroy
    @almacen = Almacen.find(params[:id])
    @almacen.destroy
    
    respond_to do |format|
      format.html { redirect_to(almacenes_url) }
      format.xml  { head :ok }
    end
  end
end
