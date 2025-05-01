# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # A lookup control that execute the query for a bunch of rows, registered as `:match`.
    #
    # Accept the `:buffer_size` option, default value is 10 000.
    # Accept the `:merge` option, mandatory an array with two entries:
    # - The first one is the looked up row key to match.
    # - The second one is the buffer row key to match.
    #
    # Unless the `:buffered` lookup, this one abstracts the row matching logic by assuming that
    # you want to merge rows based on a key couple e.g. primary / foreign keys:
    #
    #   lookup :some_postgres_database, :match, merge: [:id, :item], buffer_size: 42
    #   def merge_with_stuff(db, ids)
    #     db[:items_bis].where(item: ids)
    #   end
    #
    class MatchLookup < Ductr::SequelBase::MatchLookup
      Adapter.lookup_registry.add(self, as: :match)
    end
  end
end
