class UserPolicy < ApplicationPolicy
  attr_reader :user, :id

  def initialize(user, id)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @id = id
  end

  def index?
    user_editor?
  end

  def show?
    if user.present?
      user.author? || user.editor?
    end
  end

  def edit?
    if user.present?
      user.author? || user.editor?
    end
  end

  def update?
    if user.present?
      user.author? || user.editor?
    end
  end

  def destroy?
    if user.present?
      user.author? || user.editor?
    end
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      else user.present? && user.author?
        scope.where(id: user.id)
      end
    end
  end
end
