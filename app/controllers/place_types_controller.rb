class PlaceTypesController < ApplicationController
  def index
    matching_place_types = PlaceType.all

    @list_of_place_types = matching_place_types.order({ :created_at => :desc })

    render({ :template => "place_types/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_place_types = PlaceType.where({ :id => the_id })

    @the_place_type = matching_place_types.at(0)

    render({ :template => "place_types/show" })
  end

  def create
    the_place_type = PlaceType.new
    the_place_type.place_id = params.fetch("query_place_id")
    the_place_type.category_id = params.fetch("query_category_id")

    if the_place_type.valid?
      the_place_type.save
      redirect_to("/place_types", { :notice => "Place type created successfully." })
    else
      redirect_to("/place_types", { :alert => the_place_type.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_place_type = PlaceType.where({ :id => the_id }).at(0)

    the_place_type.place_id = params.fetch("query_place_id")
    the_place_type.category_id = params.fetch("query_category_id")

    if the_place_type.valid?
      the_place_type.save
      redirect_to("/place_types/#{the_place_type.id}", { :notice => "Place type updated successfully."} )
    else
      redirect_to("/place_types/#{the_place_type.id}", { :alert => the_place_type.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_place_type = PlaceType.where({ :id => the_id }).at(0)

    the_place_type.destroy

    redirect_to("/place_types", { :notice => "Place type deleted successfully."} )
  end
end
