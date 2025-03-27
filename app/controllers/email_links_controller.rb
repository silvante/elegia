class EmailLinksController < ApplicationController
    before_action :authenticate

    def create
        @email_link = EmailLink.generate(params[:email])
        if @email_link
            flash[:notice] = "Access email sent! Please, check your inbox to enter"
            redirect_to root_path
        else
            flash[:alert] = "There was an error, please try again!"
            redirect_to new_user_session_path
        end
    end

    def validate
        email_link = EmailLink.find_by(token: params[:token]).where("expires_at > ?", Date.now).first

        unless email_link
            flash[:alert] = "Invalid or expired token!"
            redirect_to new_user_session_path
        end

        reset_session
        session[:user_id] = email_link.user.id
        flash[:notice] = "Welcome! You signed in successfully 🚀"
        redirect_to root_path
    end
end
