class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end

    def new?
      user != nil
    end

    def create?
      new?
    end

  end
end
