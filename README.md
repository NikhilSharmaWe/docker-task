# Containers

We will be talking a lot about containers, Kubernetes throughout the training. This module will help you get started with containers using Docker, we will also understand how they work.

##### Ideas for conducting this workshop
- The SREs doing this workshop might have tried few of the following things / basics as part of their interview process, so we can consider pairing SREs with SEs. They will help each other with doubts.
- After every set of hands-on lab, there are things to discuss, and questions to answer.
- Instructor can start with a small introduction about containers, we don't need to spend much time here, as the attendees would have got the basic idea about containers in "A noob's introduction to Kubernetes" session.

### Prerequisites
- Create Docker ID (account on docker.com) https://hub.docker.com/signup
- Install Docker Engine on the machine [Install Docker Engine on Ubuntu](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository).
- Watch the video [What are containers, how do they work and how are they different from container runtimes (Docker)?](https://www.youtube.com/watch?v=7t_OTxJfB_o) (~20 minutes).
- Attend the "A noob's introduction to Kubernetes" session.

### Objectives
Trainees will be able to:
- Use containers as part of their development workflows.
- Run container images available from container registries.
- Write Dockerfile, build container images for applications.

## Containers (~2h)
*[Instructor lead]*
Containers have changed the way applications are packaged, and deployed in production in last more than half a decade. With orchestrators like Kubernetes they are almost everywhere in the industry. Let's see what containers are, how they are build and used. This module will be a mix of hands-on exercises, discussions, quizzes, and tasks. Each participant should go through the Play With Docker links from the Hands-on sections, and try the commands given there.

### Discussion
- What are containers?
- What is virtualization?
- Are containers and virtualization related?

### Hands-on time!
Go through following labs from Play With Docker classroom:
- [ ] [First Alpine Linux Containers](https://training.play-with-docker.com/ops-s1-hello/)
- [ ] [Docker for Beginners - Linux](https://training.play-with-docker.com/beginner-linux/)

### Discussion on lab
- [brainstorm] What's Docker actually? *Is it same as container or a different thing?*
- What are container images?
- What are containers?

#### Quiz
- How do you list running containers?
Ans. docker ps
- How do you start / stop a container?
Ans. docker start / stop  <containerID/containerName>
- How do you get container logs?
Ans. docker logs <containerID/containerName>
- How do you execute a command inside a running container?
Ans. docker exec -it <containerID/containerName> bin/bash

## Working with Images (~1h)
### Hands-on
- [ ] [Doing More With Docker Images](https://training.play-with-docker.com/ops-s1-images/)
- [ ] [Multi-stage builds](https://training.play-with-docker.com/multi-stage/)

### Discussion on lab
- How do you reduce the size of container images?
- What are [alpine](https://hub.docker.com/_/alpine)/minimal images?
- What languages can leverage the multi-stage build feature?
- [brainstorm] What significance do image layers hold for improving the image build performance?
- [brainstorm] When you build images for applications which have dependencies, will you install the dependencies first or copy the entire source code?

#### Quiz
- What is the `.` in the `docker build -t hello:latest .` command?
Ans. It is the Dockerfile in the present in the current directory.

## Container Registries (~20m)
Now that we have everything build and running locally, how to share that with others, how to run the images on other environments, machines etc?

### Hands-on
- [ ] [Docker registry for Linux Part 1](https://training.play-with-docker.com/linux-registry-part1/)

### Discussion on lab
- What are some popular container registries?
  - DockerHub, quay.io, etc.

#### Quiz
- How do you pull / push images to private registries?
Ans. docker pull / push <imageName>
- What are three parts of a container image tag? Example: `quay.io/fedora/fedora:35`
Ans. First Part is the organization name. Second Part is the repository name. Third part is the image name.

## Volumes (~20m)
### Hands-on
- [ ] [Docker Volumes](https://training.play-with-docker.com/docker-volumes/)

### Discussion on lab
- What kind of applications usually need to persist data on disk?
- Who will be the owner user of the files created by container? *Consider a scenario where host directory is mounted inside the container.*

#### Quiz
- None

## Docker Networking (~40m)
### Hands-on
- [ ] [Docker Networking Hands-on Lab](https://training.play-with-docker.com/docker-networking-hol/) (Section 1 and 2 only)

### Discussion on lab
- How do you access an API running in a container from host?
- What are bridge network & host network?

#### Quiz
- None

## Final assignment (~1h)
As part of this assignment, we will be containerizing a Go application and run the container image on our machine.

1. Take a look at the application documentation in the [greeter](./greeter) directory. *Just read it and understand, you will be using these details in next steps.*
2. Our Dockerfile will have two stages, in the first stage, we will build the application binary using the instructions from greeter app's README.
   - Use `docker.io/golang:1.18-alpine` image as base image for this stage.
3. In the second stage, use `scratch` as the base image.
   - Copy the `greeter` binary from stage 1 to `/greeter`.
   - Set the environment variable `GREETER_NAME` to your name in Dockerfile.
   - Running the image with `docker run greeter:latest --help` should show the help message from application. (*Think whether we should use `CMD` or `ENTRYPOINT`*).
4. Run the image in a way that the application is available on port 8080 on the host.
5. Run the image with `docker run greeter:latest -cli-only`.
6. Tag the image as `docker.io/<your username>/greeter:latest` and push it to DockerHub.

### Expected output
- There is a multi-stage Dockerfile with one stage building the application, and the other which uses the binary.
- With point number 4, the application should be reachable on localhost:8080 on the host machine.
- For 5, it should print `Hello from <your name here>!` on the command line.

## Discussion
*In case there is time after above assignment.*
- What are some best practices when building / running containers?
- What user IDs containers run with?

## Try more things
- [ ] [chroot Linux | How chroot is used while running containers | chroot examples](https://www.youtube.com/watch?v=8_5vXRA7sRs)
- [ ] [Linux cgroups explained | limit resources for a set of processes](https://www.youtube.com/watch?v=fIRjT0Apf_I)
- [ ] [Application Containerization and Microservice Orchestration](https://training.play-with-docker.com/microservice-orchestration/)
- [ ] [Docker registry for Linux Parts 2 & 3](https://training.play-with-docker.com/linux-registry-part2/)

## Reference Links
- https://medium.com/faun/learn-docker-in-5-days-day-1-general-concepts-fcac5a4cf0a6 
- https://docs.docker.com/develop/
- https://docs.docker.com/develop/develop-images/multistage-build/
- https://docs.docker.com/develop/dev-best-practices/
- https://docker-curriculum.com/
- https://stackoverflow.com/questions/57108005/login-to-docker-hub-by-command-line
- https://medium.com/@jessgreb01/digging-into-docker-layers-c22f948ed612
