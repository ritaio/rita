module Lita
  module Handlers
    class Ping < Handler
      route(
        /ping$/uxi,
        :respond_to_ping,
        command: true,
        help: { ping: "Pongs back if bot is awake and listening." }
      )

      http.get "/ping" do |_request, response|
        response.body << { message: "PONG PONG PONG" }.to_json
      end

      def respond_to_ping(response)
        response.reply "PONG PONG PONG"
      end
    end

    Lita.register_handler(Ping)
  end
end
