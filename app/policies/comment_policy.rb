class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # Anyone
      scope.all

      # Owner
      # scope.wehere(user: user)
    end

    def create?
      true
    end
  end
end
