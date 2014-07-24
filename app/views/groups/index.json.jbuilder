json.array!(@groups) do |group|
  json.extract! group, :id, :name, :type, :about, :details, :scope
  json.url group_url(group, format: :json)
end
