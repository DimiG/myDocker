myDocker
========
This repository dedicated to my [Docker][docker] scripts and configurations I use for developing and other purposes.  
[Docker][docker] is a software technology providing containers, promoted by the company [Docker, Inc][docker]. [Docker][docker] provides an additional layer of abstraction and automation of operating-system-level virtualization on Windows and Linux. [Docker][docker] uses the resource isolation features of the Linux kernel such as `cgroups` and `kernel namespaces`, and a union-capable file system such as `OverlayFS` and others to allow independent "containers" to run within a single Linux instance, avoiding the overhead of starting and maintaining virtual machines (VMs). The sub-folders here are divided by application names and combine [Docker][docker] files for custom image creation with additional scripts.  

Codes description
-----------------

### myDocker folders

* `rust_cli`: This is the [Rust][rust] command line program which calls `ls` command when run. Here is the [Docker][docker] example for cross compilation from any platform to [Linux][linux] with [Docker][docker] help. Just compile the [Linux][linux] executable. I use the [Rust Musl builder][musl] container (*non official*) to make the static build of [Linux][linux] executable. This [Docker][docker] image is for compiling static [Rust][rust] binaries using `musl-libc` and `musl-gcc`, with static versions of useful C libraries. Supports `openssl` and `diesel` crates. More information is [HERE][musl].  

* `jekyll`: [Jekyll][jekyll] is a famous static site generator based on [Ruby][ruby] language. By `Makefile` I call [Docker][docker] to compile the site without any [Ruby][ruby] installation.  

* `platformio`: [PlatformIO][platformio] is an open source ecosystem for [IoT][iot] development. By `Makefile` I call [Docker][docker] to compile the [C++][cpp] code with help of [PlatformIO][platformio] without any local [Python][python] installation. The compilation and firmware upload process was tested by [WEMOS D1 mini ESP-8266EX][wemos] [micro-controller][mcu].  

* `nginx_v1`: Custom container creation for [Nginx][nginx] WEB server (revised).  

* `nginx_v2`: This is improved version of [Nginx][nginx] WEB server which allows to use [PaaS][paas] for [Docker][docker] containers. As example here, I use [Heroku][heroku] as a platform for [Docker][docker] containers created by current scripts. Pay attention that your [Heroku][heroku] `token access key` must be specified in the `TOKEN_H` system local environment variable.  

* `golang`: Custom container creation for [Go Programming language][golang]. Compilation and run inside [Docker][docker] container.  

* `shell_cnfg`: [Docker][docker] specific aliases.  

* `All Applications`:  
   **Note:** For your environment you may change `SOURCE` path to `$(pwd)` in [Makefile][makefile]. To get help message use: `make help`.  
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
[nginx]:https://en.wikipedia.org/wiki/Nginx
[jekyll]:https://jekyllrb.com
[ruby]:https://en.wikipedia.org/wiki/Ruby_(programming_language)
[platformio]:https://platformio.org
[iot]:https://en.wikipedia.org/wiki/Internet_of_things
[cpp]:https://en.wikipedia.org/wiki/C%2B%2B
[python]:https://en.wikipedia.org/wiki/Python_(programming_language)
[wemos]:https://wiki.wemos.cc/products:d1:d1_mini
[mcu]:https://en.wikipedia.org/wiki/Microcontroller
[golang]:https://golang.org
[paas]:https://en.wikipedia.org/wiki/Platform_as_a_service
[heroku]:https://en.wikipedia.org/wiki/Heroku
