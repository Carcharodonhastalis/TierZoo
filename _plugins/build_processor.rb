require 'pry'

module BuildProcesssor
  
  class Generator < Jekyll::Generator
    def generate(site)
      builds_by_meta = {}
      site.collections['builds'].docs.each do |build|
        if build.data.has_key?('tiers')
          build.data['tiers'].each do |tier|
            builds_by_meta[tier[0]] ||= []
            builds_by_meta[tier[0]] << build
          end
        end
      end

      site.collections['metagames'].docs.each do |doc|
        data = doc.data
        key = data['slug']
        if builds_by_meta.has_key?(key)
          doc.data['builds'] = builds_by_meta[key]
        end
      end
    end
  end
  
end
