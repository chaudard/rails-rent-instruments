class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
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
    true
  end

  def changerating?
    true
  end
end
