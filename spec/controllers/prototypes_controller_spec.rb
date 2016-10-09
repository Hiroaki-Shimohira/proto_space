require 'rails_helper'

describe PrototypesController do
	describe 'GET #index' do
	    it "assigns the requested contact to @prototype" do
	    	prototypes = create_list(:prototype, 8)
	    	get :index
	    	expect(assigns(:prototypes)).to match(prototypes)
	    end

	    it "renders the :edit template" do
	    	get :index
	      expect(response).to render_template :index
	    end
    end
end
