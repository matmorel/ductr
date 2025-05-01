# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # A lookup control that execute one query per row, registered as `:basic`.
    # The job's method must return a row which will merged with the current row:
    #
    #   lookup :some_postgres_database, :basic
    #   def my_lookup(db, row)
    #     db[:items_bis].where(item: row[:id]).limit(1)
    #   end
    #
    # As the control merge the looked up row with the current row,
    # ensure that column names are different or they will be overwritten.
    #
    # If the lookup returns a falsy value, nothing won't be merged with the current row.
    #
    class BasicLookup < Ductr::SequelBase::BasicLookup
      Adapter.lookup_registry.add(self, as: :basic)
    end
  end
end
