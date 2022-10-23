# The Job posting platform for Africa.

# Anity Jobs

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using:

    % .bin/dev

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
## Configuration

Environment variables during local development are handled by the node-foreman
project runner. To provide environment variables, create a `.env` file at the
root of the project. In that file provide the environment variables listed in
`.sample.env`. The `bin/setup` script does this for you, but be careful about
overwriting your existing `.env` file.

`app.json` also contains a list of environment variables that are required for
the application. The `.sample.env` file provides either non-secret vars that
can be copied directly into your own `.env` file or instructions on where to
obtain secret values.

During development add any new environment variables needed by the application
to both `.sample.env` and `app.json`, providing either **public** default
values or brief instructions on where secret values may be found.

Do not commit the `.env` file to the git repo.

## Running the Application

```sh
heroku local
```

Once the server is started the application is reachable at
`http://localhost:3000`.


## Profiler


The [rack-mini-profiler] gem can be enabled by setting
`RACK_MINI_PROFILER=1` in the environment. This will display a speed
badge on every page.

[rack-mini-profiler]: https://github.com/MiniProfiler/rack-mini-profiler

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    % ./bin/deploy staging
    % ./bin/deploy production

