# Mico demo app

### Setup

```bash
bundle install
docker-compose build
```

### Run

```bash
docker-compose up
open "http://192.168.99.100:3000"
```

### Mico configuration

At the moment the mico broker only supports one pipeline (classifier) active at a time. Go to:

http://demo1.mico-project.eu:8080/mico-configuration/

to switch between `animal-detection(image-blanks)` and `serengeti-ner(text)`. Stop all extractors first, then activate the one you need.

Then check that the correct pipeline is up:

http://demo1.mico-project.eu:8080/broker/
