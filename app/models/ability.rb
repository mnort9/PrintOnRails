class Ability
  include CanCan::Ability

  def initialize(user)

        return if user.nil? #non logged in user can use this.

        if user.admin?
            can :manage, :all
        end

        if user.sales?
            can :create, [Order, Customer]
            can :read, :all
            can :update, [Order, Customer]
            cannot :destroy, :all
        end

        if user.broker?
            can [:index, :create, :read, :update, :new, :edit], [Order, Customer], :admin_user_id => user.id
            can :read, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser]
            cannot :index, [OrderCategory, OrderType, OrderStatus, OrderPriority, PrintLocation, AdminUser]
            cannot :destroy, :all
        end

        if user.production?
            can :create, [Order, Customer]
            can :read, :all
            can :update, [Order, Customer]
            cannot :destroy, :all
        end

        if user.art?
            cannot :create, :all
            can :read, :all
            can :update, Order
            cannot :destroy, :all
        end

        if user.shipping?
            cannot :create, :all
            can :read, :all
            can :update, Order
            cannot :destroy, :all
        end
    end
end
