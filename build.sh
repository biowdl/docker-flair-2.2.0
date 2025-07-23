#!/bin/bash
podman build -t flair2 .
podman save flair2 -o flair2.tar
apptainer build flair2.sif docker-archive://flair2.tar
