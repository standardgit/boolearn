# User.create!(email: 'admin1@gmail.com', password: 'admin1', password_confirmation: 'admin1')

# user = User.new(
#     email: "admin1@gmail.com",
#     password: "admin1",
#     password_confirmation: "admin1"
# )
# user.skip_confirmation!
# user.save!

PublicActivity.enabled = false

30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::TvShows::GameOfThrones.quote,
        user_id: User.first.id,
        short_description: Faker::Quote.famous_last_words,
        language: Faker::ProgrammingLanguage.name,
        level: "Beginner",
        price: Faker::Number.between(from: 1000, to: 20000)
    }])
end

PublicActivity.enabled = true