User.create!(email: 'naomi1@gmail.com', password: 'naomi2', password_confirmation: 'naomi2')

30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::TvShows::GameOfThrones.quote,
        user_id: User.first.id
    }])
end
