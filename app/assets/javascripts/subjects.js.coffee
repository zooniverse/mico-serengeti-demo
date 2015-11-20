# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class window.FilterManager

  constructor: (query_string) ->
    query_string_parts = @getQueryPartsFromQueryString(query_string)
    @setFormFiltersFromQueryParts(query_string_parts)

  getQueryPartsFromQueryString: (queryString) =>
    search = queryString.substring(1);
    if search != ""
      JSON.parse '{"' + decodeURI(search).replace(/\"/g, '\\"').replace(/&/g, '","').replace(/\=/g,'":"') + '"}'
    else
      {}

  setFormFiltersFromQueryParts: (query_parts) =>
    @form_filters = {}
    for query_field, val of query_parts
      input_id = "drop-" + query_field.replace /\_/g,"-"
      @setFilter(input_id,val,false)
    @updateQueryParts()

  isRange: (val) =>
    val? && !!~val.toString().indexOf "-"

  isMin: (val) =>
    val? && !!~val.toString().indexOf "+"

  isExact: (val) =>
    val? && !@isRange(val) && !@isMin(val)

  setFilter: (input_id, val, update_query_parts=true) =>
    if @isMin(val)
      @form_filters[input_id+"-min"] = val.replace(/\+/g, '')
    else if @isRange(val)
      min_and_max = val.split "-"
      min = min_and_max[0]
      max = min_and_max[1]
      @form_filters[input_id+"-min"] = min
      @form_filters[input_id+"-max"] = max
    else
      @form_filters[input_id] = val
    if update_query_parts
      @updateQueryParts()

  getImageAnalysisDisplayTextFromStatus: (status) =>
    switch status
      when "unprocessed" then "Image not yet analysed"
      when "finished" then "Image successfully analysed"
      when "submitted" then "Image being processed"
      when "failed" then "Image analysis failed"
      when "zfailed" then "Image analysis failed (old)"
      else
        "Image analysis unclear"

  getInputIdFromQueryField: (query_field) =>
    switch query_field
      when "status" then "drop-status"
      when "dataset" then "drop-dataset"
      when "entity" then "drop-entity"
      when "light" then "drop-light"
      when "roll_id" then "drop-roll-code"
      when "site_id" then "drop-site-id"
      when "number_of_regions" then "drop-regions"
      when "number_of_regions_min" then "drop-regions-min"
      when "number_of_regions_max" then "drop-regions-max"
      when "total_species" then "drop-total-species"
      when "total_species_min" then "drop-total-species-min"
      when "total_species_max" then "drop-total-species-max"
      when "total_animals" then "drop-total-animals"
      when "total_animals_min" then "drop-total-animals-min"
      when "total_animals_max" then "drop-total-animals-max"
      when "number_of_comments" then "drop-number-of-comments"
      when "number_of_comments_min" then "drop-number-of-comments-min"
      when "number_of_comments_max" then "drop-number-of-comments-max"
        
  getQueryFieldFromModifiedInputId: (input_id) =>
    switch input_id
      when "drop-light" then "light"
      when "drop-roll-code" then "roll_id"
      when "drop-site-id" then "site_id"
      when "drop-number-of-comments" then "number_of_comments"
      when "drop-number-of-comments-min" then "number_of_comments_min"
      when "drop-number-of-comments-max" then "number_of_comments_max"
      when "drop-number-of-regions" then "number_of_regions"
      when "drop-number-of-regions-min" then "number_of_regions_min"
      when "drop-number-of-regions-max" then "number_of_regions_max"
      when "drop-total-animals" then "total_animals"
      when "drop-total-animals-min" then "total_animals_min"
      when "drop-total-animals-max" then "total_animals_max"
      when "drop-total-species" then "total_species"
      when "drop-total-species-min" then "total_species_min"
      when "drop-total-species-max" then "total_species_max"
      when "drop-status" then "status"
      when "drop-species" then "species"

  pluralize: (number, singular, plural) ->
    if number > 1 or number is 0 then plural else singular        
        
  # update query parts from raw form inputs
  updateQueryParts: () =>
    @query_parts = {}
    for input_id, val of @form_filters
      switch input_id
        when "drop-light"
          @query_parts["light"] = val
        when "drop-roll-code"
          @query_parts["roll_id"] = val
        when "drop-site-id"
          @query_parts["site_id"] = val
        when "drop-number-of-comments"
          @query_parts["number_of_comments"] = val
        when "drop-number-of-comments-min"
          @query_parts["number_of_comments_min"] = val
        when "drop-number-of-comments-max"
          @query_parts["number_of_comments_max"] = val
        when "drop-total-species"
          @query_parts["total_species"] = val
        when "drop-total-species-min"
          @query_parts["total_species_min"] = val
        when "drop-total-species-max"
          @query_parts["total_species_max"] = val
        when "drop-total-animals"
          @query_parts["total_animals"] = val
        when "drop-total-animals-min"
          @query_parts["total_animals_min"] = val
        when "drop-total-animals-max"
          @query_parts["total_animals_max"] = val
        when "drop-regions"
          @query_parts["number_of_regions"] = val
        when "drop-regions-min"
          @query_parts["number_of_regions_min"] = val
        when "drop-regions-max"
          @query_parts["number_of_regions_max"] = val
        when "drop-status"
          @query_parts["status"] = val
        when "drop-species"
          @query_parts["species"] = val

  getHumanFriendlySpecies: (species, count = 2) ->
    if species in ['wildebeest', 'buffalo', 'impala', 'hartebeest', 'topi']
      species
    else if species in ['elephant', 'warthog', 'reedbuck', 'human', 'giraffe', 'waterbuck',
                        'aardvark', 'bushbuck', 'cheetah', 'baboon', 'jackal', 'serval',
                        'bat', 'caracal', 'civet', 'duiker', 'genet', 'hare', 'leopard',
                        'mongoose', 'porcupine', 'steenbok', 'eland', 'vulture', 'wildcat',
                        'zorilla', 'zebra']
      @pluralize(count, species, species + 's')
    else if species in ['hippopotamus', 'rhinoceros', 'ostrich']
      @pluralize(count, species, species + 'es')
    else if species is 'cattle'
      @pluralize(count, 'cow', 'cattle')
    else if species in ['reptiles', 'rodents']
      @pluralize(count, species.slice(0, -1), species)
    else if species is 'gazellethomsons'
      @pluralize(count, "Thomson's gazelle", "Thomson's gazelles")
    else if species is 'gazellegrants'
      @pluralize(count, "Grant's gazelle", "Grant's gazelles")
    else if species is 'otherbird'
      @pluralize(count, "bird (other)", "birds (other)")
    else if species is 'dikdik'
      @pluralize(count, "dik-dik", "dik-diks")
    else if species is 'honeybadger'
      @pluralize(count, "honey badger", "honey badgers")
    else if species is 'hyenaspotted'
      "spotted hyena"
    else if species is 'hyenastriped'
      "striped hyena"
    else if species is 'lionfemale'
      @pluralize(count, "female lion", "female lions")
    else if species is 'lionmale'
      @pluralize(count, "male lion", "male lions")
    else if species is 'guineafowl'
      "guinea fowl"
    else if species is 'koribustard'
      @pluralize(count, "kori bustard", "kori bustards")
    else if species is 'batearedfox'
      @pluralize(count, "bat-eared fox", "bat-eared foxes")
    else if species is 'aardwolf'
      @pluralize(count, "aardwolf", "aardwolves")
    else if species is 'secretarybird'
      @pluralize(count, "secretary bird", "secretary birds")
    else if species is 'insectspider'
      @pluralize(count, "spider or insect", "spiders or insects")
    else if species is 'vervetmonkey'
      @pluralize(count, "vervet monkey", "vervet monkeys")
    else if species is 'blank'
      'blank'
    else
      @pluralize(count, species, species + 's')

  getFilterClass: (query_field) =>
    switch query_field
      when "status", "dataset", "number_of_regions", "number_of_regions_max","number_of_regions_min","entities"
        "mico-filter"
      else
        "zoo-filter"

  getFilterDisplayText: (query_field, val) =>
    switch query_field
      when "species"
        if val == "blank"
          "blank (no animals present)"
        else if val == "multi"
          "multiple species present"
        else
          "1 or more " + @getHumanFriendlySpecies(val) + " present"
      when "number_of_regions"
        if val == 1
          "exactly 1 animal found"
        else
          "exactly " + val + " animals found"
      when "number_of_regions_min" then val + " or more animals found"
      when "number_of_regions_max" then val + " or fewer animals found"
      when "number_of_comments" then "exactly " + val + " comments present"
      when "number_of_comments_min" then val + " or more comments present"
      when "number_of_comments_max" then val + " or fewer comments present"
      when "total_species" then "exactly " + val + " species present"
      when "total_species_min" then val + " or more species present"
      when "total_species_max" then val + " or fewer species present"
      when "total_animals"
        if val == 1
          "exactly 1 animal present"
        else
          "exactly " + val + " animals present"
      when "total_animals_min" then val + " or more species present"
      when "total_animals_max" then val + " or fewer species present"
      when "site_id" then "site " + val
      when "roll_id" then "roll " + val
      when "light" then "taken during the " + val
      when "status" then @getImageAnalysisDisplayTextFromStatus val

  getURLQueryString: =>
    @updateQueryParts()
    query_string = ""
    for query_field,val of @query_parts
      if query_string.length > 0
        query_string += "&"
      query_string += query_field + "=" + val
    "?" + query_string

  getFilterDrawerHTML: =>
    @updateQueryParts()
    html = ""
    if @isFiltered()
      for query_field, val of @query_parts
        html += "<span data-query-field='"+ query_field + "' class='filter-pill " + @getFilterClass(query_field) + "'>"
        html += @getFilterDisplayText(query_field, val)
        html += "</span>"
    else
      html = '<span class="no-filters">No filters currently applied.</span>'
    html

  isFiltered: =>
    !!(Object.keys(@form_filters).length > 0)

  removeAllFilters: (renderCallback, renderCallbackParameter) =>
    @form_filters = {}
    @updateQueryParts()
    if typeof renderCallback == "function"
      renderCallback(renderCallbackParameter)

  # remove a filter for a field (which may have been modified with -min or -max on the end)
  removeFilterByQueryField: (query_field, renderCallback, renderCallbackParameter) =>
    input_id = @getInputIdFromQueryField(query_field)
    console.log @form_filters
    console.log "removing "+input_id
    delete @form_filters[input_id]
    console.log @form_filters
    @updateQueryParts()
    if typeof renderCallback == "function"
      renderCallback(renderCallbackParameter)