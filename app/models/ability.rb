class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.role == I18n.t('user.roles.teacher')
      can :manage, :all
    end
  end
end
