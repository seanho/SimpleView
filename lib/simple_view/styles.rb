module SimpleView
  class Styles
    @repo = {}

    def self.define name, options = {}
      @repo[name] ||= {}
      @repo[name].merge! options
    end

    def self.for name
      @repo[name] || {}
    end
  end
end