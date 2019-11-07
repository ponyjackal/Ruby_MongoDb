json.id lead.id.to_s
json.extract! lead, :source, :job_category, :work_type, :trade_type,
  :company, :phone, :mailing_same_as_location, :email

if lead.billing_info.present?
  json.billing_info do
    json.partial! '/api/v1/addres_infos/address_info', address_info: lead.billing_info
  end
end

if lead.mailing_info.present?
  json.mailing_info do
    json.partial! '/api/v1/addres_infos/address_info', address_info: lead.mailing_info
  end
end

if lead.location_info.present?
  json.location_info do
    json.partial! '/api/v1/addres_infos/address_info', address_info: lead.location_info
  end
end
