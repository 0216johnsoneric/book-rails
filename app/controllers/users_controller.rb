class UsersController < ApplicationController
    
    def index
        @user = User.find_by_id(params[:id]) 
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end
    
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        
        if @user.save
            session[:user_id] = @user.id 
            redirect_to @user
        else
            @error = @user.errors.full_messages.to_sentence
            render :signup
        end
    end

    # def show
    #     redirect_if_not_logged_in
    #     @user = User.find_by_id(params[:id])
    #     redirect_to '/' if !@user
    # end

    def destroy
        session.delete :user_id
        redirect_to root_path
    end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end

end
