class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end

    def create?
      true
    end

    def edit?
      update?
    end

    def update?
      record.user == user
    # - record: the user passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
    end

  end
end
