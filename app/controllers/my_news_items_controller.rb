# frozen_string_literal: true

require 'news-api'

class MyNewsItemsController < SessionController
  before_action :set_representative
  before_action :set_representatives_list
  before_action :set_issues_list
  before_action :set_issue
  before_action :set_news_item, only: %i[edit update destroy]
  def new
    @news_item = NewsItem.new
  end

  def edit; end

  def create
    @representatve = Representative.find(params[:representative_id])
    @news_item = @representative.news_items.build(news_item_params)

    if @news_item.save
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully created.'
    else
      render :new, error: 'An error occurred when creating the news item.'
    end
  end

  def update
    if @news_item.update(news_item_params)
      redirect_to representative_news_item_path(@representative, @news_item),
                  notice: 'News item was successfully updated.'
    else
      render :edit, error: 'An error occurred when updating the news item.'
    end
  end

  def destroy
    @news_item.destroy
    redirect_to representative_news_items_path(@representative),
                notice: 'News was successfully destroyed.'
  end

  def fetch_articles
    # Rails.logger.debug { "About to make News API call for issue: #{params[:issue]}" }
    newsapi = News.new(Rails.application.credentials[:GOOGLE_NEWS_API_KEY])
    result = newsapi.get_everything(
      q:        "#{params[:issue]} AND #{@representative.name}",
      language: 'en',
      sortBy:   'popularity',
      pageSize: 5
    )
    # Rails.logger.debug { "News API response: #{result.inspect}" }
    if result.any?
      @articles = result
      # Rails.logger.debug { "Articles variable set. Articles: #{@articles}" }
      render 'my_news_items/fetch_articles'
    else
      # Rails.logger.debug { "No articles found for issue: #{params[:issue]}" }
      redirect_to new_representative_my_news_item_path(@representative), alert: 'No articles found for this issue.'
    end
  end

  private

  def set_representative
    @representative = Representative.find(
      params[:representative_id]
    )
  end

  def set_representatives_list
    @representatives_list = Representative.all.map { |r| [r.name, r.id] }
  end

  def set_issues_list
    @issues_list = [
      'Free Speech', 'Immigration', 'Terrorism',
      'Social Security and Medicare', 'Abortion', 'Student Loans',
      'Gun Control', 'Unemployment', 'Climate Change', 'Homelessness',
      'Racism', 'Tax Reform', 'Net Neutrality', 'Religious Freedom',
      'Border Security', 'Minimum Wage', 'Equal Pay'
    ]
  end

  def set_issue
    @issue = params[:issue]
  end

  def set_news_item
    @news_item = NewsItem.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def news_item_params
    params.require(:news_item).permit(:title, :description, :link, :issue, :representative_id, :rating)
  end
end
