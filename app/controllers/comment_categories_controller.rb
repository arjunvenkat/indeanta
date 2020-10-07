class CommentCategoriesController < ApplicationController
  def index
    matching_comment_categories = CommentCategory.all

    @list_of_comment_categories = matching_comment_categories.order({ :created_at => :desc })

    render({ :template => "comment_categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comment_categories = CommentCategory.where({ :id => the_id })

    @the_comment_category = matching_comment_categories.at(0)

    render({ :template => "comment_categories/show.html.erb" })
  end

  def create
    the_comment_category = CommentCategory.new
    the_comment_category.name = params.fetch("query_name")
    the_comment_category.position = params.fetch("query_position")

    if the_comment_category.valid?
      the_comment_category.save
      redirect_to("/comment_categories", { :notice => "Comment category created successfully." })
    else
      redirect_to("/comment_categories", { :notice => "Comment category failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_comment_category = CommentCategory.where({ :id => the_id }).at(0)

    the_comment_category.name = params.fetch("query_name")
    the_comment_category.position = params.fetch("query_position")

    if the_comment_category.valid?
      the_comment_category.save
      redirect_to("/comment_categories/#{the_comment_category.id}", { :notice => "Comment category updated successfully."} )
    else
      redirect_to("/comment_categories/#{the_comment_category.id}", { :alert => "Comment category failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment_category = CommentCategory.where({ :id => the_id }).at(0)

    the_comment_category.destroy

    redirect_to("/comment_categories", { :notice => "Comment category deleted successfully."} )
  end
end
