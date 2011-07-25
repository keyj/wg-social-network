require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MsnsController do

  # This should return the minimal set of attributes required to create a valid
  # Msn. As you add validations to Msn, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all msns as @msns" do
      msn = Msn.create! valid_attributes
      get :index
      assigns(:msns).should eq([msn])
    end
  end

  describe "GET show" do
    it "assigns the requested msn as @msn" do
      msn = Msn.create! valid_attributes
      get :show, :id => msn.id.to_s
      assigns(:msn).should eq(msn)
    end
  end

  describe "GET new" do
    it "assigns a new msn as @msn" do
      get :new
      assigns(:msn).should be_a_new(Msn)
    end
  end

  describe "GET edit" do
    it "assigns the requested msn as @msn" do
      msn = Msn.create! valid_attributes
      get :edit, :id => msn.id.to_s
      assigns(:msn).should eq(msn)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Msn" do
        expect {
          post :create, :msn => valid_attributes
        }.to change(Msn, :count).by(1)
      end

      it "assigns a newly created msn as @msn" do
        post :create, :msn => valid_attributes
        assigns(:msn).should be_a(Msn)
        assigns(:msn).should be_persisted
      end

      it "redirects to the created msn" do
        post :create, :msn => valid_attributes
        response.should redirect_to(Msn.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved msn as @msn" do
        # Trigger the behavior that occurs when invalid params are submitted
        Msn.any_instance.stub(:save).and_return(false)
        post :create, :msn => {}
        assigns(:msn).should be_a_new(Msn)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Msn.any_instance.stub(:save).and_return(false)
        post :create, :msn => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested msn" do
        msn = Msn.create! valid_attributes
        # Assuming there are no other msns in the database, this
        # specifies that the Msn created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Msn.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => msn.id, :msn => {'these' => 'params'}
      end

      it "assigns the requested msn as @msn" do
        msn = Msn.create! valid_attributes
        put :update, :id => msn.id, :msn => valid_attributes
        assigns(:msn).should eq(msn)
      end

      it "redirects to the msn" do
        msn = Msn.create! valid_attributes
        put :update, :id => msn.id, :msn => valid_attributes
        response.should redirect_to(msn)
      end
    end

    describe "with invalid params" do
      it "assigns the msn as @msn" do
        msn = Msn.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Msn.any_instance.stub(:save).and_return(false)
        put :update, :id => msn.id.to_s, :msn => {}
        assigns(:msn).should eq(msn)
      end

      it "re-renders the 'edit' template" do
        msn = Msn.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Msn.any_instance.stub(:save).and_return(false)
        put :update, :id => msn.id.to_s, :msn => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested msn" do
      msn = Msn.create! valid_attributes
      expect {
        delete :destroy, :id => msn.id.to_s
      }.to change(Msn, :count).by(-1)
    end

    it "redirects to the msns list" do
      msn = Msn.create! valid_attributes
      delete :destroy, :id => msn.id.to_s
      response.should redirect_to(msns_url)
    end
  end

end
