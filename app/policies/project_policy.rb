class ProjectPolicy < ApplicationPolicy
  attr_reader :user, :project
  # before_filter :load_user_editor

  def initialize(user, project)
    @user = user
    @project = project
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
      if user_editor?
        scope.all
      end
    end
  end

private

  def load_user_editor
    user_editor?
  end
end
