class Api::V1::LeadsController < Api::V1::ApiController
  before_action :authenticate_user!
  load_and_authorize_resource except: [:create]

  def index
    @leads
  end

  def create
    @lead = Lead.new lead_params
    @lead.user_id = current_user.id

    unless @lead.save
      render json: {error: @lead.errors.full_messages.to_sentence}, status: 400
      return
    end
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
    def lead_params
      params.require(:lead).permit :id, :source, :job_category, :work_type, :trade_type,
        :company, :phone, :mailing_same_as_location, :email, :contact,
        location_info_attributes: [:id, :address, :city, :state, :zip, :_destroy],
        billing_info_attributes: [:id, :address, :city, :state, :zip, :_destroy],
        mailing_info_attributes: [:id, :address, :city, :state, :zip, :_destroy],
        attachments_attributes: [:id, :data, :_destroy]
    end
end
