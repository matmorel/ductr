# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # The PostgreSQL adapter implement the required #open! and #close! methods to handle the database connection.
    # The adapter is registered as `:postgres` to use it, add `adapter: postgres` to the YAML configuration e.g.:
    #
    # ```yml
    # # config/development.yml
    # adapters:
    #   some_postgres_database:
    #     adapter: postgres
    #     host: localhost
    #     user: postgres
    #     password: s3cr3t
    #     database: example
    # ```
    #
    # @see https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html#label-General+connection+options
    #   General sequel options
    # @see https://sequel.jeremyevans.net/rdoc/files/doc/opening_databases_rdoc.html#label-postgres
    #   PostgreSQL specific options
    #
    class Adapter < Ductr::SequelBase::Adapter
      Ductr.adapter_registry.add(self, as: :postgres)

      #
      # Opens the database connection with the adapter's configuration.
      #
      # @return [Sequel::Database] The database connection instance
      #
      def open!
        @db = Sequel.postgres(**config)

        @db.extension(:pg_streaming)
        @db.stream_all_queries = true

        @db
      end

      #
      # Closes the database connection.
      #
      # @return [void]
      #
      def close!
        @db.disconnect
      end
    end
  end
end
