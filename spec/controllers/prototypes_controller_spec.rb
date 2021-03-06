require 'rails_helper'

describe PrototypesController do
  describe 'with user log in' do
    before do
      @user = create(:user)
      sign_in @user
    end
    describe 'GET #index' do
      it "assigns the requested contact to @prototype" do
        get :index
        prototypes = create_list(:prototype, 8)
        expect(assigns(:prototypes)).to match(prototypes)
      end

      it "renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe 'GET #show'do
      let(:prototype){create(:prototype)}
      it "assigns the requested contact to @prototype" do
        get :show, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end
      it "assigns the requested contact to @comment" do
        get :show, id: prototype
        expect(assigns(:comment)).to be_a_new(Comment)
      end
      it "assigns likes associated with prototype to @likes" do
        get :show, id: prototype
        expect(assigns(:likes)). to eq prototype.likes
      end
      it "renders the :show template" do
        get :show, id: prototype
        expect(response).to render_template :show
      end
    end

    describe 'GET #new' do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    describe 'POST #create' do
      describe 'with valid attributes' do
        let(:prototype){build(:prototype)}
        it 'saves the new prototype in the database' do
          post :create, prototype: attributes_for(:prototype)
          expect{prototype.save}.to change{ Prototype.count }.by(1)
        end
        it "redirect to index after post" do
          prototype = create(:prototype)
          post :create, prototype: attributes_for(:prototype)
          expect(response).to redirect_to root_path
        end
      end
      describe 'without valid attributes' do
        let(:prototype){build(:prototype, title:"")}
        it 'does not save prototype' do
          post :create, prototype: attributes_for(:prototype)
          expect{prototype.save}.not_to change{ Prototype.count }
        end
        it 'redirect_to new_prototype_path' do
          post :create, prototype: attributes_for(:prototype, title: "")
          expect(response).to redirect_to new_prototype_path
        end
      end
    end
    describe 'GET #edit' do
      let(:prototype){create(:prototype)}
      it 'renders the :edit template' do
        get :edit, id: prototype
        expect(response).to render_template :edit
      end
      it 'assigns the requested contact to @prototype' do
        get :edit , id: prototype
        expect(assigns(:prototype)).to eq prototype
      end
    end
    describe 'PATCH #update' do
      let(:prototype){create(:prototype)}
      describe "with valid attributes" do
        it 'saves the edited prototype in the database' do
          patch :update, id: prototype, prototype: attributes_for(:prototype, title: "vvv")
          prototype.reload
          expect(prototype.title).to eq("vvv")
        end
        it "redirect to root_path after post" do
          patch :update, id: prototype, prototype: attributes_for(:prototype)
          expect(response).to redirect_to root_path
        end
      end
      describe "without valid attributes" do
        it 'does not saves the edited prototype in the database' do
          patch :update, id: prototype, prototype: attributes_for(:prototype, title: "")
          prototype.reload
          expect(prototype.title).to eq(prototype.title)
        end
      end
    end
    describe 'DELETE #destroy' do
      let(:prototype){create(:prototype)}
      it 'assigns the requested contact to @prototype' do
        delete :destroy , id: prototype
        expect(assigns(:prototype)).to eq prototype
      end
      it 'deletes the prototype' do
        delete :destroy, id: prototype
        expect{prototype.destroy}.to change{ Prototype.count }.by(-1)
      end
      it "redirect to index after destroy" do
        delete :destroy, id: prototype
        expect(response).to redirect_to root_path
      end
    end
  end
  describe 'whihout user log in' do
    let(:prototype){create(:prototype)}
    describe 'GET #new' do
      it 'redirects sign_in page' do
        get :new
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'POST #create' do
      it 'redirects sign_in page' do
        post :create
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'GET #edit' do
      it 'redirects sign_in page' do
        get :edit, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'PATCH #update' do
      it 'redirects sign_in page' do
        patch :update, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end

    describe 'DELETE #destroy' do
      it 'redirects sign_in page' do
        delete :destroy, id: prototype
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
