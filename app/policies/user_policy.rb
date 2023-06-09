class UserPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def destroy?
    true
  end

  def act_on?
    true
  end

  def attach_post?
    true
  end

  def detach_post?
    true
  end

  def attach_posts?
    true
  end

  def detach_posts?
    true
  end

  def attach_projects?
    true
  end

  def detach_projects?
    true
  end

  def attach_teams?
    true
  end

  def detach_teams?
    true
  end

  def create_fish?
    false
  end

  def destroy_post?
    false
  end

  [:upload, :download, :delete].each do |action|
    define_method "#{action}_cv?" do
      true
    end
  end

  def view_team_memberships?
    false
  end

  def get_users?
    true
  end

  [:upload, :download, :delete].each do |action|
    define_method "#{action}_cv?" do
      true
    end
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
