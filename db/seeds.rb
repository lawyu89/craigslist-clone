topics = ["housing", "services", "missed connections", "finances", "job opportunites"]

topics.each do |item|
  Category.create(title: item.capitalize)
end



Article.create(price: '10', description: 'im testing test1', title: 'test1', email: 'fake1@gmail.com', category_id: 1)
Article.create(price: '25', description: 'im testing test2', title: 'test2', email: 'fake2@gmail.com', category_id: 1)

