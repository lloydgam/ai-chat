module Api
  module V1
    class MessagesController < ApplicationController
      before_action :doorkeeper_authorize!

      def index
        messages = Message.order(created_at: :asc)
        render json: messages
      end

      def create
        session_id = params[:session_id]
        user_input = params[:message]

        user_msg = Message.create!(role: 'user', content: user_input, session_id: session_id)

        history = Message.where(session_id: session_id)
                         .order(:created_at)
                         .pluck(:role, :content)
                         .map { |role, content| { role:, content: } }

        reply = ChatReportService.new(history).run

        assistant_msg = Message.create!(role: 'assistant', content: reply, session_id: session_id)

        render json: {
          user: user_msg,
          assistant: assistant_msg
        }, status: :created
      end

      private

      def message_params
        params.permit(:session_id, :message)
      end
    end
  end
end
