require "komachi_foundation/source"
require "thor"

module KomachiFoundation
  class Generator < Thor::Group
    include Thor::Actions

    def self.source_paths
      @_source_paths ||= Source.list
    end

    argument :file_name
    source_root File.expand_path('../templates', __FILE__)

    def copy_templates
      if File.directory?(find_in_source_paths(file_name))
        directory file_name
      elsif
        template file_name
      end
    end
  end
end

