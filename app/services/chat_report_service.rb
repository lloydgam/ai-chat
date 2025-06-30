class ChatReportService
  def initialize(history)
    @history = history
  end

  def run
    client = OpenAI::Client.new(access_token: ENV["OPENAI_API_KEY"])

    response = client.chat(
      parameters: {
        model: ENV["OPENAI_MODEL"],
        messages: build_prompt
      }
    )
    content = response.dig("choices", 0, "message", "content")
    raise StandardError, "No content returned by OpenAI: #{response}" unless content
  
    content
  end

  private

  def build_prompt
    [
      { role: "system", content: system_prompt }
    ] + @history
  end

  def system_prompt
    <<~PROMPT
      You are a helpful assistant for engineers and PMs reporting bugs or feature requests.
      Respond clearly and ask relevant follow-up questions.
    PROMPT
  end
end
