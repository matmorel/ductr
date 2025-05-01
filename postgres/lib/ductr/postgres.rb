# frozen_string_literal: true

require "ductr"
require "sequel"

Dir[File.join(__dir__, "postgres", "*.rb")].each { |file| require file }

# :nodoc:
module Ductr
  #
  # ## PostgreSQL adapter for Ductr ETL
  # This gem provides useful controls to operate Ductr ETL with PostgreSQL databases.
  #
  # To get details about the database connection handling, checkout the {Ductr::Postgres::Adapter} class.
  #
  # ### Sources
  # - {Ductr::Postgres::BasicSource} Yields rows one by one using postgres streaming feature.
  #
  # ### Lookups
  # - {Ductr::Postgres::BasicLookup} Executes one query per row and merge the looked up row with the current row.
  # - {Ductr::Postgres::BufferedLookup} Executes one query for a bunch of rows and let you implement the matching logic.
  # - {Ductr::Postgres::MatchLookup} Executes one query for a bunch of rows and abstracts the matching logic.
  #
  # ### Destinations
  # - {Ductr::Postgres::BasicDestination} Writes rows one by one.
  # - {Ductr::Postgres::BufferedDestination} Accumulates rows in a buffer to write them by batch.
  # - {Ductr::Postgres::BufferedUpsertDestination} Accumulates rows in a buffer to upsert them by batch.
  #
  module Postgres; end
end
