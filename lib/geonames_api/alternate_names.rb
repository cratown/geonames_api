module GeoNamesAPI
  # Arrays of Geoname instances are returned by `Hierarchy.find`
  class AlternateNames

    def initialize(alternate_names_array)
      @name_by_lang = {}
      alternate_names_array.each do |hash|
        if !@name_by_lang.key?(hash['lang'])
          @name_by_lang[hash['lang']] = hash['name']
        elsif hash['name'].length < @name_by_lang[hash['lang']]
          @name_by_lang[hash['lang']] = hash['name']
        # elsif hash['isPreferredName']
        #   @name_by_lang[hash['lang']] = hash['name']
        # elsif hash['isShortName']
        #   @name_by_lang[hash['lang']] = hash['name']
        end
      end
    end

    def [](lang)
      @name_by_lang[lang]
    end
  end
end

=begin
Expected input:
[
  {
    "name": "els Abruços",
    "lang": "ca"
  },
  {
    "name": "Abruzzen",
    "lang": "de"
  },
  {
    "name": "Abruzzo",
    "lang": "en"
  },
  {
    "name": "Los Abruzos",
    "lang": "es"
  },
  {
    "name": "Abruzzes",
    "lang": "fr"
  },
  {
    "name": "Abruzzo",
    "lang": "it"
  },
  {
    "name": "http://en.wikipedia.org/wiki/Abruzzo",
    "lang": "link"
  },
  {
    "name": "Abruzzen",
    "lang": "nl"
  }
]
=end
