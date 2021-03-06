# Packaging

`citus_package` encapsulates complex packaging logic to ensure team members can easily build release, nightly, and custom packages for any Citus project on any supported OS. Under the hood, it's using [Docker][1] to guarantee some level of repeatability.

## Getting Started

`citus_package` requires `docker` v1.10 or greater.

`make install` to install the script and a man page. `man citus_package` for more details.

## Usage

Ensure your `GITHUB_TOKEN` environment variable is properly set (see the man page if you're not sure how to do that). Make sure Docker is running, then you're off to the races! For example, build a `citus` nightly on CentOS 7, Debian Jessie and Ubuntu Xenial like so: `citus_package -p el/7 -p debian/jessie -p ubuntu/xenial citus nightly`

[1]: https://www.docker.com
