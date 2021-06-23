class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?

    def current_user
        return nil if session[:session_token].nil?
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def log_in_user!(user)
        user.reset_session_token!
        session[:session_token] = user.session_token
    end

    def logout!
        current_user.reset_session_token!
        session[:session_token] = nil
        @current_user = nil
    end

    def require_logged_out
        redirect_to bands_url if logged_in?
    end
end
