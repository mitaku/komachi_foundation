module KomachiFoundation
  class Package
    class << self
      def list
        _list = @_source_list || {}
        _list.values
      end

      def register(name, path)
        @_source_list ||= {}
        if @_source_list.has_key?(name.to_sym)
          puts "SKIP: already registered package #{name}"
        else
          @_source_list[name.to_sym] = path
        end
      end
    end
  end
end
