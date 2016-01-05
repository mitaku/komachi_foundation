require "komachi_foundation/package"
require "thor"

module KomachiFoundation
  class PackageLoader < Thor::Group
    include Thor::Actions

    if defined?(Rails)
      require "rails/generators/actions"
      include Rails::Generators::Actions
    end

    def self.source_paths
      @_source_paths ||= Package.list
    end

    argument :package

    def load_package
      source = find_in_source_paths(package)

      package_file = File.join(source, "package.rb")
      if File.exists?(package_file)
        @source_paths = [source]
        apply(package_file)
      else
        raise Error, "Invalid package name #{package}/package.rb"
      end
    end
  end
end
