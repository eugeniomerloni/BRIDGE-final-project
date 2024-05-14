class TouristUpvotesController < ApplicationController
  def index
    matching_tourist_upvotes = TouristUpvote.all

    @list_of_tourist_upvotes = matching_tourist_upvotes.order({ :created_at => :desc })

    render({ :template => "tourist_upvotes/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_tourist_upvotes = TouristUpvote.where({ :id => the_id })

    @the_tourist_upvote = matching_tourist_upvotes.at(0)

    render({ :template => "tourist_upvotes/show" })
  end

  def create
    the_tourist_upvote = TouristUpvote.new
    the_tourist_upvote.place_id = params.fetch("query_place_id")
    the_tourist_upvote.tourist_id = params.fetch("query_tourist_id")

    if the_tourist_upvote.valid?
      the_tourist_upvote.save
      redirect_to("/tourist_upvotes", { :notice => "Tourist upvote created successfully." })
    else
      redirect_to("/tourist_upvotes", { :alert => the_tourist_upvote.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_tourist_upvote = TouristUpvote.where({ :id => the_id }).at(0)

    the_tourist_upvote.place_id = params.fetch("query_place_id")
    the_tourist_upvote.tourist_id = params.fetch("query_tourist_id")

    if the_tourist_upvote.valid?
      the_tourist_upvote.save
      redirect_to("/tourist_upvotes/#{the_tourist_upvote.id}", { :notice => "Tourist upvote updated successfully."} )
    else
      redirect_to("/tourist_upvotes/#{the_tourist_upvote.id}", { :alert => the_tourist_upvote.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_tourist_upvote = TouristUpvote.where({ :id => the_id }).at(0)

    the_tourist_upvote.destroy

    redirect_to("/tourist_upvotes", { :notice => "Tourist upvote deleted successfully."} )
  end
end
