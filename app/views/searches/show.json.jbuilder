json.suggestions(@results) do |result|

  json.value result.title
  json.data result.id

end