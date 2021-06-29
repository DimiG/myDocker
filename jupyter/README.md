Jupyter
=======
This is a short description How to USE the current Docker file.  

Build container description
---------------------------

### Build image for developing  

```
$ docker build -t image_name .
```
**Note:** Container will run as `dockeruser` which is increase security.  

Run container description
-------------------------

### Container run for developing  

```
$ docker run --rm -it --name container_name -p 8888:8888 -v "$PWD":/home/dockeruser/wrkspace image_name
```

### License  

This code has been written by ©2021 DimiG  


