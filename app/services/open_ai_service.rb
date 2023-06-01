class OpenAiService
  attr_accessor :prompt, :client
  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
  end

  def translate_body
    params = {
      model: "gpt-3.5-turbo", # Required.
      messages: [{role: "user", content: "Translate this HTML to french and return only the new HTML: #{@prompt}"}], # Required.
      temperature: 0.7
    }
    response = client.chat(parameters: params)
    response.dig("choices", 0, "message", "content")
  end

  def translate_tile
    params = {
      model: "gpt-3.5-turbo", # Required.
      messages: [{role: "user", content: "Translate this job title to french and return only the new title #{@prompt}"}], # Required.
      temperature: 0.7
    }
    response = client.chat(parameters: params)
    response.dig("choices", 0, "message", "content")
  end
end
