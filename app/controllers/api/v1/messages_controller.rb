module Api
  module V1
    class MessagesController < ApplicationController
      def index
        messages = Message.all.order(created_at: :asc)
        puts messages.inspect
        puts "ssss"
        render json: {ok: 1}
      end

      def create
        message = Message.new(message_params)
        if message.save
          render json: message, status: :created
        else
          render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def message_params
        params.require(:message).permit(:role, :content)
      end
    end
  end
end
