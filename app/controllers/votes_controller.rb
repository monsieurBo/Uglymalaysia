class VotesController < ApplicationController
	before_action :set_vote

  def vote

    if @vote.nil?
       Vote.create(article_id: params[:article_id], user_id: current_user.id)
       redirect_to article_path(@vote.article_id)

    end
  end

  def upvote
    if @vote.nil?
    	@vote = Vote.create(article_id: params[:article_id], user_id: current_user.id, vote: true)
      redirect_to article_path(@vote.article_id)
    else
      @article = @vote.article

			if @vote.vote == false
        @vote.update(vote: true)
				redirect_to article_path(@article.id)
      end
    end
  end

  def downvote
    if @vote.nil?
       @vote = Vote.create(article_id: params[:article_id], user_id: current_user.id, vote: false)
       redirect_to article_path(@vote.article_id)
    else
      @article = @vote.article

      if @vote.vote == true
        @vote.update(vote: false)
				redirect_to article_path(@article.id)
      end
    end
  end


  private

  def set_vote
  	@vote = Vote.find_by(article_id: params[:article_id], user_id: current_user.id)
  end

end
