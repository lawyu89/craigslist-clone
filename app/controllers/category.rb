get '/categories' do
  # Look in app/views/index.erb
  @category = Category.all.sort_by{|obj| obj.id}
  articles=[]
  category=''
  until articles.length >0
    item = Category.all.sample
    articles = item.articles
    category = item
  end
  @rand_category = item
  @article = articles.sample
  erb :"category/category_index"
end

# get '/category/:title' do
#   @topic = Category.where(title: params[:title]).first.articles
#   if @topic.nil?
#     status 404
#     return "Category not found!"
#   end
#   erb :"category/category_index"
# end
