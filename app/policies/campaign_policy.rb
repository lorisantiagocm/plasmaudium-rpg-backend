class CampaignPolicy < ApplicationPolicy
  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      scope.where(user: user)
    end

    private

    attr_reader :user, :scope
  end

  def update?
    user_owns_campaign
  end

  def destroy?
    user_owns_campaign
  end

  private

  def user_owns_campaign
    user == record.user
  end
end
