require "thor"

module KomachiFoundation
  class PackageLoader < Thor::Group
    include Thor::Actions

    if defined?(Rails)
      require "rails/generators/actions"
      include Rails::Generators::Actions
    end

    argument :package

    def load_package
      _source_root = KomachiFoundation.const_get(package.classify).source_root
      recipe_file = File.join(_source_root, "recipe.rb")
      if File.exists?(recipe_file)
        @source_paths = [File.join(_source_root, "templates")]
        apply(recipe_file)
      else
        raise Error, "Invalid package name #{package}/recipe.rb"
      end
    end
  end
end
