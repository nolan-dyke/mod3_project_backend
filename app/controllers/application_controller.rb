class ApplicationController < ActionController::API
    def authenticate
        token = request.headers["Authorization"].split(" ")[1]
        secret = Rails.application.secrets.secret_key_base 
        @user_id = JWT.decode(token, secret)[0]["user_id"]
    end 
end
