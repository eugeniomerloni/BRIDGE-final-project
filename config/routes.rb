Rails.application.routes.draw do

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
