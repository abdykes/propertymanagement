class Ability
  include CanCan::Ability

  def initialize(thisuser)


    thisuser ||= User.new

    if thisuser.has_role? :manager
      can :manage, :all
    elsif thisuser.has_role? :renter
      can :index, :all
      can :manage, thisuser
      can :create, RepairRequest
      can :manage, RepairRequest
      can :index, Lease
      can :index, Unit
      can :index, Property
    else
      can :create, :all
      can :index, :all
    end
  end


end