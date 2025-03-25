class HomeController < ApplicationController
    layout "home"
    allow_unauthenticated_access only: %i[ index ]
    
    def index
    end
end
