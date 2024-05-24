class HomepageController < ApplicationController

def index

  @hometowns = User.pluck(:hometown)

  @chosen_city = params[:query_city]

  render({ :template => "homepage_templates/index" })
end

end
