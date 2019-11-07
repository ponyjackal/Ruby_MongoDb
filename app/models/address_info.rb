class AddressInfo
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :lead, class_name: Lead.name, inverse_of: :billing_info
  embedded_in :lead, class_name: Lead.name, inverse_of: :mailing_info
  embedded_in :lead, class_name: Lead.name, inverse_of: :location_info
  
  field :address, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: String
end
