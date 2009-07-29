class PartidasController < ApplicationController
  # GET /partidas
  # GET /partidas.xml
  def index
    @partidas = Partida.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @partidas }
    end
  end

  # GET /partidas/1
  # GET /partidas/1.xml
  def show
    @partida = Partida.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @partida }
    end
  end

  # GET /partidas/new
  # GET /partidas/new.xml
  def new
    @partida = Partida.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @partida }
    end
  end

  # GET /partidas/1/edit
  def edit
    @partida = Partida.find(params[:id])
  end

  # POST /partidas
  # POST /partidas.xml
  def create
    @partida = Partida.new(params[:partida])

    respond_to do |format|
      if @partida.save
        flash[:notice] = 'La Partida fue correctamente creada.'
        format.html { redirect_to(@partida) }
        format.xml  { render :xml => @partida, :status => :created, :location => @partida }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @partida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /partidas/1
  # PUT /partidas/1.xml
  def update
    @partida = Partida.find(params[:id])

    respond_to do |format|
      if @partida.update_attributes(params[:partida])
        flash[:notice] = 'La Partida fue correctamente actualizada.'
        format.html { redirect_to(@partida) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @partida.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /partidas/1
  # DELETE /partidas/1.xml
  def destroy
    @partida = Partida.find(params[:id])
    @partida.destroy

    respond_to do |format|
      format.html { redirect_to(partidas_url) }
      format.xml  { head :ok }
    end
  end
end
