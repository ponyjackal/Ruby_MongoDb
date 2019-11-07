class Api::V1::UsersController < Api::V1::ApiController
  before_action :authenticate_user!, except: [:login, :signup]
  load_and_authorize_resource except: [:login, :signup]
  #BOILER PLATE CODE

  #GET /api/v1/users
  def index
    @users
  end

  # POST /api/v1/users
  def create
  end

  # PUT /api/v1/users/:id
  def update
  end

  # DESTROY /api/v1/users/:id
  def destroy
  end

  #GET /api/v1/users/:id
  def show
  end

  #POST /api/v1/users/login
  def login
    current_user = User.find_by email: login_params[:email].downcase

    if current_user.present? and current_user.valid_password? login_params[:password]
      sign_in :user, current_user

      # Inform ability about the logged in user
      current_ability

    else
      render json: { error: 'Incorrect email or password' }, status: 401
      return
    end
  end

  def signup
    current_user = User.new signup_params
    current_user.email = signup_params[:email].downcase

    if current_user.persisted?
      if current_user.active_for_authentication?
        sign_in :user, current_user
      end
    else
      return invalid_sign_up_attempt current_user
    end
  end

  def logout
    sign_out current_user
    render json: {message: 'Logged out'}, status: 200
  end

  private

  def login_params
    params.require(:user).permit :email, :password
  end

  def signup_params
    params.require(:user).permit :email, :password, :first_name, :middle_name, :last_name, :initials,
      :phone, :status, :avatar
  end

  def invalid_sign_up_attempt user
    @message = user.errors.full_messages.first
    render json: {error: @message}, :status => 401
  end
end
