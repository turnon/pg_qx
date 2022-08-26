require 'json'

module PgQuery
  class ParserResult
    def walk(&block)
      tree.walk(&block)
    end
  end

  class ParseResult
    def walk(&block)
      JSON.parse(to_json).pg_query_walk([], &block)
    end
  end
end

class Hash
  def pg_query_walk(stack, &block)
    each_pair do |k, v|
      stack.push(k)
      if block.call(stack, v)
        v.pg_query_walk(stack, &block)
      end
      stack.pop
    end
  end
end

class Array
  def pg_query_walk(stack, &block)
    each do |e|
      e.pg_query_walk(stack, &block)
    end
  end
end

class Object
  def pg_query_walk(stack, &block)
  end
end
