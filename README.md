# Mico demo app

### Setup

```bash
bundle install
docker-compose build
cp config/secrets.yml.template config/secrets.yml
```

### Run

```bash
docker-compose up
```

After this, the web interface should be running on (http://localhost:3000)[http://localhost:3000] (might be different if you're on a Mac and using VirtualBox to run Docker.

### Reports

After you've started the docker instance, you can generate a report on the KPI by running: `bin/rake report:kpi`. The performance report is available under `bin/rake report:performance`.





### Mico configuration

At the moment the mico broker only supports one pipeline (classifier) active at a time. Go to:

http://demo1.mico-project.eu:8080/mico-configuration/

to switch between `animal-detection(image-blanks)` and `serengeti-ner(text)`. Stop all extractors first, then activate the one you need.

Then check that the correct pipeline is up:

http://demo1.mico-project.eu:8080/broker/
