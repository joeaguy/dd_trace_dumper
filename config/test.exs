import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :dd_trace_dumper, DdTraceDumperWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "gxbhdwrucFRQET8yDyEZch6Hw9gO+tAoMoY+UMChCBZynpep6JrlUsxxLsM50RcE",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
