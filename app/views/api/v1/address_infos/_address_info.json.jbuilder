json.id address_info.id.to_s
json.extract! address_info, :address, :city, :state, :zip
