class ChatReportService
  def initialize(history)
    @history = history
  end

  def run
    client = OpenAI::Client.new(api_key: ENV["OPENAI_API_KEY"])

    response = client.chat(
      parameters: {
        model: "gpt-4o",
        temperature: 0.3,
        messages: build_prompt
      }
    )

    response.dig("choices", 0, "message", "content")
  rescue => e
    Rails.logger.error("OpenAI error: #{e.message}")
    "Sorry, I'm having trouble generating a response right now."
  end

  private

  def build_prompt
    # You can customize the system message here
    [
      { role: "system", content: system_prompt }
    ] + @history
  end

  def system_prompt
    <<~PROMPT
      You are a helpful assistant helping users report bugs and feature requests clearly.
      Use short, clear sentences and ask for missing details if needed.
    PROMPT
  end
end
