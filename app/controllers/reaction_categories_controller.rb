class ReactionCategoriesController < ApplicationController
  def index
    matching_reaction_categories = ReactionCategory.all

    @list_of_reaction_categories = matching_reaction_categories.order({ :created_at => :desc })

    render({ :template => "reaction_categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reaction_categories = ReactionCategory.where({ :id => the_id })

    @the_reaction_category = matching_reaction_categories.at(0)

    render({ :template => "reaction_categories/show.html.erb" })
  end

  def create
    the_reaction_category = ReactionCategory.new
    the_reaction_category.display_html = params.fetch("query_display_html")
    the_reaction_category.position = params.fetch("query_position")
    the_reaction_category.reactions_count = params.fetch("query_reactions_count")

    if the_reaction_category.valid?
      the_reaction_category.save
      redirect_to("/reaction_categories", { :notice => "Reaction category created successfully." })
    else
      redirect_to("/reaction_categories", { :notice => "Reaction category failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reaction_category = ReactionCategory.where({ :id => the_id }).at(0)

    the_reaction_category.display_html = params.fetch("query_display_html")
    the_reaction_category.position = params.fetch("query_position")
    the_reaction_category.reactions_count = params.fetch("query_reactions_count")

    if the_reaction_category.valid?
      the_reaction_category.save
      redirect_to("/reaction_categories/#{the_reaction_category.id}", { :notice => "Reaction category updated successfully."} )
    else
      redirect_to("/reaction_categories/#{the_reaction_category.id}", { :alert => "Reaction category failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reaction_category = ReactionCategory.where({ :id => the_id }).at(0)

    the_reaction_category.destroy

    redirect_to("/reaction_categories", { :notice => "Reaction category deleted successfully."} )
  end
end
