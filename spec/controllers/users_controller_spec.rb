require 'rails_helper'

describe UsersController do
  describe 'with user login' do
    before do
      @user = create(:user)
      sign_in @user
    end
    describe 'Get #show' do
      it 'assigns the requested to @user' do
        user = create(:user)
        get :show, id: user
        expect(assigns(:user)).to eq user
      end
      it 'renders the :show templates' do
        user = create(:user)
        get :show, id: user
        expect(response).to render_template :show
      end
    end
    describe 'Get #edit' do
      it 'assigns the requested user to @user' do
        user = create(:user)
        get :edit, id: subject.current_user
        expect(assigns(:user)).to eq subject.current_user
      end
      it 'renders the :edit templates' do
        user = create(:user)
        get :edit, id: user
        expect(response).to render_template :edit
      end
    end
    describe 'Patch #update' do
      it "changes @user's attributes" do
        user = create(:user , nickname: "vvv")
        patch :update, id: user, user: attributes_for(:user)
        user.reload
        expect(user.nickname).to eq("vvv")
      end
      it "redirect to root_path" do
        user = create(:user)
        patch :update, id: user, user: attributes_for(:user)
        expect(response).to redirect_to root_path
      end
    end
  end
  describe 'without user login' do
    describe 'Get #edit' do
      it 'redirect to sign_in page' do
        user = create(:user)
        get :edit, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
    describe 'Patch #update' do
      it 'redirect to sign_in page' do
        user = create(:user)
        get :update, id: user
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
