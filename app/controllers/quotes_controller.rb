class QuotesController < ApplicationController
  before_action :set_quote, only: %i[ show edit update destroy ]
  before_action :require_login, except: [:index, :show]

  # GET /quotes or /quotes.json
  def index
    #@quotes = Quote.all
    if logged_in?
      @quotes = current_user.quotes
    end
  end

  # GET /quotes/1 or /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
    @quote.build_author   # Copilot code - How do I create fields for a the author model in a quote form?
    @quote.build_biography
    8.times { @quote.category_quotes.build }
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes or /quotes.json
  def create
    author_params = quote_params.delete(:author_attributes)  # Copilot code - How do I check for an existing author before creating one?

    # Copilot code - How do I set the Author's first name to anonymous if the text field is left blank?
    fname = author_params[:fname].to_s.strip.presence || "Anonymous"
    lname = author_params[:lname].to_s.strip.presence
  
    # Copilot code - How do I check for an existing author before creating one?
    author = Author.find_or_create_by(fname: fname, lname: lname, birth_year: author_params[:birth_year], death_year: author_params[:death_year]) 
    author.birth_year = author.birth_year.to_i if author.birth_year.present?
    author.death_year = author.death_year.to_i if author.death_year.present?
    author.save if author.new_record? || author.changed?

    @quote = Quote.new(quote_params)
    @quote.author = author  # Copilot code - How do I check for an existing author before creating one?
    @quote.biography.author = author if @quote.biography.present?

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: "Quote was successfully created." }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1 or /quotes/1.json
  def update
    # Prevents unauthorised user editing 
    if logged_in? && (@quote.user_id == current_user.id || is_administrator?)
      author_params = quote_params.delete(:author_attributes)  # Copilot code - How do I check for an existing author before creating one?

      # Copilot code - How do I set the Author's first name to anonymous if the text field is left blank?
      fname = author_params[:fname]
      fname = "Anonymous" if fname.blank?

      author = Author.find_or_create_by(fname: author_params[:fname], lname: author_params[:lname], birth_year: author_params[:birth_year], death_year: author_params[:death_year]) # Copilot code - How do I check for an existing author before creating one?
      @quote.assign_attributes(quote_params)
      @quote.author = author  # Copilot code - How do I check for an existing author before creating one?
      @quote.biography.author = author if @quote.biography.present?

      respond_to do |format|
        if @quote.update(quote_params)
          format.html { redirect_to @quote, notice: "Quote was successfully updated.", status: :see_other }
          format.json { render :show, status: :ok, location: @quote }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @quote.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "You are not authorised to delete this resource"
      redirect_to login_path
    end
  end

  # DELETE /quotes/1 or /quotes/1.json
  def destroy
    # Prevents unauthorised user deleting 
    if logged_in? && (@quote.user_id == current_user.id || is_administrator?)
      @quote.destroy!
    else
      flash[:error] = "You are not authorised to delete this resource"
      redirect_to login_path
    end

    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quote_params
      permitted = [
      :quote, :pub_year, :comment, :is_visible, :user_id,
      author_attributes: [:fname, :lname, :birth_year, :death_year],   # Copilot code - How do I create fields for a the author model in a quote form?
      biography_attributes: [:biography]
      ]
      
      # Copilot code - How to fix an error relating to quote id and category quotes when editing a quote
      if action_name == "update" || action_name == "edit"
        permitted << {category_quotes_attributes: [:category_id, :id, :_destroy]}
      else
        permitted << {category_quotes_attributes: [:category_id]}
      end

      params.require(:quote).permit(permitted)
  end
end
