class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone
      scope.all

      # Owner
      # scope.wehere(user: user)
    end

    def new?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      record.user == user
    end

    def destroy?
      record.user == user
    end
  end
end
