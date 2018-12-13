class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
  end

  def show?
    true
  end

  def create?
    @user.present?
  end

  def new?
    @user.present?
  end

  def update?
    false
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def googleApi?
    true
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope.all
    end
  end
end
