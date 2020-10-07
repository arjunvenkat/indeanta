class ReactionsController < ApplicationController
  def index
    matching_reactions = Reaction.all

    @list_of_reactions = matching_reactions.order({ :created_at => :desc })

    render({ :template => "reactions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reactions = Reaction.where({ :id => the_id })

    @the_reaction = matching_reactions.at(0)

    render({ :template => "reactions/show.html.erb" })
  end

  def create
    the_reaction = Reaction.new
    the_reaction.reaction_category_id = params.fetch("query_reaction_category_id")
    the_reaction.reactor_id = params.fetch("query_reactor_id")

    if the_reaction.valid?
      the_reaction.save
      redirect_to("/reactions", { :notice => "Reaction created successfully." })
    else
      redirect_to("/reactions", { :notice => "Reaction failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_reaction = Reaction.where({ :id => the_id }).at(0)

    the_reaction.reaction_category_id = params.fetch("query_reaction_category_id")
    the_reaction.reactor_id = params.fetch("query_reactor_id")

    if the_reaction.valid?
      the_reaction.save
      redirect_to("/reactions/#{the_reaction.id}", { :notice => "Reaction updated successfully."} )
    else
      redirect_to("/reactions/#{the_reaction.id}", { :alert => "Reaction failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_reaction = Reaction.where({ :id => the_id }).at(0)

    the_reaction.destroy

    redirect_to("/reactions", { :notice => "Reaction deleted successfully."} )
  end
end
