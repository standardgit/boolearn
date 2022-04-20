# User.create!(email: 'admin1@gmail.com', password: 'admin1', password_confirmation: 'admin1')

# user = User.new(
#     email: "teacher1@gmail.com",
#     password: "admin1",
#     password_confirmation: "admin1"
# )
# user.skip_confirmation!
# user.save!

# PublicActivity.enabled = false

# 10.times do
#     Course.create!([{
#         title: Faker::Educator.course_name,
#         description: Faker::TvShows::GameOfThrones.quote,
#         user_id: User.last.id,
#         short_description: Faker::Quote.famous_last_words,
#         language: Faker::ProgrammingLanguage.name,
#         level: "Beginner",
#         price: Faker::Number.between(from: 0, to: 2000),
#         published: true,
#         approved: true
#     }])
# end

# PublicActivity.enabled = true