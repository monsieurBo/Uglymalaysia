# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all

# User.create!([{
#   email: "angmoh@nomoh.com",
#   password: "abcd1234",
#   name: "GG",
#   phone_number: 1234567891,
#   country: "Nigeria",
#   state: "Nairobi",
#   city: "Sum See Tee",
# }])
 
# p "Created #{User.count} users"

Article.destroy_all
 
Article.create!([{
  title: "Ang Moh No Moh",
  description: "This stupid Ang Moh (local dialect for white caucasian) thought he could get away with an accident. Boy, was she wrong.",
  tag_list: ["White", "People", "Crazy"],
  user_id: 1
},
{
  title: "Ang Moh No Moh (part 2)",
  description: "This stupid Ang Moh (local dialect for white caucasian) thought he could get away with an accident. Boy, was she wrong.",
  tag_list: ["White", "People", "Crazy"],
  user_id: 1
},
{
  title: "Ang Moh No Moh (part 3)",
  description: "This stupid Ang Moh (local dialect for white caucasian) thought he could get away with an accident. Boy, was she wrong.",
  tag_list: ["White", "People", "Crazy"],
  user_id: 1
},
{
  title: "Ang Moh No Moh (part 4)",
  description: "This stupid Ang Moh (local dialect for white caucasian) thought he could get away with an accident. Boy, was she wrong.",
  tag_list: ["White", "People", "Crazy"],
  user_id: 1
}])
 
p "Created #{Article.count} articles"
