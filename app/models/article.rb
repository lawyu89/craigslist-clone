class Article < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :category
  validates :title, presence: true
  validates :email, presence: true
  validates :description, presence: true

  def self.generate_key
    letters = ('a'..'z').to_a
    key=''
    7.times do
      key << letters.sample
    end
    key
  end

  def self.isolate_id
    self.where(id: params[:id]).first
  end

  def nil_check(item)
    if item.nil?
      status 404
      return "Article Not Found"
    end
  end

  def authorize(page,key)
    if page.key != key
      status 401
      return "Unauthorized"
    end
  end

end
