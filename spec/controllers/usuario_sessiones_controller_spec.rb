require File.dirname(__FILE__) + '/../spec_helper'
 
describe UsuarioSessionesController do
  fixtures :all
  integrate_views
  
  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end
  
  it "show action should render show template" do
    get :show, :id => UsuarioSession.first
    response.should render_template(:show)
  end
  
  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end
  
  it "create action should render new template when model is invalid" do
    UsuarioSession.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end
  
  it "create action should redirect when model is valid" do
    UsuarioSession.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(usuario_session_url(assigns[:usuario_session]))
  end
  
  it "edit action should render edit template" do
    get :edit, :id => UsuarioSession.first
    response.should render_template(:edit)
  end
  
  it "update action should render edit template when model is invalid" do
    UsuarioSession.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UsuarioSession.first
    response.should render_template(:edit)
  end
  
  it "update action should redirect when model is valid" do
    UsuarioSession.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UsuarioSession.first
    response.should redirect_to(usuario_session_url(assigns[:usuario_session]))
  end
  
  it "destroy action should destroy model and redirect to index action" do
    usuario_session = UsuarioSession.first
    delete :destroy, :id => usuario_session
    response.should redirect_to(usuario_sessiones_url)
    UsuarioSession.exists?(usuario_session.id).should be_false
  end
end
