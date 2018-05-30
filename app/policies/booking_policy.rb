class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def new?
      user != nil
    end

    def create?
      !user.nil?
    end

    def show?
      true
    end

    def dashboard?
      # new?
      true
    end

  end
end
