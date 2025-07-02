class PromptBuilderService
  def initialize(context: :ticketing, extras: {})
    @context = context
    @extras = extras
  end

  def build
    case @context
    when :ticketing
      ticketing_prompt
    else
      raise "Unknown prompt context: #{@context}"
    end
  end

  private

  def ticketing_prompt
    <<~PROMPT
      You are an AI assistant helping users submit structured feedback.

      Your job is to:
      1. Classify the intent as one of: bug_report, feature_request, general_question
      2. Extract:
         - title (brief summary)
         - description (expanded)
         - priority (low, medium, high)
         - component/module (e.g. login, checkout, dashboard)
         - needs_screenshot (true/false, if relevant)
      3. If details are missing, reply with a question to gather them.

      Additional context:
      - Environment: #{@extras[:env] || "production"}
      - User: #{@extras[:user_name] || "warehouse"}

      Respond in valid JSON.
    PROMPT
  end
end
