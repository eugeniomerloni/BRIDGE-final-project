class SavedPlacesController < ApplicationController
  def index
    matching_saved_places = SavedPlace.all

    @list_of_saved_places = matching_saved_places.order({ :created_at => :desc })

    render({ :template => "saved_places/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_saved_places = SavedPlace.where({ :id => the_id })

    @the_saved_place = matching_saved_places.at(0)

    render({ :template => "saved_places/show" })
  end

  def create
    the_saved_place = SavedPlace.new
    the_saved_place.place_id = params.fetch("query_place_id")
    the_saved_place.user_id = params.fetch("query_user_id")

    if the_saved_place.valid?
      the_saved_place.save
      redirect_to("/saved_places", { :notice => "Saved place created successfully." })
    else
      redirect_to("/saved_places", { :alert => the_saved_place.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_saved_place = SavedPlace.where({ :id => the_id }).at(0)

    the_saved_place.place_id = params.fetch("query_place_id")
    the_saved_place.user_id = params.fetch("query_user_id")

    if the_saved_place.valid?
      the_saved_place.save
      redirect_to("/saved_places/#{the_saved_place.id}", { :notice => "Saved place updated successfully."} )
    else
      redirect_to("/saved_places/#{the_saved_place.id}", { :alert => the_saved_place.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_saved_place = SavedPlace.where({ :id => the_id }).at(0)

    the_saved_place.destroy

    redirect_to("/saved_places", { :notice => "Saved place deleted successfully."} )
  end
end
