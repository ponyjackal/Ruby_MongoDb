class Lead
  include Mongoid::Document
  include Mongoid::Timestamps
  # include SimpleEnum::Mongoid

  # as_enum :status, assigned: 1, unassigned: 2, distributed: 3

  validates :contact, :email, :phone, :job_category, :work_type, :source, :trade_type,
    presence: true

  field :source, type: Integer
  field :job_category, type: Integer
  field :work_type, type: Integer
  field :trade_type, type: Integer
  field :company, type: String
  field :phone, type: String
  field :mailing_same_as_location, type: Boolean, default: false
  field :email, type: String
  field :contact, type: String

  belongs_to :user, class_name: User.name, dependent: :nullify

  embeds_one :location_info, class_name: AddressInfo.name
  embeds_one :billing_info, class_name: AddressInfo.name
  embeds_one :mailing_info, class_name: AddressInfo.name

  embeds_many :attachments, as: :attachable, cascade_callbacks: true

  accepts_nested_attributes_for :location_info, allow_destroy: true
  accepts_nested_attributes_for :billing_info, allow_destroy: true
  accepts_nested_attributes_for :mailing_info, allow_destroy: true
  accepts_nested_attributes_for :attachments, allow_destroy: true
end
