json.array!(@profiles) do |profile|
  json.extract! profile, :id, :user_id, :occupations, :skills, :education, :date_of_birth, :hometown, :about
  json.url profile_url(profile, format: :json)
end
