class SearchController < ApplicationController
  def index
    category_query = params[:category_query]
		if category_query.present?
      # Copilot assisted code - How do I limit search results to only show public quotes?
		  @quotematch = Quote.joins(:category_quotes, :categories).where("categories.name LIKE ? AND quotes.is_visible = ?", "%#{category_query}%", true).distinct
    end
  end
end
