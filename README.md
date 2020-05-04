# Pre-annotation Dockerized Pipeline for the ICTUSnet Project

## Previous considerations

- `/full/path/to/your/input/data` is your input directory that should be as below format:

```
data
├── file1.txt
├── file2.txt
└── ...
```

- `/full/path/to/your/output/data` should be an empty directory to put the `.ann` files that `ictusnet` docker container will generate.

## Run

```
$ docker run --rm -it \
-v /full/path/to/your/input/data:/ICTUSnet/data/TXT \
-v /full/path/to/your/output/data:/ICTUSnet/data/ANN_FINAL \
bsctemu/ictusnet process.sh
```

## Resources

This docker image is available online at docker hub:
https://hub.docker.com/r/bsctemu/ictusnet

## Contact
Siamak Barzegar (siamak.barzegar@bsc.es)
