class Dgraphy
  class Schema
    @default_options = {
      :count => nil,
      :index => nil,
      :reverse => nil,
      :lang => :en
    }

    def initialize
      @schema = []
    end

    def field(field_name, type, **options)
      line = "#{field_name}: #{type} #{_options_to_s(options)} ."
      @schema << line
    end

    def _options_to_s(options)
      line = ''
      options.each do |k,v|
        @default_options[k] = v
      end
      line
    end

    def build
      @schema.join("\n")
    end
  end
end