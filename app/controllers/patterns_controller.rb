class PatternsController < ApplicationController
    def index
        headers = request.headers["Authorization"]
        
        if !headers 
            render json: {message: "nice try, asshole"}
        else 
            token = headers.split(" ")[1]
            secret = Rails.application.secrets.secret_key_base 
            payload = JWT.decode(token, secret).first 

            render json: {message: "check out your pattern, #{payload['username']}"}
        end 
    end 

    def create
        token = request.headers["Authorization"].split(" ")[1]
        secret = Rails.application.secrets.secret_key_base 
        @user_id = JWT.decode(token, secret)[0]["user_id"]

        @pattern = Pattern.create(
            user_id: @user_id,
            # type: params[:type],
            content: params[:content]
        )

        render json: @pattern
    end 
end
