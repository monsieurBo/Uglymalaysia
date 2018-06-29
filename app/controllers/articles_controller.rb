class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :search]
  impressionist :actions=>[:show,:index]

  def search
    if params[:search] == ""
      render :new
    else
      @article = Article.tagged_with(params[:search], :any => true,:wild => true)
      puts @article
    end
  end

  def tag_search
    if params[:tag] == ""
      render :new
    else
      @article = Article.tagged_with(params[:tag], :any => true,:wild => true)
      puts @article
    end
  end

  def trending
    @all = Article.where("articles.created_at > ?", 7.day.ago)
    @articles = []
    @output =  []
    @all.each do |article|
      # change the minimum for views below
      if article.impressionist_count > 5
        p @articles << article
      end
    end
    @articles.each do |article|
      # Change the limit for vote count below
      if article.votes.count >= 2
        @output << article
      end
    end
  end

  def most_views
    @articles = Article.all
    @output = []
    @articles.each do |article|
      if article.impressionist_count > 1
        @output << article
      end
    end
  end

  # GET /articles
  # GET /articles.json
  def index
    if params[:tag]
      @articles = Article.tagged_with(params[:tag])
    else
      @articles = Article.left_joins(:votes).group(:id).order('COUNT(vote) DESC')
    end
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
    @article.tag_list.add(params[:article][:tag_list], parse: true)

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
      params.require(:article).permit(:title , :description, {images: []}, {videos: []}, :user_id, tag_list: [])
    end
end
