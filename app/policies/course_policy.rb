class CoursePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    @record.user_id == @user.id
  end

  def create?
    @user.has_role?:teacher
  end

  def update?
    @record.user_id == @user.id
  end

  def destroy?
    @user.has_role?:admin || @record.user_id == @user.id
  end

  def approve?
    @user.has_role?:admin
  end 

  def new?
    @user.has_role?:teacher
  end

  def owner?
    @record.user_id == @user.id
  end
end
