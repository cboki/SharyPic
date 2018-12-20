class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
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
      record.creator == user
    end

    def destroy?
      record.creator == user
    end

    def nearby?
      true
    end

    def search?
      true
    end
  end
end
