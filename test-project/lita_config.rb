require_relative "lib/handlers"

Lita.configure do |config|
  config.robot.name = "testbot"

  config.robot.adapter = :shell
  config.robot.log_level = :debug
  config.http.port = 3333
end
