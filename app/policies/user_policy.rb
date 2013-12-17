class UserPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    raise Pundit::NotAuthorizedError, "must be logged in" unless user
    @user = user
    @record = record
  end

  def index?
    user_editor?
  end

  def show?
    user_author? || user_editor?
  end

  def edit?
    user_author? || user_editor?
  end

  def update?
    user_author? || user_editor?
  end

  def destroy?
    user_author? || user_editor?
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
