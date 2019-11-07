class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  as_enum :role, admin: 1, sub_admin: 2, field_rep: 3

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  # field :confirmation_token,   type: String
  # field :confirmed_at,         type: Time
  # field :confirmation_sent_at, type: Time
  # field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time

  field :password, type: String
  field :first_name, type: String
  field :middle_name, type: String
  field :last_name, type: String
  field :initials, type: String
# TODO need to look at this again
  field :employee_id, type: String
  field :phone, type: String
  field :status, type: Integer
  field :avatar, type: String

  has_many :jobs, class_name: Job.name, inverse_of: :contact, dependent: :destroy
  has_many :leads, class_name: Lead.name
end
