class ArticlesController < ApplicationController
  # A frequent practice is to place the standard CRUD actions in each controller in the following order: index, show, new, edit, create, update and destroy. You may use any order you choose, but keep in mind that these are public methods; as mentioned earlier in this guide, they must be placed before declaring private visibility in the controller.
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  # def create
  #   # render plain: params[:article].inspect
  #   # @article = Article.new(params[:article])
  #   @article = Article.new(params.require(:article).permit(:title, :text))
  #   @article.save
  #   redirect_to @article
  # end

  def create
    @article = Article.new(article_params)

    @article.save
    redirect_to @article
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
