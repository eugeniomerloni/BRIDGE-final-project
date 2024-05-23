class PlacesController < ApplicationController
  def index
    matching_places = Place.all

    @list_of_places = matching_places.order({ :created_at => :desc })

    render({ :template => "places/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_places = Place.where({ :id => the_id })

    @the_place = matching_places.at(0)

    render({ :template => "places/show" })
  end

  def create
    the_place = Place.new
    the_place.name = params.fetch("query_name")
    the_place.description = params.fetch("query_description")
    the_place.image = params.fetch("query_image")
    the_place.street_address = params.fetch("query_street_address")
    the_place.city = params.fetch("query_city")
    the_place.zip_code = params.fetch("query_zip_code")

    if the_place.valid?
      the_place.save
      redirect_to("/places/#{the_place.id}", { :notice => "Place created successfully." })
    else
      redirect_to("/places/#{the_place.id}", { :alert => the_place.errors.full_messages.to_sentence })
    end
  end

  def update
    place_id = params.fetch("path_id")

    matching_places = Place.where({ :id => place_id })

    @the_place = matching_places.at(0)

    render({ :template => "places/update" })
  end

  def modify
    the_id = params.fetch("path_id")
    the_place = Place.where({ :id => the_id }).at(0)

    the_place.name = params.fetch("query_name")
    the_place.description = params.fetch("query_description")
    the_place.image = params.fetch("query_image")
    the_place.street_address = params.fetch("query_street_address")
    the_place.city = params.fetch("query_city")
    the_place.zip_code = params.fetch("query_zip_code")

    if the_place.valid?
      the_place.save
      redirect_to("/places/#{the_place.id}", { :notice => "Place updated successfully."} )
    else
      redirect_to("/places/#{the_place.id}", { :alert => the_place.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_place = Place.where({ :id => the_id }).at(0)

    the_place.destroy

    redirect_to("/places", { :notice => "Place deleted successfully."} )
  end
end
