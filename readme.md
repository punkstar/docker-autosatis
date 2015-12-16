#Autosatis

A dockerised, self hosted, self updating satis repository.

This project allows teams to run private composer repositories by running a container that will poll a git repostiory containing their satis configuration file every minute and automatically rebuilding.

#Configuration

The configuration of the container is driven of environment variables, there are a number to configure, all of which are required:

* *VIRTUAL_HOST* - The domain name that the service is hosted under. Works great with [jwilder/nginx-proxy](https://github.com/jwilder/nginx-proxy)
* *API_KEYS* - A comma delimited list of valid API keys for accessing the service.
* *REPO_HOST* - The domain name of the git repository containing your satis configuration, e.g. `bitbucket.org` or `github.com`
* *REPO_URL* - The full URL used to access your git repository, e.g. `git@bitbucket.org:your-company/satis.git`
* *REPO_PRIVATE_KEY* - The private key that should be used to access your git repository, see the example for how to format multiline YAML values.

#Example

An example using a `docker-compose.yml` file follows:

satis:
  image: punkstar/autosatis
  ports:
    - 80
  environment:
    VIRTUAL_HOST: satis.docker
    REPO_HOST: bitbucket.org
    REPO_URL: git@bitbucket.org:your-company/satis.git
    API_KEYS: mykey,yourkey,everyoneskey
    REPO_PRIVATE_KEY: |
      -----BEGIN RSA PRIVATE KEY-----
      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
      -----END RSA PRIVATE KEY-----
