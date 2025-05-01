# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # A lookup control that execute the query for a bunch of rows, registered as `:buffered`.
    # Accept the `:buffer_size` option, default value is 10 000.
    # You have to implement your own row matching logic:
    #
    #   lookup :some_postgres_database, :buffered, buffer_size: 42
    #   def my_lookup(db, buffer, &)
    #     ids = buffer.map {|row| row[:id]}
    #     db[:items].where(item: ids).each do |row|
    #       match = buffer.find { |r| r[:id] == row[:item] }
    #
    #       next yield(row) unless match
    #
    #       yield(row.merge match)
    #     end
    #   end
    #
    class BufferedLookup < Ductr::SequelBase::BufferedLookup
      Adapter.lookup_registry.add(self, as: :buffered)
    end
  end
end
