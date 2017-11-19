json.results(@results) do |result|

  json.title        result.title
  json.id           result.id
  json.description  result.description
  json.file_url     result.file_url
  json.duration     result.duration

end