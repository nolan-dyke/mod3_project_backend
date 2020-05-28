class PatternsController < ApplicationController
    before_action :authenticate, only: [:create, :index]
    def index
        # headers = request.headers["Authorization"]
        
        # if !headers 
        #     render json: {message: "nice try, asshole"}
        # else 
        #     token = headers.split(" ")[1]
        #     secret = Rails.application.secrets.secret_key_base 
        #     payload = JWT.decode(token, secret).first 

        #     render json: {message: "check out your pattern, #{payload['username']}"}
        # end 

        @patterns = Pattern.where(user_id: @user_id)
        render json: @patterns
    end 

    def create
        @pattern = Pattern.create(
            user_id: @user_id,
            # type: params[:type],
            content: params[:content]
        )

        render json: @pattern
    end 
end
