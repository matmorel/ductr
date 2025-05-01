# frozen_string_literal: true

require "ductr"
require "sequel"

Dir[File.join(__dir__, "sqlite", "*.rb")].each { |file| require file }

# :nodoc:
module Ductr
  #
  # ## SQLite adapter for Ductr ETL
  # This gem provides useful controls to operate Ductr ETL with SQLite databases.
  #
  # To get details about the database connection handling, checkout the {Ductr::SQLite::Adapter} class.
  #
  # ### Sources
  # - {Ductr::SQLite::BasicSource} Yields rows one by one.
  # - {Ductr::SQLite::PaginatedSource} Allows to select a big number of rows by relying on pagination.
  #
  # ### Lookups
  # - {Ductr::SQLite::BasicLookup} Executes one query per row and merge the looked up row with the current row.
  # - {Ductr::SQLite::BufferedLookup} Executes one query for a bunch of rows and let you implement the matching logic.
  # - {Ductr::SQLite::MatchLookup} Executes one query for a bunch of rows and abstracts the matching logic.
  #
  # ### Destinations
  # - {Ductr::SQLite::BasicDestination} Writes rows one by one.
  # - {Ductr::SQLite::BufferedDestination} Accumulates rows in a buffer to write them by batch.
  # - {Ductr::SQLite::BufferedUpsertDestination} Accumulates rows in a buffer to upsert them by batch.
  #
  module SQLite; end
end
