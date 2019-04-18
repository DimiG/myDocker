myDocker
========
This repository dedicated to my [Docker][docker] scripts and configurations I use for developing and other purposes.  
[Docker][docker] is "Enterprise Container Platform for High Velocity Innovation".  

Codes description
-----------------

### myDocker folders

* `rust_cli`: This is the [Rust][rust] command line program which calls `ls` command when run. Here is the [Docker][docker] example for cross compilation from any platform to [Linux][linux] with [Docker][docker] help. Just compile the [Linux][linux] executable. I use the [Rust Musl builder][musl] container (*non official*) to make the static build of [Linux][linux] executable. This [Docker][docker] image is for compiling static [Rust][rust] binaries using `musl-libc` and `musl-gcc`, with static versions of useful C libraries. Supports `openssl` and `diesel` crates. More information is [HERE][musl].  

* `All Applications`:  
   ***Requires :*** [Docker][docker] correctly pre-installed on your OS platform.  
   ***Important:*** To compile I use [Makefile][makefile] which invokes the `Docker` commands.  

* `To be continued...`  

### License  

This code has been written by ©2019 DimiG  

[docker]:https://www.docker.com
[rust]:https://www.rust-lang.org
[linux]:https://en.wikipedia.org/wiki/Linux
[makefile]:https://en.wikipedia.org/wiki/Makefile
[musl]:https://github.com/emk/rust-musl-builder
