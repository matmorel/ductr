# frozen_string_literal: true

module Ductr
  module SQLite
    #
    # A destination control that write rows one by one, registered as `:basic`:
    #
    #   destination :some_sqlite_database, :basic
    #   def my_destination(db, row)
    #     db[:items].insert(row)
    #   end
    #
    class BasicDestination < Ductr::SequelBase::BasicDestination
      Adapter.destination_registry.add(self, as: :basic)
    end
  end
end
