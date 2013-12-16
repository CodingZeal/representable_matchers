require "matchers/json/render_json_matcher"

module Representable
  module Matchers
    def render_json
      RenderJsonMatcher.new
    end
  end
end