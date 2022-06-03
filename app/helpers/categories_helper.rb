module CategoriesHelper
  def category_img(category)
    category_sample = '/assets/sample.png'
    category.icon.present? ? category.icon : category_sample
  end
end
