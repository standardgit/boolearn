class EnrollmentPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def index?
      @user.has_role?(:admin)
    end

  
    def edit?
      @record.course.user_id == @user.id
    end
  
  
    def update?
      @record.course.user_id == @user.id
    end
  
    def destroy?
        @record.course.user_id == @user.id
    end
  
  end
  