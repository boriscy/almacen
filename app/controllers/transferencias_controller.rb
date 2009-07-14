class TransferenciasController < ApplicationController
  # GET /transferencias
  # GET /transferencias.xml
  def index
    @transferencias = Transferencia.all(:include => [:origen, :destino])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @transferencias }
    end
  end

  # GET /transferencias/1
  # GET /transferencias/1.xml
  def show
    @transferencia = Transferencia.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @transferencia }
    end
  end

  # GET /transferencias/new
  # GET /transferencias/new.xml
  def new
    @transferencia = Transferencia.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @transferencia }
    end
  end

  # GET /transferencias/1/edit
  def edit
    @transferencia = Transferencia.find(params[:id])
  end

  # POST /transferencias
  # POST /transferencias.xml
  def create
    @transferencia = Transferencia.new(params[:transferencia])

    respond_to do |format|
      if @transferencia.save
        flash[:notice] = 'Transferencia was successfully created.'
        format.html { redirect_to(@transferencia) }
        format.xml  { render :xml => @transferencia, :status => :created, :location => @transferencia }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @transferencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /transferencias/1
  # PUT /transferencias/1.xml
  def update
    @transferencia = Transferencia.find(params[:id])

    respond_to do |format|
      if @transferencia.update_attributes(params[:transferencia])
        flash[:notice] = 'Transferencia was successfully updated.'
        format.html { redirect_to(@transferencia) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @transferencia.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /transferencias/1
  # DELETE /transferencias/1.xml
  def destroy
    @transferencia = Transferencia.find(params[:id])
    @transferencia.destroy

    respond_to do |format|
      format.html { redirect_to(transferencias_url) }
      format.xml  { head :ok }
    end
  end
end
