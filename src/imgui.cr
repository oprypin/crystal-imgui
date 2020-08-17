module ImGui
  LibImGui.igSetAllocatorFunctions(->(size, data) {
    (GC.malloc(size + sizeof(Void*)) + sizeof(Void*))
  }, ->(ptr, data) {}, nil)

  private module ClassType(T)
    macro included
      @this : T

      # :nodoc:
      TYPEID = allocate.as(Int32*).value

      private def initialize(ptr : T*)
        @this = uninitialized T
        raise "BUG: Can't create #{@type} from pointer"
      end

      # :nodoc:
      def self.new(ptr : T*) : self
        (ptr.as(Void*) - offsetof(self, @this)).tap(&.as(Int32*).value = TYPEID).as(self)
      end

      def to_unsafe : T*
        pointerof(@this)
      end
    end
  end

  private module StructType
    macro included
      def to_unsafe : {{@type}}*
        pointerof(@{{@type.instance_vars.first}})
      end
    end
  end
end

require "./lib"
require "./obj"
