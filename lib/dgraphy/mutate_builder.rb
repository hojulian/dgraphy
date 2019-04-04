class Dgraphy
  class MutateBuilder
    def initialize
      @string = "{set{"
    end

    def field(subject, predicate, object)
      field = "<#{subject}> <#{predicate}> #{object} .\n"
      @string += field
    end

    def raw_field(field)
      @string += field + "\n"
    end

    def connecting_field(parent, predicate, child)
      field = "<#{parent}> <#{predicate}> <#{child}> .\n"
      @string += field
    end

    def to_s
      if @string[@string.length-2..@string.length-1] != "}}"
        @string += "}}"
      end
      @string
    end
  end
end