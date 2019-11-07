class Job
  include Mongoid::Document
  include Mongoid::Timestamps
  include SimpleEnum::Mongoid

  as_enum :progress, closed: 0, invoiced: 1, prospect: 2, assigned: 3, job_in_progress: 4,
    past_due_balance: 5, cancelled: 6, lead: 7

  as_enum :status, approved: 0, completed: 1

  belongs_to :contact, class_name: User.name, inverse_of: :jobs

  field :company, type: String
  field :balance, type: Float
  field :company, type: String
end
