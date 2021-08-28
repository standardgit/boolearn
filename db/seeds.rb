User.create!(email: 'rubygems@gmail.com', password: 'admin1', password_confirmation: 'admin1')

30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::TvShows::GameOfThrones.quote,
        user_id: User.first.id
    }])
end
