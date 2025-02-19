require 'rails_helper'

RSpec.describe Api::V1::CampaignsController, type: :request do
  let(:user) { create(:user) }
  let(:second_user) { create(:user) }
  let!(:application) {
    Doorkeeper::Application.create(
      name: Faker::Internet.password,
      redirect_uri: "urn:ietf:wg:oauth:2.0:oob",
      confidential: false
    )
  }

  let(:access_token) { Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: user.id) }
  let(:second_access_token) { Doorkeeper::AccessToken.create!(application_id: application.id, resource_owner_id: second_user.id) }

  it 'renders the index' do
    get api_v1_campaigns_path, headers: { Authorization: "Bearer #{access_token.token}" }
    expect(response).to have_http_status(:ok)
  end

  context 'when the user is not allowed' do
    describe 'update' do
      it 'does not update the campaign' do
        campaign = create(:campaign, user: user, name: 'nome antes')
        patch api_v1_campaign_path(campaign), params: { campaign: { name: 'teste 123' } }, headers: { Authorization: "Bearer #{second_access_token.token}" }
        campaign.reload

        expect(campaign.name).to eq('nome antes')
      end

      it 'allows original user' do
        campaign = create(:campaign, user: user, name: 'nome antes2')
        patch api_v1_campaign_path(campaign), params: { campaign: { name: 'teste 123' } }, headers: { Authorization: "Bearer #{access_token.token}" }
        campaign.reload

        expect(campaign.name).to eq('teste 123')
      end
    end
  end

  # context 'when logged user is a librarian' do
  #   describe 'create and update' do
  #     it 'creates a new book' do
  #       book = build(:book)

  #       assert_difference("Book.count") do
  #         post api_v1_campaigns_path, params: { book: book.attributes }, headers: { Authorization: "Bearer #{access_token.token}" }
  #       end
  #     end

  #     it 'renders create errors' do
  #       book = build(:book, genre: nil)
  #       post api_v1_campaigns_path, params: { book: book.attributes }, headers: { Authorization: "Bearer #{access_token.token}" }

  #       expect(response.code).to eq("400")
  #       expect(JSON.parse(response.body)['errors']).to include("Genre can't be blank")
  #     end

  #     it 'updates a book' do
  #       book = create(:book)
  #       patch api_v1_book_path(book), params: { book: { title: 'teste 123' } }, headers: { Authorization: "Bearer #{access_token.token}" }
  #       book.reload

  #       expect(book.title).to eq('teste 123')
  #     end

  #     it 'destroys a book' do
  #       book = create(:book)

  #       assert_difference("Book.count", -1) do
  #         delete api_v1_book_path(book), headers: { Authorization: "Bearer #{access_token.token}" }
  #       end
  #     end
  #   end
  # end

  # context 'when logged user is a member' do
  #   describe 'create and update' do
  #     it 'forbids create' do
  #       book = build(:book)

  #       post api_v1_campaigns_path, params: { book: book.attributes }, headers: { Authorization: "Bearer #{member_access_token.token}" }
  #       expect(response.code).to eq("403")
  #     end

  #     it 'forbids update' do
  #       book = create(:book)
  #       patch api_v1_book_path(book), params: { book: { title: 'teste 123' } }, headers: { Authorization: "Bearer #{member_access_token.token}" }
  #       expect(response.code).to eq("403")
  #     end

  #     it 'forbids destroy' do
  #       book = create(:book)

  #       delete api_v1_book_path(book), headers: { Authorization: "Bearer #{member_access_token.token}" }
  #       expect(response.code).to eq("403")
  #     end
  #   end
  # end
end
