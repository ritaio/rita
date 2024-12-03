# Rita Test Project

This is a barebones Rita chatbot project that uses the `shell` adapter and contains trivial handlers to verify basic `rita` functionality. It's meant for Rita contributors to sanity test changes they're making on a real life Rita chatbot implementation.

## Usage Instructions

To start a chatbot session:

```bash
cd test-project
bundle install
bundle exec lita
```

You may then ensure your changes to `rita` have not broken or radically altered basic chatbot functionality like so:
- `curl http://localhost:3333/lita/info` will reveal basic diagnostic info about the running chatbot project
- Use `@testbot ping` to ensure `rita` receives and responds to basic command directives.
- Hit the `/ping` endpoint (e.g. `curl http://localhost:3333/ping`) to verify basic http handler functionality.
- Use `@testbot remember this [antyhing]` to ensure that `rita` can store metadata about a user in redis.
- Use `@testbot recall my info` to ensure that user metadata is persistently stored in redis.
- Use `@testbot forget me` to ensure that we can successfully remove user metadata from redis when desired.
