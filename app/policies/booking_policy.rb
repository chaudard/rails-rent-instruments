class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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

  end
end
