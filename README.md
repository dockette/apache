<h1 align=center>Dockette / Apache</h1>

<p align=center>
   <a href="https://github.com/dockette/apache/actions"><img src="https://github.com/dockette/apache/actions/workflows/docker.yml/badge.svg" alt="GitHub Actions"></a>
   <a href="https://hub.docker.com/r/dockette/apache"><img src="https://img.shields.io/docker/pulls/dockette/apache.svg" alt="Docker Hub pulls"></a>
   <a href="https://github.com/sponsors/f3l1x"><img src="https://img.shields.io/badge/sponsor-GitHub%20Sponsors-ea4aaa" alt="GitHub Sponsors"></a>
   <a href="https://github.com/orgs/dockette/discussions"><img src="https://img.shields.io/badge/support-discussions-6f42c1" alt="Support/Discussions"></a>
</p>

<p align=center>
   Ready-to-use Apache (httpd) Docker image based on Debian Jessie.
</p>

-----

## Usage

### Simple

```
docker run --rm -p 8080:80 -v /path/to/site:/srv dockette/apache
```

This mirrors `make run`: it publishes Apache on <http://localhost:8080> and mounts your site files to `/srv`. The image removes Debian's default site, so mount an Apache vhost when you need Apache to serve `/srv`.

### Sites

```
docker run \
	-p 8080:80 \
	-v /path/to/site:/srv \
	-v /path/to/mysite.conf:/etc/apache2/sites-enabled/mysite.conf \
	dockette/apache
```

Use a real host path for `mysite.conf`; the container path enables that vhost inside Apache.

## Legacy Constraints

This image uses the legacy `dockette/jessie` Debian Jessie base image. Keep runtime changes conservative, and verify package availability before changing the Apache installation or base image assumptions.

## Maintenance

See [how to contribute](https://github.com/dockette/.github/blob/master/CONTRIBUTING.md) to this package. Consider to [support](https://github.com/sponsors/f3l1x) **f3l1x**. Thank you for using this package.
