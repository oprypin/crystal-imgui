module ImGui
  private SENTINEL = Random.rand(Int32)

  LibImGui.igSetAllocatorFunctions(->(size, data) {
    ptr = GC.malloc(size + sizeof(Void*))
    ptr.as(Int32*).value = SENTINEL
    (ptr.as(Int32*) + 1).value = SENTINEL
    ptr + sizeof(Void*)
  }, ->(ptr, data) {}, nil)

  private module DirectClassType(T)
    macro included
      @this : T

      # :nodoc:
      TYPEID = allocate.as(Int32*).value

      private def initialize(ptr : T*)
        @this = uninitialized T
        raise "BUG: Can't create #{{{@type}}} from pointer"
      end

      # :nodoc:
      def self.new(ptr : T*) : self
        (ptr.as(Void*) - offsetof(self, @this)).as(Int32*).tap do |ptr|
          if ptr.value.in?(SENTINEL, TYPEID)
            ptr.value = TYPEID
          else
            puts "BUG: Corrupted memory #{ptr} #{ptr.value} when creating #{{{@type}}}"
          end
        end.as(self)
      end

      def to_unsafe : T*
        pointerof(@this)
      end
    end
  end

  private module StructClassType(T)
    macro included
      @this : T*

      # :nodoc:
      def initialize(@this : T*)
      end

      def to_unsafe : T*
        @this
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
