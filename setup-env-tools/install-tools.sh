#!/bin/bash

dnf update -y

dnf install git make -y

dnf install podman buildah -y

# Enable osbuild repository
dnf install 'dnf-command(copr)' -y
dnf copr enable @osbuild/osbuild-stable -y
dnf copr enable @centos-automotive-sig/osbuild-auto -y

# Install osbuild tools from the repository
dnf install -y osbuild 
dnf install -y osbuild-auto 
dnf install -y osbuild-ostree
dnf install -y osbuild-tools


 
 
