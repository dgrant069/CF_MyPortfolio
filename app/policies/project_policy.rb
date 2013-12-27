class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project
  # before_filter :load_user_editor

  def initialize(user, project)
    @user = user
    @project = project
  end

  def index?
    user_editor?
  end

  def show?
    user_editor?
  end

  def new?
    user_editor?
  end

  def create?
    user_editor?
  end

  def update?
    user_editor?
  end

  def destroy?
    user_editor?
  end

  def publish?
    user_editor?
  end

  class Scope < Struct.new(:user, :scope)
    def resolve
      if user.present? && user.editor?
        scope.all
      else
        scope.where(published: true)
      end
    end
  end

private

  def load_user_editor
    user_editor?
  end
end
