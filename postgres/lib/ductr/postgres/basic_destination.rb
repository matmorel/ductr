# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # A destination control that that writes rows one by one, registered as `:basic`:
    #
    #   destination :some_postgres_database, :basic
    #   def select_some_stuff(db, row)
    #     db[:items].update(row)
    #   end
    #
    class BasicDestination < Ductr::SequelBase::BasicDestination
      Adapter.destination_registry.add(self, as: :basic)
    end
  end
end
