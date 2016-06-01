module GeoNamesAPI
  class FindById < Base

    METHOD = "getJSON"
    FIND_PARAMS = %w(geonameId)

    def self.endpoint_returns_list?
      false
    end
  end
end
