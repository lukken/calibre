#!/bin/bash
# Calibre server load script
# ---------------------------------------

# First, check to see if there are new books to add to the library
xvfb-run calibredb add /calibre/ebooks/* --library-path /calibre/calibre-library

# Start the calibre content server
/opt/calibre/calibre-server --port=8180 --enable-local-write /calibre/calibre-library
