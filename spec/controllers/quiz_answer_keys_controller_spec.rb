require 'rails_helper'
require 'factory_girl'
include FactoryGirl::Syntax::Methods

RSpec.describe QuizAnswerKeysController, type: :controller do
  before(:each) do
    request.env['HTTP_REFERER'] = root_url
    @user = create :teacher
    login_as(@user)
  end

  let(:valid_attributes) {
    {
      title: 'Test Quiz'
    }
  }

  let(:invalid_attributes) {
    {
      title: ''
    }
  }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns the correct json response' do
      get :index, { format: 'json' }, valid_session
      json = JSON.parse(response.body)

      expect(json['draw']).to eq(0)
      expect(json['recordsTotal']).to eq(0)
      expect(json['recordsFiltered']).to eq(0)
      expect(json['data'].size).to eq(0)
    end

    it 'adds newly created quiz_answer_key to the json response' do
      QuizAnswerKey.create valid_attributes
      get :index, { format: 'json' }, valid_session
      json = JSON.parse(response.body)

      expect(json['draw']).to eq(0)
      expect(json['recordsTotal']).to eq(1)
      expect(json['recordsFiltered']).to eq(1)
      expect(json['data'].size).to eq(1)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested quiz_answer_key as @quiz_answer_key' do
      quiz_answer_key = QuizAnswerKey.create! valid_attributes
      get :show, { id: quiz_answer_key.to_param }, valid_session
      expect(assigns(:quiz_answer_key)).to eq(quiz_answer_key)
    end
  end

  describe 'GET #new' do
    it 'assigns a new quiz_answer_key as @quiz_answer_key' do
      get :new, {}, valid_session
      expect(assigns(:quiz_answer_key)).to be_a_new(QuizAnswerKey)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested quiz_answer_key as @quiz_answer_key' do
      quiz_answer_key = QuizAnswerKey.create! valid_attributes
      get :edit, { id: quiz_answer_key.to_param }, valid_session
      expect(assigns(:quiz_answer_key)).to eq(quiz_answer_key)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new QuizAnswerKey' do
        expect {
          post :create, { quiz_answer_key: valid_attributes }, valid_session
        }.to change(QuizAnswerKey, :count).by(1)
      end

      it 'assigns a newly created quiz_answer_key as @quiz_answer_key' do
        post :create, { quiz_answer_key: valid_attributes }, valid_session
        expect(assigns(:quiz_answer_key)).to be_a(QuizAnswerKey)
        expect(assigns(:quiz_answer_key)).to be_persisted
      end

      it 'redirects to the created quiz_answer_key' do
        post :create, { quiz_answer_key: valid_attributes }, valid_session
        expect(response).to redirect_to(QuizAnswerKey.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved quiz_answer_key as @quiz_answer_key' do
        post :create, { quiz_answer_key: invalid_attributes }, valid_session
        expect(assigns(:quiz_answer_key)).to be_a_new(QuizAnswerKey)
      end

      it "re-renders the 'new' template" do
        post :create, { quiz_answer_key: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        {
          title: 'New Test Quiz'
        }
      }

      it 'updates the requested quiz_answer_key' do
        quiz_answer_key = QuizAnswerKey.create! valid_attributes
        put :update, { id: quiz_answer_key.to_param, quiz_answer_key: new_attributes }, valid_session
        quiz_answer_key.reload

        expect(response).to redirect_to(quiz_answer_key)

        expect(quiz_answer_key.title).to eql new_attributes[:title]
      end

      it 'assigns the requested quiz_answer_key as @quiz_answer_key' do
        quiz_answer_key = QuizAnswerKey.create! valid_attributes
        put :update, { id: quiz_answer_key.to_param, quiz_answer_key: valid_attributes }, valid_session
        expect(assigns(:quiz_answer_key)).to eq(quiz_answer_key)
      end

      it 'redirects to the quiz_answer_key' do
        quiz_answer_key = QuizAnswerKey.create! valid_attributes
        put :update, { id: quiz_answer_key.to_param, quiz_answer_key: valid_attributes }, valid_session
        expect(response).to redirect_to(quiz_answer_key)
      end
    end

    context 'with invalid params' do
      it 'assigns the quiz_answer_key as @quiz_answer_key' do
        quiz_answer_key = QuizAnswerKey.create! valid_attributes
        put :update, { id: quiz_answer_key.to_param, quiz_answer_key: invalid_attributes }, valid_session
        expect(assigns(:quiz_answer_key)).to eq(quiz_answer_key)
      end

      it "re-renders the 'edit' template" do
        quiz_answer_key = QuizAnswerKey.create! valid_attributes
        put :update, { id: quiz_answer_key.to_param, quiz_answer_key: invalid_attributes }, valid_session
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested quiz_answer_key' do
      quiz_answer_key = QuizAnswerKey.create! valid_attributes
      expect do
        delete :destroy, { id: quiz_answer_key.to_param }, valid_session
      end.to change(QuizAnswerKey, :count).by(-1)
    end
  end
end
