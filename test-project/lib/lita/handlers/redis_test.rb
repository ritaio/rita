module Lita
  module Handlers
    class RedisTest < Handler
      route(
        /^remember\sthis\s(.+)$/i,
        :remember,
        command: true,
        help: { remember: "Stores specified string in redis as user metadata." }
      )

      route(
        /^forget\sme$/i,
        :forget,
        command: true,
        help: { forget: "Clears user metadata." }
      )

      route(
        /^recall\smy\sinfo$/i,
        :recall,
        command: true,
        help: { recall: "Reveals stored user metadata." }
      )

      def remember(response)
        thing_to_remember = response.match_data.captures.first.strip
        response.user.metadata.store("information", thing_to_remember)
        response.user.save
        response.reply("I have stored #{thing_to_remember} for future reference.")
      end

      def forget(response)
        response.user.metadata.delete("information")
        response.user.save
        response.reply("I have forgotten all information about you!")
      end

      def recall(response)
        user_info = response.user.metadata["information"]
        response.reply("Here's what I know about you: \n#{user_info}")
      end
    end

    Lita.register_handler(RedisTest)
  end
end
