class UnidadMedidasController < ApplicationController
  # GET /unidad_medidas
  # GET /unidad_medidas.xml
  def index
    @unidad_medidas = UnidadMedida.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @unidad_medidas }
    end
  end

  # GET /unidad_medidas/1
  # GET /unidad_medidas/1.xml
  def show
    @unidad_medida = UnidadMedida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @unidad_medida }
    end
  end

  # GET /unidad_medidas/new
  # GET /unidad_medidas/new.xml
  def new
    @unidad_medida = UnidadMedida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @unidad_medida }
    end
  end

  # GET /unidad_medidas/1/edit
  def edit
    @unidad_medida = UnidadMedida.find(params[:id])
  end

  # POST /unidad_medidas
  # POST /unidad_medidas.xml
  def create
    @unidad_medida = UnidadMedida.new(params[:unidad_medida])

    respond_to do |format|
      if @unidad_medida.save
        flash[:notice] = 'UnidadMedida was successfully created.'
        format.html { redirect_to(@unidad_medida) }
        format.xml  { render :xml => @unidad_medida, :status => :created, :location => @unidad_medida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @unidad_medida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /unidad_medidas/1
  # PUT /unidad_medidas/1.xml
  def update
    @unidad_medida = UnidadMedida.find(params[:id])

    respond_to do |format|
      if @unidad_medida.update_attributes(params[:unidad_medida])
        flash[:notice] = 'UnidadMedida was successfully updated.'
        format.html { redirect_to(@unidad_medida) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @unidad_medida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /unidad_medidas/1
  # DELETE /unidad_medidas/1.xml
  def destroy
    @unidad_medida = UnidadMedida.find(params[:id])
    @unidad_medida.destroy

    respond_to do |format|
      format.html { redirect_to(unidad_medidas_url) }
      format.xml  { head :ok }
    end
  end
end
