class ApplicationController < ActionController::API

    before_action :authorized

    def encode_token(payload)
        # this "secret password" should be unique to this project and MUST MATCH where it is used in the decode
        # later on in this controller in the decoded_token method
        JWT.encode(payload, "put your secret password here")
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        if auth_header
          # label token from the header of the request, the first word will be Bearer by convention
          # If you send in JUST the token as your Authorization you won't need the split
          token = auth_header.split(' ')[1]
          begin
            # decode the token with your secret password/phrase
            # This sequence is important to have the true and, for now, this algorithm
            #   You can look into what they mean on your own, but just know they help JWT stuff work.
            JWT.decode(token, "put your secret password here", true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
    end

    def current_user
        if decoded_token
          # Using the decoded token, grab the user_id stored within it and find a user
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end
end
