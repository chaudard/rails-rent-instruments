class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def new?
      user != nil
    end

    def create?
      new?
    end

    def dashboard?
      # new?
      true
    end

  end
end
