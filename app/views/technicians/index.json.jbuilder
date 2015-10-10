json.array!(@technicians) do |technician|
  json.extract! technician, :id, :first_name, :last_name, :profession, :area, :city, :phone_number, :language, :pincode
  json.url technician_url(technician, format: :json)
end
