class UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token, raise: false

  def create
    user = User.find(entity.id)
    render json: {
      jwt: auth_token.token,
      email: user.email,
      name: user.name,
      id: user.id
    }, status: :created
  end

end
