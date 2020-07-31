# calibre
Calibre content server for docker

## Build Steps:
### 1) Create directory on host (this is where you will store ebooks to add to server)
  ```
  sudo mkdir /var/lib/docker-calibre
  sudo mkdir /var/lib/docker-calibre/ebooks
  wget http://www.gutenberg.org/ebooks/1787.epub.noimages -O /var/lib/docker-calibre/ebooks/Hamlet.epub
  ```
  NOTE: There must be at least one epub or mobi in this directory before starting the container for the first time. They can be removed after the server starts up and adds them to the library.

### 2) Copy these files into a temp directory to build from Dockerfile
  `git clone https://github.com/lukken/calibre.git`

### 3) Build from dockerfile
  ```
  cd calibre
  docker build --tag lukken/calibre .
  ```

### 4) Deploy container
  ```
  docker run -d -t -p 8000:8180 \
    -v /var/lib/docker-calibre/ebooks:/calibre/ebooks \
    --hostname=calibre \
    --restart=unless-stopped \
    --name calibre \
    lukken/calibre
 ```
