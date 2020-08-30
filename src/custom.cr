module ImGui
  struct ImVector(T)
    getter size : Int32
    getter capacity : Int32
    @data : T*

    def initialize(@size, @capacity, @data)
    end

    include Indexable(T)

    def unsafe_fetch(index : Int)
      @data[index]
    end

    def to_unsafe : T*
      @data
    end
  end
end

lib LibImGui
  alias ImWchar = Char

  struct ImVectorInternal
    size : Int32
    capacity : Int32
    data : Void*
  end
end
