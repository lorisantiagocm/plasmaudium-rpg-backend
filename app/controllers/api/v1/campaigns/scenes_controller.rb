module Api
  module V1
    class Campaigns::ScenesController < Api::V1::BaseController
      before_action :set_campaign

      def index
        scenes = @campaign.scenes
        render json: scenes, status: :ok, each_serializer: SceneSerializer
      end

      def create
        scene = @campaign.scenes.new(scene_params)

        if scene.save
          render json: scene, status: :created, serializer: SceneSerializer
        else
          render_errors(scene.errors.full_messages)
        end
      end

      def update
        scene = @campaign.scenes.find(params[:id])

        if scene.update(scene_params)
          render json: scene, status: :ok, serializer: SceneSerializer
        else
          render_errors(scene.errors.full_messages)
        end
      end

      def destroy
        scene = Scene.find(params[:id])

        if scene.destroy
          head :no_content
        else
          render_errors(scene.errors.full_messages)
        end
      end

      private

      def scene_params
        params.require(:scene).permit(:name, :icon)
      end

      def set_campaign
        @campaign = Campaign.find(params[:campaign_id])
        authorize @campaign, :update?

        @campaign
      end
    end
  end
end
