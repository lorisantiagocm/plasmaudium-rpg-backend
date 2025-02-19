require 'rails_helper'

RSpec.describe Api::V1::Campaigns::ScenesController, type: :request do
  let(:user) { create(:user) }
  let(:second_user) { create(:user) }
  let(:campaign) { create(:campaign, user: user) }

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
    get api_v1_campaign_scenes_path(campaign), headers: { Authorization: "Bearer #{access_token.token}" }
    expect(response).to have_http_status(:ok)
  end

  it 'renders forbidden when is not the owner' do
    get api_v1_campaign_scenes_path(campaign), headers: { Authorization: "Bearer #{second_access_token.token}" }
    expect(response).to have_http_status(:forbidden)
  end
end
