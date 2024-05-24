class PlacesController < ApplicationController
  def index
    matching_places = Place.all

    @list_of_places = matching_places.order({ :created_at => :desc })

    @place_names = Place.pluck(:name)

    @list_of_categories = Category.all

    render({ :template => "places/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_places = Place.where({ :id => the_id })

    @the_place = matching_places.at(0)

    a = Array.new

    @the_place.reviews.each do |a_review|

      a.push(a_review.rating)

    end

    rating_sum = a.sum
    rating_count = a.size
    @rating_average = (rating_sum.to_f / rating_count).round(1)
  

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

      category_ids = params.fetch("categories", [])
      category_ids.each do |category_id|
        create_place_type(the_place.id, category_id)
      end

      redirect_to("/places/#{the_place.id}", { notice: "Place created successfully." })
    else
      redirect_to("/places/#{the_place.id}", { alert: the_place.errors.full_messages.to_sentence })
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

  def visit

    @chosen_city = params.fetch("city")
    @chosen_category = params.fetch("category")

    matching_categories = Category.where({ :name => @chosen_category})
    @the_category = matching_categories.at(0)

    @places_in_category = @the_category.places
    @places_in_category_city = @places_in_category.where({ :city => @chosen_city})

    render({ :template => "places/visit" })

  end

  private

  def create_place_type(place_id, category_id)
    PlaceType.create(place_id: place_id, category_id: category_id)
  end

end
