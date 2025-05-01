# frozen_string_literal: true

module Ductr
  module SQLite
    #
    # A source control that allows to select a big number of rows by relying on pagination, registered as `:paginated`.
    # Accept the `:page_size` option, default value is 10 000.
    #
    #   source :some_sqlite_database, :paginated, page_size: 4
    #   def my_source(db, offset, limit)
    #     db[:items].offset(offset).limit(limit)
    #   end
    #
    # Ensure to not select more rows than the configured page size,
    # otherwise it will raise an `InconsistentPaginationError`.
    #
    class PaginatedSource < Ductr::SequelBase::PaginatedSource
      Adapter.source_registry.add(self, as: :paginated)
    end
  end
end
