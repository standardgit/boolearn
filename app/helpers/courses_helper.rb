module CoursesHelper
    def enrollment_button(course)
        if current_user
            if course.user == current_user
                link_to 'You created this course, view analytics', course_path(course)
            elsif course.enrollments.where(user: current_user).any?
                link_to course_path(course) do
                    'You bought this course, keep learning'
                    number_to_percentage(course.progress(current_user), precision: 0)
                end
            elsif course.price > 0
                link_to number_to_currency(course.price), new_enrollment_path(course), class: 'btn btn-success'
            else
                link_to "Free", new_enrollment_path(course), class: 'btn btn-success'
            #logic to buy
            end
        else
            link_to 'Check price', new_enrollment_path(course), class: "btn btn-md btn-success"
        end
    end

    def review_button(course)
        user_course = course.enrollments.where(user: current_user)
        if current_user
            if user_course.any?
                if user_course.pending_review.any?
                    link_to "Add a review", edit_enrollment_path(course.enrollments.where(user: current_user).first), class: 'btn btn-success'
                end
            end
        end
    end
end
