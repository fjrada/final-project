class NavigationController < ApplicationController
    def home
        @user = current_user
        render("navigation_templates/home.html.erb")
    end
end
