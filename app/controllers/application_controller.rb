class ApplicationController < ActionController::Base
    # configure do
    #     set :public_folder, 'public'
    #     set :views, 'app/views'
    #     enable :sessions
    #     set :session_secret, "password_secret"
    #     register Sinatra::Flash
        
    # end

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
