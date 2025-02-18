module Api
  module V1
    class CampaignsController < Api::V1::BaseController
      def index
        campaigns = Campaign.all
        render json: campaigns, status: :ok, each_serializer: CampaignSerializer
      end

      def create
        # authorize :campaign, :create?

        campaign = Campaign.new(campaign_params)

        if campaign.save
          render json: campaign, status: :created, serializer: CampaignSerializer
        else
          render_errors(campaign.errors.full_messages)
        end
      end

      def update
        # authorize :campaign, :update?

        campaign = Campaign.find(params[:id])

        if campaign.update(campaign_params)
          render json: campaign, status: :ok, serializer: CampaignSerializer
        else
          render_errors(campaign.errors.full_messages)
        end
      end

      def destroy
        # authorize :campaign, :destroy?

        campaign = Campaign.find(params[:id])

        if campaign.destroy
          head :no_content
        else
          render_errors(campaign.errors.full_messages)
        end
      end

      private

      def campaign_params
        params.require(:campaign).permit(:name, :description, :user_id)
      end
    end
  end
end
