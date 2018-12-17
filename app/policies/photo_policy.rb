class PhotoPolicy < ApplicationPolicy
  def like?
    true
  end

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

    def like?
      true
    end
  end
end
