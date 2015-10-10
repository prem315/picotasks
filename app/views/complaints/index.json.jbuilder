json.array!(@complaints) do |complaint|
  json.extract! complaint, :id, :technician, :summary, :landmark, :area, :city, :time, :pincode, :date, :language
  json.url complaint_url(complaint, format: :json)
end
