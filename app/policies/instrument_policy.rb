class InstrumentPolicy < ApplicationPolicy
   class Scope < Scope
     def resolve
       scope.all
     end
   end

   # def index?
   #  true
   # end

   def new?
     true
   end

   def create?
     new?
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
