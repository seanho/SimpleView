module SimpleView
  class Styles
    @@repo = {}

    def self.define name, options = {}
      existing = @@repo[name] || {}
      @@repo[name] = existing.update(options)
    end

    def self.for name
      @@repo[name]
    end
  end
end