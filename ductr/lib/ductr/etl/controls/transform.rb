# frozen_string_literal: true

module Ductr
  module ETL
    #
    # Base class for implementing transforms.
    #
    class Transform < Control
      #
      # Calls the control method and passes the row.
      # You must return nil if you use the row yielder block.
      #
      # @param [Object] row The row to process
      # @yield [row] The row yielder
      #
      # @return [void]
      #
      def process(row, &)
        call_method(row, &)
      end

      #
      # Called when the last row is reached.
      #
      # @return [void]
      #
      def close; end
    end
  end
end
