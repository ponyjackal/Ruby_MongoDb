json.leads @leads do |lead|
  json.partial! '/api/v1/leads/lead', lead: lead
end
