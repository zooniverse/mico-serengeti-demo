# Mico demo app

### Setup

```bash
bundle install
docker-compose build
cp config/secrets.yml.template config/secrets.yml
```
Make sure to set your `MICO_API_USERNAME` and `MICO_API_PASSWORD` variables in your .bash_profile (then restart shell or `source ~/.bash_profile`). Also set the username and password in the secrets.yml file (or change `SETME` to `<%= ENV["MICO_API_USERNAME"] %>` and `<%= ENV["MICO_API_PASSWORD"] %>`).

### Run

```bash
docker-compose up
```

Or if starting manually without docker
```bash
rails s webrick
```
to start the web server,
and
```bash
bin/rake que:work
```
to start the queue worker.

After this, the web interface should be running on [http://localhost:3000](http://localhost:3000) (might be different if you're on a Mac and using VirtualBox to run Docker).

### Reports

After you've started the docker instance, you can generate a report on the KPI by running: `bin/rake report:kpi`. The performance report is available under `bin/rake report:performance`.

### Mico configuration

At the moment the mico broker only supports one pipeline (classifier) active at a time. Go to:

http://demo1.mico-project.eu:8080/mico-configuration/

to switch between `animal-detection(image-blanks)` and `serengeti-ner(text)`. Stop all extractors first, then activate the one you need.

Then check that the correct pipeline is up:

http://demo1.mico-project.eu:8080/broker/
