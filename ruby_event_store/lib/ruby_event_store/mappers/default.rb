require 'yaml'

module RubyEventStore
  module Mappers
    class Default
      include PipelineMapper

      def initialize(serializer: YAML, events_class_remapping: {})
        @pipeline = Pipeline.new([
          DomainEventMapper.new,
          EventClassRemapper.new(events_class_remapping),
          SymbolizeKeys.new(symbolize_data: false),
          SerializedRecordMapper.new(serializer: serializer)
        ])
      end
    end
  end
end
