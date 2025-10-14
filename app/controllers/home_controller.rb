class HomeController < ApplicationController
  def index
    @quotes = Quote.where(is_visible: true).take(10)
  end
  def uquotes
    @quotes = Quote.where(user_id: session[:user_id])
  end
end
