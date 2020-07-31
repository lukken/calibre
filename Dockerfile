FROM debian:buster-slim

# Update, get required apps
RUN apt update && apt upgrade --yes
RUN apt install imagemagick xvfb libxcomposite1 wget python-minimal --yes

# Make base directorys
RUN mkdir /calibre
RUN mkdir /calibre/ebooks

WORKDIR /calibre

# Install the calibre content server
RUN /bin/bash -c "wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin"

# Pull a sample ebook. Not needed if you add your own BEFORE you first try to start the container
RUN wget http://www.gutenberg.org/ebooks/1787.epub.noimages -O /calibre/ebooks/Hamlet.epub

# Copy the startup script to the image
COPY calibre_start.sh .
RUN chmod +x /calibre/calibre_start.sh

EXPOSE 8180

ENTRYPOINT ["/calibre/calibre_start.sh"]
