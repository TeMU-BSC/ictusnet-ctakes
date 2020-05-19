# Pre-annotation Dockerized Pipeline for the ICTUSnet Project

## Previous considerations

- `/full/path/to/your/input/data` is your input directory that should be as below format:

```
data
├── file1.txt
├── file2.txt
└── ...
```

- `/full/path/to/your/output/data`should be an empty directory to put the `.ann` files that `ictusnet` docker container will generate. **Being at HOME Diretory is highly recommended**.

## Run

## 1. Docker
Make sure [docker](https://docs.docker.com/engine/install/) is installed in your system.

Build the docker image, assuming Docker is a [non-root user](https://docs.docker.com/engine/install/linux-postinstall/):

```
bash build-docker.sh
```

Run the docker container: (run with sudo if Docker is not as a non-root user)
Note: Run the below script with two arguments: one path for TXT directory as an input and one path for ANN directory as an output.

```
bash run-docker.sh /full/path/to/your/input/data /full/path/to/your/output/data
```

## 2. Singularity

For building the Singularity image, once the Docker one has been built (since it is converted using https://github.com/singularityhub/docker2singularity), assuming Singuliraty is installed, run:

```
bash build-singularity.sh
```

Run singularity image:
Note: Run the below script with two arguments: one path for TXT directory as an input and one path for ANN directory as an output.
```
bash run-singularity.sh /full/path/to/your/input/data /full/path/to/your/output/data
```

## Resources

This docker image is available online at docker hub:
https://hub.docker.com/r/bsctemu/ictusnet

## Contact
Siamak Barzegar (siamak.barzegar@bsc.es)
