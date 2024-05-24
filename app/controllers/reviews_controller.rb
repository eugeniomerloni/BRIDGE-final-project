class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    @places_in_hometown = Place.where({ :city => current_user.hometown})

    @place_names = Place.pluck(:name)

    render({ :template => "reviews/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    render({ :template => "reviews/show" })
  end

  def create
    the_review = Review.new

    if params.fetch("query_place_id") != nil
      the_review.place_id = params.fetch("query_place_id")

    else

      place_name = params.fetch("query_place_name")
      matching_places = Place.where({ :name => place_name})
      the_place = matching_places.at(0)

      the_review.place_id = the_place.id

    end

    the_review.reviewer_id = params.fetch("query_reviewer_id")
    the_review.rating = params.fetch("query_rating")
    the_review.body = params.fetch("query_body")

    if the_review.valid?
      the_review.save
      redirect_to("/places/#{the_review.place_id}", { :notice => "Review created successfully." })
    else
      redirect_to("/places/#{the_review.place_id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end


  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.place_id = params.fetch("query_place_id")
    the_review.reviewer_id = params.fetch("query_reviewer_id")
    the_review.rating = params.fetch("query_rating")
    the_review.body = params.fetch("query_body")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully."} )
  end
end
