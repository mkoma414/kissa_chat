require 'rails_helper'

context 'user_signed_in' do
  let(:group){ create(:group, users: [ user ]) }
  let(:user){ create(:user) }
  let(:message){ create(:message) }

  describe MessagesController do
    describe 'GET #index' do

      before do
        login_user(user)
      end

      it 'assigns the requested group to @group' do
        get :index, params: { group_id: group }
        expect(assigns(:group)).to eq group
      end

      it 'renders the :index template' do
        get :index, params: { group_id: group }
        expect(response).to render_template :index
      end

      it 'assigns the requested message to @message' do
        get :index, params: { group_id: group }
        expect(assigns(:message)).to be_a_new(Message)
      end

    end

    describe 'POST #create' do
    end

  end

  
end

context 'user_signed_out' do
  describe 'GET #index' do
  end

  describe 'POST #create' do
  end
end

