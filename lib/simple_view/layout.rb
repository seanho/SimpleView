module SimpleView
  module Layout
    def setup view, locals = {}, &block
      proxy = ViewProxy.new view, locals
      proxy.instance_eval &block if block_given?
    end
  end
end