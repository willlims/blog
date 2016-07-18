class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  def index
    if params[:ids]
      @articles = Article.find(params[:ids]).limit(10)
    else
      @articles = Article.all.limit(10)
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def search
    @articles = Article.where(['title like ?', "%#{params[:articles][:title]}%"])
    # if @articles.blank?
    #   redirect_to root_path
    # else
    #   redirect_to @articles
    # end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
