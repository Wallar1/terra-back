require 'rails_helper'

RSpec.describe SitesController, type: :controller do
  context 'Goes to site show page' do
    it 'Sets @site' do
      @site = create(:site, first_name: 'Craig', last_name: 'Wallace')
      get :show, params: {id: @site.id}
      expect(assigns(:success)).to be true
    end
  end  
end
