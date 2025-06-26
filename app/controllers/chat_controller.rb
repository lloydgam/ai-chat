# app/controllers/chat_controller.rb
class ChatController < ApplicationController
  def index
    puts "xx"
    @messages = []
  end

  def create
    history = params[:history] || []
    history = JSON.parse(history) if history.is_a?(String)

    service = ChatReportService.new(history)
    ai_reply = service.run

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.append('chat_history', partial: 'chat/message', locals: {
          role: 'assistant',
          content: ai_reply
        })
      end

      format.html { redirect_to chat_path }
    end
  end
end
