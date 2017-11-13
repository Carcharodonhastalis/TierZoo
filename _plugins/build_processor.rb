require 'pry'

module BuildProcesssor
  
  class Generator < Jekyll::Generator
    def generate(site)
      builds_by_meta = {}

      # Pull all build icon files into a hash before the loop
      build_icons = site.static_files.select { |file| file.instance_variable_get(:@dir) == '/assets/build-icons' }
      
      # Process all builds
      site.collections['builds'].docs.each do |build|
        if build.data.has_key?('tiers')
          build.data['tiers'].each do |tier|
            builds_by_meta[tier[0]] ||= []
            builds_by_meta[tier[0]] << build
          end
        end

        # Set the icon to the path of the first file in /assets/build-icons with a matching
        # filename, bar the extension.
        if !build.data.has_key?('icon') &&
           iconfile = build_icons.detect { |icon| icon.basename.casecmp(build.data['slug'].downcase) == 0 }
          build.data['icon'] = iconfile.relative_path
        end
      end

      # Process all metagames
      site.collections['metagames'].docs.each do |metagame|
        data = metagame.data
        key = data['slug']
        if builds_by_meta.has_key?(key)
          metagame.data['builds'] = builds_by_meta[key]
        end
      end
    end
  end
  
end
