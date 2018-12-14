class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone
      scope.all

      # Owner
      # scope.wehere(user: user)
    end

    def show
      true
    end

    def create?
      true
    end

    def destroy?
      record.user == user
    end

    def googleApi?
      true
    end

  end
end
