class CommentsController < ApplicationController
  # getting all the comments beloging to the article
  def show
  end

  # Create a new comment in the db -> HTTP CREATE
  def create
    @article = Article.find(params[:article_id])
    # .create will create and save where as using .new() will have us call .save manually
    # @comment = @article.comments.create(comment_params)
    # redirect_to article_path(@article)

    @comment = Comment.new(comment_params)
    @comment.article = @article

    puts "new comment #{params[:article_id]}"
    
    if @comment.save
      redirect_to article_path(@article)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Fetch comments from db to be display -> HTTP GET
  def edit
  end

  # Update comment in db -> HTTP PUT
  def update
  end

  # Delete the comment in the db -> HTTP DELETE
  def destroy
    @article = Article.find(params[:article_id]) # search for article by id
    @comment = @article.comments.find(params[:id]) # search article comments for the comment we want to delete by id
    puts "article is #{params[:article]} and #{params[:article_id]}"
    # @comment.destroy # delete comment

    # redirect_to article_path, status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
