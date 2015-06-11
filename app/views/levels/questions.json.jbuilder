json.questions do
  json.array!(@questions) do |question|
    json.content question.content
  end
end