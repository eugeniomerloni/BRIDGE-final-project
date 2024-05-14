Rails.application.routes.draw do

  # Routes for the Follow request resource:

  # CREATE
  post("/insert_follow_request", { :controller => "follow_requests", :action => "create" })
          
  # READ
  get("/follow_requests", { :controller => "follow_requests", :action => "index" })
  
  get("/follow_requests/:path_id", { :controller => "follow_requests", :action => "show" })
  
  # UPDATE
  
  post("/modify_follow_request/:path_id", { :controller => "follow_requests", :action => "update" })
  
  # DELETE
  get("/delete_follow_request/:path_id", { :controller => "follow_requests", :action => "destroy" })

  #------------------------------

  # Routes for the Saved place resource:

  # CREATE
  post("/insert_saved_place", { :controller => "saved_places", :action => "create" })
          
  # READ
  get("/saved_places", { :controller => "saved_places", :action => "index" })
  
  get("/saved_places/:path_id", { :controller => "saved_places", :action => "show" })
  
  # UPDATE
  
  post("/modify_saved_place/:path_id", { :controller => "saved_places", :action => "update" })
  
  # DELETE
  get("/delete_saved_place/:path_id", { :controller => "saved_places", :action => "destroy" })

  #------------------------------

  # Routes for the Tourist upvote resource:

  # CREATE
  post("/insert_tourist_upvote", { :controller => "tourist_upvotes", :action => "create" })
          
  # READ
  get("/tourist_upvotes", { :controller => "tourist_upvotes", :action => "index" })
  
  get("/tourist_upvotes/:path_id", { :controller => "tourist_upvotes", :action => "show" })
  
  # UPDATE
  
  post("/modify_tourist_upvote/:path_id", { :controller => "tourist_upvotes", :action => "update" })
  
  # DELETE
  get("/delete_tourist_upvote/:path_id", { :controller => "tourist_upvotes", :action => "destroy" })

  #------------------------------

  # Routes for the Review resource:

  # CREATE
  post("/insert_review", { :controller => "reviews", :action => "create" })
          
  # READ
  get("/reviews", { :controller => "reviews", :action => "index" })
  
  get("/reviews/:path_id", { :controller => "reviews", :action => "show" })
  
  # UPDATE
  
  post("/modify_review/:path_id", { :controller => "reviews", :action => "update" })
  
  # DELETE
  get("/delete_review/:path_id", { :controller => "reviews", :action => "destroy" })

  #------------------------------

  # Routes for the Place type resource:

  # CREATE
  post("/insert_place_type", { :controller => "place_types", :action => "create" })
          
  # READ
  get("/place_types", { :controller => "place_types", :action => "index" })
  
  get("/place_types/:path_id", { :controller => "place_types", :action => "show" })
  
  # UPDATE
  
  post("/modify_place_type/:path_id", { :controller => "place_types", :action => "update" })
  
  # DELETE
  get("/delete_place_type/:path_id", { :controller => "place_types", :action => "destroy" })

  #------------------------------

  # Routes for the Category resource:

  # CREATE
  post("/insert_category", { :controller => "categories", :action => "create" })
          
  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  
  get("/categories/:path_id", { :controller => "categories", :action => "show" })
  
  # UPDATE
  
  post("/modify_category/:path_id", { :controller => "categories", :action => "update" })
  
  # DELETE
  get("/delete_category/:path_id", { :controller => "categories", :action => "destroy" })

  #------------------------------

  # Routes for the User resource:

  # CREATE
  post("/insert_user", { :controller => "users", :action => "create" })
          
  # READ
  get("/users", { :controller => "users", :action => "index" })
  
  get("/users/:path_id", { :controller => "users", :action => "show" })
  
  # UPDATE
  
  post("/modify_user/:path_id", { :controller => "users", :action => "update" })
  
  # DELETE
  get("/delete_user/:path_id", { :controller => "users", :action => "destroy" })

  #------------------------------

  # Routes for the Place resource:

  # CREATE
  post("/insert_place", { :controller => "places", :action => "create" })
          
  # READ
  get("/places", { :controller => "places", :action => "index" })
  
  get("/places/:path_id", { :controller => "places", :action => "show" })
  
  # UPDATE
  
  post("/modify_place/:path_id", { :controller => "places", :action => "update" })
  
  # DELETE
  get("/delete_place/:path_id", { :controller => "places", :action => "destroy" })

  #------------------------------

  get("/", { :controller => "homepage", :action => "index" })

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
