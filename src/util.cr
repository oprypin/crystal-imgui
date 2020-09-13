macro assert(expr)
  ({{expr}}) || raise "Assertion failed: " + {{expr.stringify}}
end

struct StaticValue(T)
  @@values = {} of Symbol => Void*

  def initialize(@key : Symbol)
    @@values[@key] ||= Box.box(yield)
  end

  def val : T
    Box(T).unbox(@@values[@key])
  end

  def val=(val : T)
    @@values[@key] = Box.box(val)
    val
  end
end

macro static(var, file = __FILE__, line = __LINE__)
  {% key = {file, line, var.target}.symbolize %}
  {{var.target}} = StaticValue(typeof({{var.value}})).new({{key}}) { {{var.value}} }
end
