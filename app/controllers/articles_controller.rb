class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
  @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end



def create
  @article = Article.new(article_params)

  if @article.save
    redirect_to @article
  else
    render 'new'
  end
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

  respond_to do |format|
    format.html { redirect_to item_url }
    format.json { head :no_content }
    format.js   { render :layout => false }
 end
end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end

end
