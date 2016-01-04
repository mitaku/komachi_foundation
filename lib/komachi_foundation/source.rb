module KomachiFoundation
  class Source
    class << self
      def list
        @_source_list ||= []
      end

      def register(path)
        list << path
      end
    end
  end
end
