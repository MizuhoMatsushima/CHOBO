# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@admin.com",
  password: "aaaaaa"
)

EndUser.create!(
  [{
    last_name: "一原",
    first_name: "一恵",
    last_name_kana: "イチハラ",
    first_name_kana: "カズエ",
    email: "111@gmail.com",
    password: "111111",
    phone_number: "0311111111",
  },
  {
    last_name: "二階堂",
    first_name: "二江",
    last_name_kana: "ニカイドウ",
    first_name_kana: "フタエ",
    email: "222@gmail.com",
    password: "222222",
    phone_number: "0322222222",
  },
  {
    last_name: "三山",
    first_name: "三助",
    last_name_kana: "ミヤマ",
    first_name_kana: "サンスケ",
    email: "333@gmail.com",
    password: "333333",
    phone_number: "0333333333",
  },
  {
    last_name: "一原",
    first_name: "一恵",
    last_name_kana: "イチハラ",
    first_name_kana: "カズエ",
    email: "444@gmail.com",
    password: "444444",
    phone_number: "0344444444",
  },
  {
    last_name: "四道",
    first_name: "四平",
    last_name_kana: "シドウ",
    first_name_kana: "ヨンペイ",
    email: "555@gmail.com",
    password: "555555",
    phone_number: "0355555555",
  }
])

Consultation.create!(
  [{
    end_user_id: 1,
    title: "食費が多い気がするのですがこんなものですか？",
    body: "毎月、食費が8万円掛かっています。未就学児2人（男女）と夫婦の４人家族です。お米なんかも自分たちで購入しております。多い少ないのや節約するために行っていることがあれば教えてください！",
  },
  {
    end_user_id: 2,
    title: "戸建て住宅検討中です。",
    body: "現在借家で、子ども（未就学児）と夫婦の三人暮らしです。貯金が少したまってきたので、戸建て購入を検討しています。頭金や諸費用どのくらいで購入できたのか、実経験者の方にお伺いしたいです。",
  },
  {
    end_user_id: 3,
    title: "一人暮らしの食費に関して",
    body: "現在、一人暮らしです。最近、地方から上京してきました。食費が思いのほか掛かっていて、貯金が出来ずに悩んでいます。自炊もしていますが、学業とアルバイトがあり疲れたときはお弁当を購入する等して、月に大体5～6万円ほどの出費です。高いですよね？",
  },
  {
    end_user_id: 4,
    title: "節約の方法に関して",
    body: "将来の家購入や子どもの学費のためにお金を貯めたいのですが、なかなか貯まりません。収入が多くないというのもあるのですが、平均年収くらいはあると思います。まずは、食費が7万円近く掛かっているのでそれを4万円以下にしたいと思っています。食費の節約方法を教えてください！",
  },
  {
    end_user_id: 5,
    title: "子どもの学費に関して",
    body: "現在、子ども1人（未就学児）です。あともう一人子どもが欲しいのですが、学費はどのくらい見込めばいいのでしょうか？",
  }
])


Tag.create!(
  [{
    name: "#食費",
  },
  {
    name: "#節約",
  },
  {
    name: "#4人家族",
  },
  {
    name: "#貯金",
  },
  {
    name: "#一人暮らし",
  },
  {
    name: "#戸建て購入",
  },
  {
    name: "#学費",
  },
])

  MiddleOfTag.create!(
  [{
    consultation_id: 1,
    tag_id: 1,
  },
  {
    consultation_id: 1,
    tag_id: 2,
  },
  {
    consultation_id: 1,
    tag_id: 3,
  },
  {
    consultation_id: 2,
    tag_id: 6,
  },
  {
    consultation_id: 3,
    tag_id: 5,
  },
  {
    consultation_id: 3,
    tag_id: 1,
  },
  {
    consultation_id: 3,
    tag_id: 2,
  },
  {
    consultation_id: 4,
    tag_id: 2,
  },
  {
    consultation_id: 4,
    tag_id: 4,
  },
  {
    consultation_id: 5,
    tag_id: 7,
  },
])

