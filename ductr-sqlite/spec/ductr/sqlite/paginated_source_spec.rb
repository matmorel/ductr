# frozen_string_literal: true

RSpec.describe Ductr::SQLite::PaginatedSource do
  describe "control registration" do
    let(:registered) { Ductr::SQLite::Adapter.source_registry.find(:paginated) }

    it "registers as :paginated" do
      expect(registered).not_to be_nil
    end

    it "registers the the control class" do
      expect(registered).to eq(described_class)
    end
  end
end
