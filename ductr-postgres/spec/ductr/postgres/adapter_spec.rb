# frozen_string_literal: true

RSpec.describe Ductr::Postgres::Adapter do
  let(:name) { :my_adapter }
  let(:config) { { hello: :test } }
  let(:adapter) { described_class.new(name, **config) }

  describe "adapter registration" do
    let(:registered) { Ductr.adapter_registry.find(:postgres) }

    it "registers as :postgres" do
      expect { registered }.not_to raise_error
    end

    it "registers the adapter class" do
      expect(registered).to eq(described_class)
    end
  end

  describe "#open!" do
    # We can't use an instance_double because of Sequel's extension system
    let(:db_double) { double(Sequel::Database) } # rubocop:disable RSpec/VerifiedDoubles

    before do
      allow(Sequel).to receive(:postgres).and_return(db_double)
      allow(db_double).to receive(:extension)
      allow(db_double).to receive(:stream_all_queries=)
      allow(adapter).to receive(:close!)
    end

    context "without error" do
      it "opens the db with config" do
        adapter.open!
        expect(Sequel).to have_received(:postgres).with(**config)
      end

      it "loads :pg_streaming extension" do
        adapter.open!
        expect(db_double).to have_received(:extension).with(:pg_streaming)
      end

      it "enables streaming for all queries" do
        adapter.open!
        expect(db_double).to have_received(:stream_all_queries=).with(true)
      end

      it "returns the db instance" do
        expect(adapter.open!).to eq(db_double)
      end

      it "sets the @db instance var" do
        adapter.open!
        expect(adapter.instance_variable_get(:@db)).to eq(db_double)
      end
    end
  end

  describe "#close!" do
    let(:db_double) { instance_double(Sequel::Database) }

    before do
      allow(db_double).to receive(:disconnect)

      adapter.instance_variable_set(:@db, db_double)
      adapter.close!
    end

    it "disconnects from postgresql server" do
      expect(db_double).to have_received(:disconnect)
    end
  end
end
