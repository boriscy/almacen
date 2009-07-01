class UsuariosController < ApplicationController
  # GET /Usuarios
  # GET /Usuarios.xml
  
  def index
    #@usuarios = Usuario.all
    #page = params[:page] || 1
    @usuarios = Usuario.paginate(:page => @page)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @usuarios }
    end
  end

  # GET /Usuarios/1
  # GET /Usuarios/1.xml
  def show
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @usuario }
    end
  end

  # GET /Usuarios/new
  # GET /Usuarios/new.xml
  def new
    @usuario = Usuario.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @Usuario }
    end
  end

  # GET /Usuarios/1/edit
  def edit
    @usuario = Usuario.find(params[:id])
  end

  # POST /Usuarios
  # POST /Usuarios.xml
  def create
    @usuario = Usuario.new(params[:usuario])

    respond_to do |format|
      if @usuario.save
        flash[:notice] = 'El usuario fue creado exitosamente.'
        format.html { redirect_to(@usuario) }
        format.xml  { render :xml => @usuario, :status => :created, :location => @usuario }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Usuarios/1
  # PUT /Usuarios/1.xml
  def update
    @usuario = Usuario.find(params[:id])

    respond_to do |format|
      if @usuario.update_attributes(params[:usuario])
        flash[:notice] = 'El usuario fue correctamente actualizado.'
        format.html { redirect_to(@usuario) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @usuario.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /Usuarios/1
  # DELETE /Usuarios/1.xml
  def destroy
    @usuario = Usuario.find(params[:id])
    @usuario.destroy

    respond_to do |format|
      format.html { redirect_to(usuarios_url) }
      format.xml  { head :ok }
    end
  end
end
