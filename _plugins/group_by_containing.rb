module Jekyll
  module GroupByContainingFilter
    
    def group_by_array_contents( input, arrayprop )
      hash = {}
      input.each do |item|
        array = item[arrayprop]
        array.each do |key|
          key = key[0] if key.length
          hash[key] ||= []
          hash[key] << item
        end
      end

      return hash
    end

    module_function :group_by_array_contents
    
  end
end

Liquid::Template.register_filter(Jekyll::GroupByContainingFilter)
