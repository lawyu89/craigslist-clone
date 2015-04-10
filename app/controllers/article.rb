get '/categories/:title' do
  @category = Category.isolate_title
  nil_check(@category)
  @articles = @category.articles.sort_by{|obj| obj.id}
  erb :'article/index'
end

get '/categories/:title/new' do
  @article = Article.new
  @category = Category.isolate_title
  erb :'article/new'
end

get '/categories/:title/:id' do
  @category = Category.isolate_title
  @articles = Article.isolate_id
  erb :'article/show_all'
end

post '/categories/:title' do
  @category = Category.isolate_title
  @article = Article.new(
    title: params[:new_title],
    description: params[:description],
    image_url: params[:image_url],
    price: params[:price],
    email: params[:email],
    category_id: @category.id,
    key: Article.generate_key
  )
  if @article.save
    erb :'article/show_mine'
  else
    erb :'article/new'
  end
end

get '/categories/:title/:id/edit' do
  @category = Category.isolate_title
  nil_check(@category)
  @article = Article.isolate_id
  nil_check(@article)
  @key = params[:key]
  authorize(@article,@key)
  erb :'article/edit'
end

put '/categories/:title/:id' do
  @category = Category.isolate_title
  nil_check(@category)
  @article = Article.isolate_id
  nil_check(@article)
  @article.update(
    title: params[:new_title],
    description: params[:description],
    image_url: params[:image_url],
    price: params[:price],
    email: params[:email],
    category_id: @category.id,
  )
  if @article.save
    redirect "/categories/#{@category.title}/#{@article.id}"
  else
    erb :'article/edit'
  end
end

delete '/categories/:title/:id' do
  @category = Category.isolate_title
  @article = Article.isolate_id
  nil_check(@article)
  @article.destroy
  redirect "/categories/#{@category.title}"
end

