# frozen_string_literal: true

module Ductr
  module Postgres
    #
    # A trigger based on the RufusTrigger, runs the PollingHandler at the given timing.
    # The handler calls the scheduler's method with a block which compares the yield result with the previous one.
    # If they are different, yield returns true:
    #
    #   trigger :my_database, :polling, interval: "1min"
    #   def check_timestamp(db) # will perform MyJob if the name have changed
    #     return unless yield(db[:items].select(:name).first)
    #
    #     MyJob.perform_later
    #   end
    #
    class PollingTrigger < Ductr::SequelBase::PollingTrigger
      Adapter.trigger_registry.add(self, as: :polling)
    end
  end
end
