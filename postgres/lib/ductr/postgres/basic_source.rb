# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # A source control that yields rows usnig the PostgreSQL streaming feature, registered as `:basic`:
    #
    #   source :some_postgres_database, :basic
    #   def select_some_stuff(db)
    #     db[:items].limit(42)
    #   end
    #
    # You can select a large number of rows, without worrying about pagination handling or memory usage.
    #
    class BasicSource < Ductr::SequelBase::BasicSource
      Adapter.source_registry.add(self, as: :basic)
    end
  end
end
