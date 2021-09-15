class LessonPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def index?
      @user.has_role?(:admin)
    end

    def show?
      @user.has_role?(:admin) || @record.course.user_id == @user.id || record.course.bought(@user) == false
    end
  
    def edit?
      @record.course.user_id == @user.id
    end
  
    def create?
      @record.course.user_id == @user.id
    end
  
    def update?
      @record.course.user_id == @user.id
    end
  
    def destroy?
        @record.course.user_id == @user.id
    end
  
    def new?
    #   @user.has_role?:teacher
    end
  end
  