module ImGui
  struct ImVector(T)
    @size : Int32
    @capacity : Int32
    @data : T*

    def initialize(@size, @capacity, @data)
    end
  end
end

lib LibImGui
  struct ImVectorInternal
    size : Int32
    capacity : Int32
    data : Void*
  end
end
