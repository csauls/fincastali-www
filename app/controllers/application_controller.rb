class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception


    before_action -> {
        @active_site_nav    = ''
        @body_id            = ''
        @include_nav_to_top = false
        @title              = ['Fincastali Hearth']
    }
end
