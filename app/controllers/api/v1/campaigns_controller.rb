module Api
  module V1
    class CampaignsController < Api::V1::BaseController
      def index
        campaigns = policy_scope(Campaign)
        render json: campaigns, status: :ok, each_serializer: CampaignSerializer
      end

      def create
        campaign = current_user.campaigns.new(campaign_params)

        if campaign.save
          render json: campaign, status: :created, serializer: CampaignSerializer
        else
          render_errors(campaign.errors.full_messages)
        end
      end

      def update
        campaign = policy_scope(Campaign).find(params[:id])

        if campaign.update(campaign_params)
          render json: campaign, status: :ok, serializer: CampaignSerializer
        else
          render_errors(campaign.errors.full_messages)
        end
      end

      def destroy
        campaign = policy_scope(Campaign).find(params[:id])

        if campaign.destroy
          head :no_content
        else
          render_errors(campaign.errors.full_messages)
        end
      end

      private

      def campaign_params
        params.require(:campaign).permit(:name, :description)
      end
    end
  end
end
