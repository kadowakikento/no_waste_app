# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([
  { email: "sample1@sample.com", password: "12345678", admin: true},
  { email: "sample2@sample.com", password: "12345678" },
  { email: "sample3@sample.com", password: "12345678" },
  { email: "sample4@sample.com", password: "12345678" },
  { email: "sample5@sample.com", password: "12345678" },
  ])

Food.create!([
  { name: "キャベツ", due_time: "2022/09/01 17:00", user_id: "1" },
  { name: "豚肉", due_time: "2022/08/28 13:00", user_id: "2" },
  { name: "玉ねぎ", due_time: "2022/08/25 19:00", user_id: "3" },
  { name: "ヨーグルト", due_time: "2022/09/01 10:00", user_id: "4" },
  { name: "お惣菜", due_time: "2022/08/29 19:00", user_id: "5" },
])

ShoppingList.create!([
  { title: "豚肉", content: "小間切れ", user_id: "1" },
  { title: "キャベツ", content: "高いの", user_id: "2" },
  { title: "ヨーグルト", content: "無糖", user_id: "3" },
  { title: "玉ねぎ", content: "5つ入り", user_id: "4" },
  { title: "お酒", content: "檸檬堂", user_id: "5" },
])

Comment.create!([
  { content: "must", shopping_list_id: "1" },
  { content: "need", shopping_list_id: "2" },
  { content: "want", shopping_list_id: "3" },
  { content: "must", shopping_list_id: "4" },
  { content: "want", shopping_list_id: "5" },
])
