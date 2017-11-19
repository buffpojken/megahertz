json.results(@results) do |result|

  json.title        result.title
  json.id           result.id
  json.description  result.description
  json.file_url     "https://www.dropbox.com/s/wjopjy66awtqgch/crtrailer22enhanced.mp3?dl=1"
  json.duration     result.duration

  json.tags(['skymningsläge', 'nyheter', 'magasin']) do |tag|
    json.id 1
    json.name tag
  end

end