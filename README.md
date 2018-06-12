# GraalVM-Java-Docker

> Example creating native image of java app with GraalVM Gradle and
> Docker

**First create the image :**

	docker build -t graalvm-demo .
**Then run it :**

    docker run -p 4567:4567 graalvm-demo
**Finally go to :**
[http://localhost:4567/hello](http://localhost:4567/hello)

*Take a look at build.gradle and Dockerfile to find out how it works.
Credit : https://zeringue.io/post/graalvm-gradle-docker/*
