Rails.application.routes.draw do

  get("/", { :controller => "homepage", :action => "index" })

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
