class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end
    
    def logged_in?
        !!current_user
    end
    
    def require_logged_in
        
        redirect_to new_session_url unless logged_in?
    end

    def require_moderator
        @sub = Sub.find(params[:id])
        redirect_to subs_url unless current_user.id == @sub.moderator_id
        
    end
end