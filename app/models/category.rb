class Category < ActiveRecord::Base
  # Remember to create a migration!
  has_many :articles

  def self.isolate_title
    self.where(title: params[:title]).first
  end

  def nil_check(item)
    if item.nil?
      status 404
      return "Category Not Found"
    end
  end

end

