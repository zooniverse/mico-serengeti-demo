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
      JSON.parse '{"' + decodeURI(search).replace(/\"/g, '\\"').replace(/&/g, '","').replace(/\=/g, '":"') + '"}'
    else
      {}

  setFormFiltersFromQueryParts: (query_parts) =>
    @form_filters = {}
    for query_field, val of query_parts
      input_id = @getInputIdFromQueryField(query_field)
      @setFilter(input_id, val, false)
    @updateQueryParts()

  isRange: (val) =>
    val? && !!~val.toString().indexOf "-"

  isMin: (val) =>
    val? && !!~val.toString().indexOf "+"

  isExact: (val) =>
    val? && !@isRange(val) && !@isMin(val)

  setFilter: (input_id, val, update_query_parts = true) =>
    if (input_id == "drop-comment-status")
      if val == "has_no_data"
        @form_filters[input_id + "-has-no-data"] = val
      else if val == "has_data"
        @form_filters[input_id + "-has-data"] = val
      else if val == "unprocessed"
        @form_filters[input_id + "-unprocessed"] = val
      else
        @form_filters["drop-comment-status"] = val
    else if (input_id == "drop-status")
      if val == "unprocessed"
        @form_filters[input_id + "-unprocessed"] = val
      else
        @form_filters[input_id] = val
    else if @isMin(val)
      @form_filters[input_id + "-min"] = val.replace(/\+/g, '')
    else if @isRange(val)
      min_and_max = val.split "-"
      min = min_and_max[0]
      max = min_and_max[1]
      @form_filters[input_id + "-min"] = min
      @form_filters[input_id + "-max"] = max
    else if (input_id == "drop-dataset")
      @form_filters[input_id + "-" + val] = true
    else
      @form_filters[input_id] = val
    if update_query_parts
      @updateQueryParts()

  getCommentAnalysisDisplayTextFromStatus: (comment_status) =>
    switch comment_status
      when "has_no_data" then "No comment analysis data stored"
      when "has_data" then "Has comment analysis data stored"
      when "unprocessed" then "Comments not yet analysed"
      when "finished" then "Comments successfully analysed"
      when "submitting" then "Comments being processed"
      when "failed" then "Comment analysis failed"
      else
        "Comment analysis unclear"

  getImageAnalysisDisplayTextFromStatus: (status) =>
    switch status
      when "unprocessed" then "Image not yet analysed"
      when "finished" then "Image successfully analysed"
      when "submitting" then "Image being processed"
      when "failed" then "Image analysis failed"
      when "zfailed" then "Image analysis failed (old)"
      else
        "Image analysis unclear"

  getInputIdFromQueryField: (query_field) =>
    switch query_field
      when "status" then "drop-status"
      when "status_unprocessed" then "drop-status-unprocessed"
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
      when "species" then "drop-species"
      when "comment_status" then "drop-comment-status"
      when "comment_status_unprocessed" then "drop-comment-status-unprocessed"
      when "has_comment_analysis_data" then "drop-comment-status-has-data"
      when "has_no_comment_analysis_data" then "drop-comment-status-has-no-data"
      when "vr1_entire_dataset" then "drop-dataset-vr1_entire_dataset"
      when "vr1_daytime" then "drop-dataset-vr1_daytime"
      when "vr1_nighttime" then "drop-dataset-vr1_nighttime"
      when "vr1_blank" then "drop-dataset-vr1_blank"
      when "vr1_non_blank" then "drop-dataset-vr1_non_blank"
      when "vr1_one_animal" then "drop-dataset-vr1_one_animal"
      when "vr1_simple" then "drop-dataset-vr1_simple"
      when "vr1_complex" then "drop-dataset-vr1_complex"
      when "vr1_single_species" then "drop-dataset-vr1_single_species"
      when "vr1_only_buffalo" then "drop-dataset-vr1_only_buffalo"
      when "vr1_only_elephant" then "drop-dataset-vr1_only_elephant"
      when "vr1_only_ostrich" then "drop-dataset-vr1_only_ostrich"
      when "vr1_only_warthog" then "drop-dataset-vr1_only_warthog"
      when "vr1_only_wildebeest" then "drop-dataset-vr1_only_wildebeest"
      when "vr1_only_other" then "drop-dataset-vr1_only_other"
      when "vr1_multi_species" then "drop-dataset-vr1_multi_species"
      when "vr1_multi_including_buffalo" then "drop-dataset-vr1_multi_including_buffalo"
      when "vr1_multi_including_elephant" then "drop-dataset-vr1_multi_including_elephant"
      when "vr1_multi_including_ostrich" then "drop-dataset-vr1_multi_including_ostrich"
      when "vr1_multi_including_warthog" then "drop-dataset-vr1_multi_including_warthog"
      when "vr1_multi_including_wildebeest" then "drop-dataset-vr1_multi_including_wildebeest"
      when "vr1_multi_including_none_of_the_five" then "drop-dataset-vr1_multi_including_none_of_the_five"


  getQueryFieldFromModifiedInputId: (input_id) =>
    switch input_id
      when "drop-light" then "light"
      when "drop-roll-code" then "roll_id"
      when "drop-site-id" then "site_id"
      when "drop-number-of-comments" then "number_of_comments"
      when "drop-number-of-comments-min" then "number_of_comments_min"
      when "drop-number-of-comments-max" then "number_of_comments_max"
      when "drop-regions" then "number_of_regions"
      when "drop-regions-min" then "number_of_regions_min"
      when "drop-regions-max" then "number_of_regions_max"
      when "drop-total-animals" then "total_animals"
      when "drop-total-animals-min" then "total_animals_min"
      when "drop-total-animals-max" then "total_animals_max"
      when "drop-total-species" then "total_species"
      when "drop-total-species-min" then "total_species_min"
      when "drop-total-species-max" then "total_species_max"
      when "drop-status" then "status"
      when "drop-status-unprocessed" then "status_unprocessed"
      when "drop-comment-status" then "comment_status"
      when "drop-comment-status-unprocessed" then "comment_status_unprocessed"
      when "drop-comment-status-has-data" then "has_comment_analysis_data"
      when "drop-comment-status-has-no-data" then "has_no_comment_analysis_data"
      when "drop-species" then "species"
      when "drop-dataset-vr1_entire_dataset" then "vr1_entire_dataset"
      when "drop-dataset-vr1_daytime" then "vr1_daytime"
      when "drop-dataset-vr1_nighttime" then "vr1_nighttime"
      when "drop-dataset-vr1_blank" then "vr1_blank"
      when "drop-dataset-vr1_non_blank" then "vr1_non_blank"
      when "drop-dataset-vr1_one_animal" then "vr1_one_animal"
      when "drop-dataset-vr1_simple" then "vr1_simple"
      when "drop-dataset-vr1_complex" then "vr1_complex"
      when "drop-dataset-vr1_single_species" then "vr1_single_species"
      when "drop-dataset-vr1_only_buffalo" then "vr1_only_buffalo"
      when "drop-dataset-vr1_only_elephant" then "vr1_only_elephant"
      when "drop-dataset-vr1_only_ostrich" then "vr1_only_ostrich"
      when "drop-dataset-vr1_only_warthog" then "vr1_only_warthog"
      when "drop-dataset-vr1_only_wildebeest" then "vr1_only_wildebeest"
      when "drop-dataset-vr1_only_other" then "vr1_only_other"
      when "drop-dataset-vr1_multi_species" then "vr1_multi_species"
      when "drop-dataset-vr1_multi_including_buffalo" then "vr1_multi_including_buffalo"
      when "drop-dataset-vr1_multi_including_elephant" then "vr1_multi_including_elephant"
      when "drop-dataset-vr1_multi_including_ostrich" then "vr1_multi_including_ostrich"
      when "drop-dataset-vr1_multi_including_warthog" then "vr1_multi_including_warthog"
      when "drop-dataset-vr1_multi_including_wildebeest" then "vr1_multi_including_wildebeest"
      when "drop-dataset-vr1_multi_including_none_of_the_five" then "vr1_multi_including_none_of_the_five"



  pluralize: (number, singular, plural) ->
    if number > 1 or number is 0 then plural else singular

# update query parts from raw form inputs
  updateQueryParts: () =>
    @query_parts = {}
    for input_id, val of @form_filters
      @query_parts[@getQueryFieldFromModifiedInputId(input_id)] = val

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
      "guineafowl"
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
      when "status", "dataset", "number_of_regions", "number_of_regions_max", "number_of_regions_min", "entities", "comment_status", "comment_status_unprocessed", "has_no_comment_analysis_data", "has_comment_analysis_data"
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
      when "total_animals_min" then val + " or more animals present"
      when "total_animals_max" then val + " or fewer animals present"
      when "site_id" then "site " + val
      when "roll_id" then "roll " + val
      when "light" then "taken during the " + val
      when "has_no_comment_analysis_data" then @getCommentAnalysisDisplayTextFromStatus val
      when "has_comment_analysis_data" then @getCommentAnalysisDisplayTextFromStatus val
      when "comment_status" then @getCommentAnalysisDisplayTextFromStatus val
      when "comment_status_unprocessed" then @getCommentAnalysisDisplayTextFromStatus val
      when "status" then @getImageAnalysisDisplayTextFromStatus val
      when "status_unprocessed" then @getImageAnalysisDisplayTextFromStatus val
      when "vr1_entire_dataset" then "Entire dataset"
      when "vr1_daytime" then "Daytime"
      when "vr1_nighttime" then "Nighttime"
      when "vr1_blank" then "Blank"
      when "vr1_non_blank" then "Non-blank"
      when "vr1_one_animal" then "One animal"
      when "vr1_simple" then "Simple (2-5 animals)"
      when "vr1_complex" then "Complex (6+ animals)"
      when "vr1_single_species" then "Single species"
      when "vr1_only_buffalo" then "Only buffalo"
      when "vr1_only_elephant" then "Only elephants"
      when "vr1_only_ostrich" then "Only ostriches"
      when "vr1_only_warthog" then "Only warthogs"
      when "vr1_only_wildebeest" then "Only wildebeest"
      when "vr1_only_other" then "Only a single species, not listed above"
      when "vr1_multi_species" then "Multiple species"
      when "vr1_multi_including_buffalo" then "Multiple species, including buffalo"
      when "vr1_multi_including_elephant" then "Multiple species, including elephants"
      when "vr1_multi_including_ostrich" then "Multiple species, including ostriches"
      when "vr1_multi_including_warthog" then "Multiple species, including warthogs"
      when "vr1_multi_including_wildebeest" then "Multiple species, including wildebeest"
      when "vr1_multi_including_none_of_the_five" then "Multiple species, including none of the above"
      else query_field

  getURLQueryString: =>
    @updateQueryParts()
    query_string = ""
    for query_field, val of @query_parts
      if query_string.length > 0
        query_string += "&"
      query_string += query_field + "=" + val
    "?" + query_string

  getFilterDrawerHTML: =>
    @updateQueryParts()
    html = ""
    if @isFiltered()
      for query_field, val of @query_parts
        html += "<span data-query-field='" + query_field + "' class='filter-pill " + @getFilterClass(query_field) + "'>"
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
    delete @form_filters[input_id]
    @updateQueryParts()
    if typeof renderCallback == "function"
      renderCallback(renderCallbackParameter)
