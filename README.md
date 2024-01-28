# Anity Jobs

Anity Job is a job posting platform specifically designed for the African market. It helps job seekers find employment opportunities in Africa, and it also assists employers in finding qualified candidates for their open positions. With its user-friendly interface and extensive database of job listings, Anity makes it easy for job seekers to find the right job in their field and for employers to connect with top talent. Whether you are looking for a new job or seeking to hire qualified professionals, Anity is the go-to platform for finding employment opportunities in Africa.

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


