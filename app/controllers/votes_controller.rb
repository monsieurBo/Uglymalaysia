class VotesController < ApplicationController
	before_action :set_vote

  def vote

    if @vote.nil?
       Vote.create(article_id: params[:article_id], user_id: current_user.id)
       redirect_to article_path(@vote.article_id)
    # else
    #   @article = @vote.article
    #   if @vote.vote?
    #     self.upvote
    #   elsif @vote.vote.n?
    #     self.downvote
    #   end

      # if @vote.vote.nil?
      #   @vote.update(vote: true)
      # elsif @vote.vote?
      #   @vote.update(vote: false)
      # else
      #   @vote.update(vote: true)
      # end 
    end  
  end

  def upvote
        if @vote.nil?
       Vote.create(article_id: params[:article_id], user_id: current_user.id)
       redirect_to article_path(@vote.article_id)
    else
      @article = @vote.article
    

      if @vote.vote.nil?
        @vote.update(vote: true)
      else
        @vote.update(vote: nil)
      end 
    end  
    
    redirect_to article_path(@article.id)
  end

  def downvote
    if @vote.nil?
       Vote.create(article_id: params[:article_id], user_id: current_user.id)
       redirect_to article_path(@vote.article_id)
    else
      @article = @vote.article
    

      if @vote.vote.nil?
        @vote.update(vote: false)
      else
        @vote.update(vote: nil)
      end 
    end  
    
    redirect_to article_path(@article.id)
  end


  private 

  def set_vote
  	@vote = Vote.find_by(article_id: params[:article_id], user_id: current_user.id)
  end

end