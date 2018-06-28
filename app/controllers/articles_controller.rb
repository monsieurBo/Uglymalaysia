class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  impressionist :actions=>[:show,:index]

  def search
    if params[:search] == ""
      render :new
    else
      @article = Article.tagged_with(params[:search])
      puts @article
    end
  end

  def trending
    @all = Article.where("articles.created_at > ?", 7.day.ago)
    @articles = []
    @output =  []
    @all.each do |article|
      if article.impressionist_count > 5
        p @articles << article
      end
    end
    @articles.each do |article|
      if article.votes.count >= 2
        @output << article
      end
    end
  end

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.left_joins(:votes).group(:id).order('COUNT(vote) DESC')
    @client_ip = remote_ip()
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])
    # impressionist(@article)
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title , :description, {images: []}, {videos: []}, :user_id, :tag_list)
    end
end
