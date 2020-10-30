class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in? 

    private

    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end


    protect_from_forgery with: :exception
    # get '/' do
    #     erb :index
    # end

    # helpers do

    #     def is_logged_in?
    #         !!session[:user_id]
    #     end

    #     def current_user
    #         @user = User.find(session[:user_id])
    #     end
    # end
end
