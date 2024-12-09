module Admin
  class ArticlesController < ApplicationController
    before_action :authenticate_admin  # Optional: Add authentication if needed

    def index
      @articles = Article.all
    end

    def show
      @article = Article.find(params[:id])
    end

    def new
      @article = Article.new
    end

    def create
      @article = Article.new(article_params)
      if @article.save
        redirect_to admin_article_path(@article), notice: "Article was successfully created."
      else
        render :new
      end
    end

    private

    def article_params
      params.require(:article).permit(:title, :description, :cover_url)
    end

    def authenticate_admin
      # Add authentication logic to ensure only admin can access this controller
    end
  end
end
