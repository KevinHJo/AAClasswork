class ApplicationController < ActionController::Base

    # CRLLL

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def require_login
        redirect_to root_url unless logged_in?
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logged_in?
        !!current_user
    end

    def logout!
        session[:session_token] = nil
        @current_user.reset_session_token!
        @current_user = nil
    end


end
