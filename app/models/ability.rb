class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.sub_admin?
    elsif user.field_rep?
    end
  end
end
