# frozen_string_literal: true

module Ductr
  module SQLite
    #
    # A destination control that accumulates rows in a buffer to upsert them by batch, registered as `:buffered_upsert`.
    # Accept the `:buffer_size` option, default value is 10 000:
    #
    #   destination :some_sqlite_database, :buffered_upsert, buffer_size: 42
    #   def my_destination(db, excluded, buffer)
    #     db[:items].insert_conflict(target: :id, update: excluded).multi_insert(buffer)
    #   end
    #
    # @see more Ductr::ETL::BufferedDestination
    #
    class BufferedUpsertDestination < Ductr::SequelBase::BufferedUpsertDestination
      Adapter.destination_registry.add(self, as: :buffered_upsert)
    end
  end
end
