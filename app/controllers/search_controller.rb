class SearchController < ApplicationController
  def index
    category_query = params[:category_query]
		if category_query.present?
		  @quotematch = Quote.joins(:category_quotes, :categories).where("categories.name LIKE ?", "%#{category_query}%").distinct
    end
  end
end
