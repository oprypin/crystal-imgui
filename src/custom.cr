module ImGui
  struct ImVector(T)
    @size : Int32
    @capacity : Int32
    @data : T*

    def initialize(@size, @capacity, @data)
    end
  end

  @[Extern]
  private struct ImVectorInternal
    @size : Int32
    @capacity : Int32
    @data : Void*

    def initialize(@size, @capacity, @data)
    end
  end
end
