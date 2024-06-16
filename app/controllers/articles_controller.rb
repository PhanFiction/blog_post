class ArticlesController < ApplicationController
  def index
    # @articles is plural, which conventionally indicates that it holds a collection of objects (in this case, multiple Article instances).
    @articles = Article.all
  end

  def show 
    # @article is singular, which conventionally indicates that it holds a single object (a single Article instance).
    @article = Article.find(params[:id])
  end

  def create
    # pass in hash that will contain the body of the submitted field
    @article = Article.new(verify_article_params)

    if @article.save
      # use redirect_to after mutating the database or application state.
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update 
    @article = Article.find(params[:id])

    if @article.update(verify_article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def verify_article_params
      params.require(:article).permit(:title, :body)
    end
end
