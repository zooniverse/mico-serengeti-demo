class Entity
  ALL = [
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#animal-species", :type=>"Concept", :broader=>nil, :pref_label=>"Animal Species", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#aardvark", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"aardvark", :alt_labels=>["aardvarks", "anteater"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#aardwolf", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"aardwolf", :alt_labels=>["aardwolfs", "aardwolves"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#baboon", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"baboon", :alt_labels=>["baboons"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#bat", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"bat", :alt_labels=>["bats"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#bat-eared-fox", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"bat-eared fox", :alt_labels=>["bat-eared foxes"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#buffalo", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"buffalo", :alt_labels=>["buffalos"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#bushbuck", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"bushbuck", :alt_labels=>["bushbucks"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#caracal", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"caracal", :alt_labels=>["caracals"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#cattle", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"cattle", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#cheetah", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"cheetah", :alt_labels=>["cheetahs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#duiker", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"duiker", :alt_labels=>["duikers"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#eland", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"eland", :alt_labels=>["elands"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#elephant", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"elephant", :alt_labels=>["elephants"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#gazelle", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"gazelle", :alt_labels=>["gazelles", "grant's gazelle", "grants gazelle", "grants gazelles", "grant's gazelles", "thomson's gazelle", "thomson's gazelles", "thomsons gazelle", "thomsons gazelles"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#genet", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"genet", :alt_labels=>["genets"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#giraffe", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"giraffe", :alt_labels=>["giraffes"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#guinea-fowl", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"guinea fowl", :alt_labels=>["guineafowl", "guineafowls", "guinea fowls"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#hare", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"hare", :alt_labels=>["hares"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#honey-badger", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"honey badger", :alt_labels=>["honeybadger", "honey badgers", "honeybadgers"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#hyena", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"hyena", :alt_labels=>["hyenas", "spotted hyena", "spotted hyenas", "striped hyenas", "striped hyena"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#impala", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"impala", :alt_labels=>["impalas"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#insect", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"insect", :alt_labels=>["insects", "bug", "bugs", "beetle", "beetles", "mosquito", "mosquitos", "wasp", "wasps", "creepy-crawlies", "creepy-crawly", "fly", "flies"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#spider", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"spider", :alt_labels=>["spiders", "arachnid", "arachnids"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#jackal", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"jackal", :alt_labels=>["jackals"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#kori-bustard", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"kori bustard", :alt_labels=>["kori bustards", "bustard", "bustards"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#leopard", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"leopard", :alt_labels=>["leopards"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#lion", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"lion", :alt_labels=>["lions", "lioness", "lionesses"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#mongoose", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"mongoose", :alt_labels=>["mongooses", "mongeese"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#ostrich", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"ostrich", :alt_labels=>["ostriches", "ostrichs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#porcupine", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"porcupine", :alt_labels=>["porcupines"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#reedbuck", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"reedbuck", :alt_labels=>["reedbucks"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#reptile", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"reptile", :alt_labels=>["reptiles", "lizard", "lizards", "gecko", "geckos", "iguana", "iguanas", "tortoise", "tortoises", "snake", "snakes", "…."]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#rhinoceros", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"rhinoceros", :alt_labels=>["rhino", "rhinos", "rhinoceroses"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#rodent,-rodents", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"rodent, rodents", :alt_labels=>["rat", "rats", "mouse", "mice", "..."]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#secretary-bird", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"secretary bird", :alt_labels=>["secretary birds"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#serval", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"serval", :alt_labels=>["servals"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#steenbok", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"steenbok", :alt_labels=>["steenboks"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#topi", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"topi", :alt_labels=>["topis"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#vervet-monkey", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"vervet monkey", :alt_labels=>["vervet monkeys"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#vulture", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"vulture", :alt_labels=>["vultures"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#waterbuck", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"waterbuck", :alt_labels=>["waterbucks"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#wildcat", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"wildcat", :alt_labels=>["wild cat", "wildcats", "wild cats"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#wildebeest", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"wildebeest", :alt_labels=>["wildebeests"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#zebra", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"zebra", :alt_labels=>["zebras"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#zorilla", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"zorilla", :alt_labels=>["zorillas"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#human", :type=>"Concept", :broader=>"scv:animal-species", :pref_label=>"human", :alt_labels=>["humans", "people", "man", "woman", "men", "women", "guy", "dude", "girl", "lady", "guys", "dudes", "girls", "ladies"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#non-species-specific-or-untracked-animal-words", :type=>"Concept", :broader=>nil, :pref_label=>"Non-Species-Specific or Untracked Animal Words", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#animal", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"animal", :alt_labels=>["animals", "creature", "creatures"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#beast", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"beast", :alt_labels=>["beasts"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#cow", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"cow", :alt_labels=>["cows", "bull", "bulls"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#pig", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"pig", :alt_labels=>["pigs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#wolf", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"wolf", :alt_labels=>["wolves"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#fox", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"fox", :alt_labels=>["foxes", "foxs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#dog", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"dog", :alt_labels=>["dogs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#cat", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"cat", :alt_labels=>["cats", "feline", "felines"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#monkey", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"monkey", :alt_labels=>["monkeys", "chimpanzee", "chimpanzees"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#ape", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"ape", :alt_labels=>["apes", "gorillas", "gorilla"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#bird", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"bird", :alt_labels=>["birds", "owl", "pigeon", "kite", "eagle", "lark", "kestrel"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#rabbit", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"rabbit", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#badger", :type=>"Concept", :broader=>"scv:non-species-specific-or-untracked-animal-words", :pref_label=>"badger", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#animal-relations-or-groups", :type=>"Concept", :broader=>nil, :pref_label=>"Animal Relations or Groups", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#alpha", :type=>"Concept", :broader=>"scv:animal-relations-or-groups", :pref_label=>"alpha", :alt_labels=>["alphas"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#king", :type=>"Concept", :broader=>"scv:animal-relations-or-groups", :pref_label=>"king", :alt_labels=>["kings"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#queen", :type=>"Concept", :broader=>"scv:animal-relations-or-groups", :pref_label=>"queen", :alt_labels=>["queens"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#pride", :type=>"Concept", :broader=>"scv:animal-relations-or-groups", :pref_label=>"pride", :alt_labels=>["prides"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#cub", :type=>"Concept", :broader=>"scv:animal-relations-or-groups", :pref_label=>"cub", :alt_labels=>["cubs", "young", "baby", "babies", "child", "children"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#herd", :type=>"Concept", :broader=>"scv:animal-relations-or-groups", :pref_label=>"herd", :alt_labels=>["herds"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#the-task", :type=>"Concept", :broader=>nil, :pref_label=>"The Task", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#task", :type=>"Concept", :broader=>"scv:the-task", :pref_label=>"task", :alt_labels=>["tasks"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#subject", :type=>"Concept", :broader=>"scv:the-task", :pref_label=>"subject", :alt_labels=>["subjects"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#classification", :type=>"Concept", :broader=>"scv:the-task", :pref_label=>"classification", :alt_labels=>["classifications"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#challenge", :type=>"Concept", :broader=>"scv:the-task", :pref_label=>"challenge", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#puzzle", :type=>"Concept", :broader=>"scv:the-task", :pref_label=>"puzzle", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#effort", :type=>"Concept", :broader=>"scv:the-task", :pref_label=>"effort", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#the-image", :type=>"Concept", :broader=>nil, :pref_label=>"The Image", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#image", :type=>"Concept", :broader=>"scv:the-image", :pref_label=>"image", :alt_labels=>["images"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#photograph", :type=>"Concept", :broader=>"scv:the-image", :pref_label=>"photograph", :alt_labels=>["photographs", "photo", "photos", "shot", "shots", "compression", "JPG", "JPGs", "JPEG", "JPEGs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#picture", :type=>"Concept", :broader=>"scv:the-image", :pref_label=>"picture", :alt_labels=>["pictures"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#the-content-of-the-image", :type=>"Concept", :broader=>nil, :pref_label=>"The Content of The Image (As a Whole)", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#view", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"view", :alt_labels=>["views"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#scene", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"scene", :alt_labels=>["scenes"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#landscape", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"landscape", :alt_labels=>["landscapes"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#portrait", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"portrait", :alt_labels=>["portraits"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#moment", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"moment", :alt_labels=>["moments"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#capture", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"capture", :alt_labels=>["captures"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#vista", :type=>"Concept", :broader=>"scv:the-content-of-the-image", :pref_label=>"vista", :alt_labels=>["vista"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#natural-features-in-the-image", :type=>"Concept", :broader=>nil, :pref_label=>"Natural Features in the Image", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#scenery", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"scenery", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#cloud", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"cloud", :alt_labels=>["clouds"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#sky", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"sky", :alt_labels=>["skies"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#sun", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"sun", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#moon", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"moon", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#star", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"star", :alt_labels=>["stars"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#wilderness", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"wilderness", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#plain", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"plain", :alt_labels=>["plains"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#savannah", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"savannah", :alt_labels=>["savanna", "savannas", "savannahs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#tree", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"tree", :alt_labels=>["trees", "forest", "forests", "wood", "woods"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#shrub", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"shrub", :alt_labels=>["shrubs", "plant", "plants", "shrubbery", "undergrowth"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#grass", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"grass", :alt_labels=>["grasses", "grassland", "scrub", "bush", "foliage", "leaves"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#rock", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"rock", :alt_labels=>["rocks", "stone", "stones", "cliff", "cliffs", "outcrop", "outcrops", "ledge", "ledges"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#mountain", :type=>"Concept", :broader=>"scv:natural-features-in-the-image", :pref_label=>"mountain", :alt_labels=>["mountains", "mountain range", "mountain ranges", "peak", "peaks"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#lighting-and-time", :type=>"Concept", :broader=>nil, :pref_label=>"Lighting and Time", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#day", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"day", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#night", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"night", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#sunset", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"sunset", :alt_labels=>["sunsets"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#sunrise", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"sunrise", :alt_labels=>["sunrise"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#dark", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"dark", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#light", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"light", :alt_labels=>["bright", "brightness", "dazzle", "dazzling", "golden hour"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#shadow", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"shadow", :alt_labels=>["shade", "shadows"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#evening", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"evening", :alt_labels=>["dusk", "twilight"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#morning", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"morning", :alt_labels=>["dawn"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#noon", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"noon", :alt_labels=>["midday"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#midnight", :type=>"Concept", :broader=>"scv:lighting-and-time", :pref_label=>"midnight", :alt_labels=>["middle of the night"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#uncertain-but-defined-objects", :type=>"Concept", :broader=>nil, :pref_label=>"Uncertain but defined objects", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#something", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"something", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#object", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"object", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#thing", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"thing", :alt_labels=>["things"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#blob", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"blob", :alt_labels=>["blobs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#mound", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"mound", :alt_labels=>["mounds"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#lump", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"lump", :alt_labels=>["lumps"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#spot", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"spot", :alt_labels=>["spots"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#bulge", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"bulge", :alt_labels=>["bulges"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#dot", :type=>"Concept", :broader=>"scv:uncertain-but-defined-objects", :pref_label=>"dot", :alt_labels=>["dots"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#man-made-objects-and-vehicles", :type=>"Concept", :broader=>nil, :pref_label=>"Man Made Objects & Vehicles", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#car", :type=>"Concept", :broader=>"scv:man-made-objects-and-vehicles", :pref_label=>"car", :alt_labels=>["cars", "motorcar", "automobile", "landrover", "land rover", "jeep", "jeeps", "SUV", "4WD", "4WDs", "SUVs"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#camera", :type=>"Concept", :broader=>"scv:man-made-objects-and-vehicles", :pref_label=>"camera", :alt_labels=>["cameras", "camera trap", "focus", "shutter", "exposure", "lens", "lens flare"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#film", :type=>"Concept", :broader=>"scv:man-made-objects-and-vehicles", :pref_label=>"film", :alt_labels=>["films", "SD card", "SD cards"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#battery", :type=>"Concept", :broader=>"scv:man-made-objects-and-vehicles", :pref_label=>"battery", :alt_labels=>["batteries"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#human-activity", :type=>"Concept", :broader=>nil, :pref_label=>"Human Activity", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#tribe", :type=>"Concept", :broader=>"scv:human-activity", :pref_label=>"tribe", :alt_labels=>["Masai", "Maasai", "tribal", "tribes"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#shepherd", :type=>"Concept", :broader=>"scv:human-activity", :pref_label=>"shepherd", :alt_labels=>["shepherds", "farmer", "farmers", "farming", "rancher", "ranchers", "herder", "herders"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#damage", :type=>"Concept", :broader=>"scv:human-activity", :pref_label=>"damage", :alt_labels=>["damaged", "broken", "trashed", "destroyed"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#theft", :type=>"Concept", :broader=>"scv:human-activity", :pref_label=>"theft", :alt_labels=>["steal", "stolen", "stealing"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#vandalism", :type=>"Concept", :broader=>"scv:human-activity", :pref_label=>"vandalism", :alt_labels=>["vandalise", "vandalize", "vandalised", "vandalized"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#natural-activity", :type=>"Concept", :broader=>nil, :pref_label=>"Natural Activity", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#weather", :type=>"Concept", :broader=>"scv:natural-activity", :pref_label=>"weather", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#storm", :type=>"Concept", :broader=>"scv:natural-activity", :pref_label=>"storm", :alt_labels=>["storms"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#lightning", :type=>"Concept", :broader=>"scv:natural-activity", :pref_label=>"lightning", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#fire", :type=>"Concept", :broader=>"scv:natural-activity", :pref_label=>"fire", :alt_labels=>["bushfire", "wildfire", "fires", "wildfires", "bushfires"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#others", :type=>"Concept", :broader=>nil, :pref_label=>"Other properties that could be of interest", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#colour", :type=>"Concept", :broader=>"scv:others", :pref_label=>"colour", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#size", :type=>"Concept", :broader=>"scv:others", :pref_label=>"size", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#clarity", :type=>"Concept", :broader=>"scv:others", :pref_label=>"clarity", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#occlusion-(obscured-etc)", :type=>"Concept", :broader=>"scv:others", :pref_label=>"occlusion", :alt_labels=>["obscured"]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#quantity", :type=>"Concept", :broader=>"scv:others", :pref_label=>"quantity", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#visibility-(dark/shadow/distance-etc)", :type=>"Concept", :broader=>"scv:others", :pref_label=>"visibility", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#movement", :type=>"Concept", :broader=>"scv:others", :pref_label=>"movement", :alt_labels=>[]}
    {:uri=>"http://www.mico-project.eu/ns/cv/serengeti#interactions", :type=>"Concept", :broader=>"scv:others", :pref_label=>"interactions", :alt_labels=>[]}
  ]
end
