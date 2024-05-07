class HomepageController < ApplicationController

def index

  render({ :template => "homepage_templates/index" })
end

end
