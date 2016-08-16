Docker Jenkins Slave: Docker
============================

Docker Image packaging for a Jenkins Slave capable of running Docker containers. This image is
built on top of [seeruk/jenkins-slave][1], and is available on the [Docker Hub][2].

Usage
-----

See usage for [seeruk/jenkins-slave][1].

For Docker to function correctly you'll need to mount the Docker Socket into this container. Given
that this is the case, it's recommended that you ensure your Jenkins instance is properly secured,
as it will need to be mounted `rw`.

Also, if you plan on volume mounting the slave workspace, when configuring the slave workspace via
the `SLAVE_WORKSPACE` environment variable you should set the path in the container to be exactly
the same as where the workspace will be on the host. This is because the Docker containers started
by this container will be run as sibling containers on the host, so paths should match. The same may
apply to the home directory.

```
$ docker run -v /var/run/docker.sock:/var/run/docker.sock ...
```

License
-------

MIT

Contributing
------------

Feel free to open a [pull request][3], or file an [issue][4] on Github. I always welcome
contributions as long as they're for the benefit of all (potential) users of this image.

If you're unsure about anything, feel free to ask about it in an issue before you get your heart
set on fixing it yourself.

[1]: https://hub.docker.com/r/seeruk/jenkins-slave
[2]: https://hub.docker.com/r/seeruk/jenkins-slave-docker
[3]: https://github.com/SeerUK/docker-jenkins-slave-docker/pulls
[4]: https://github.com/SeerUK/docker-jenkins-slave-docker/issues
