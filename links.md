---
layout: page
permalink: /links/
title: Links
---

## Misc

- special effects [Ghost Sand](https://lab.cheron.works/webgl-gpgpu-particles/)

## Tech

- Coursera: Machine Learning Foundations
  <https://github.com/arafatm/edu_coursera_machine_learning_1_foundations>

- Udacity: Microservices with Kubernetes
  <https://github.com/arafatm/edu_udacity_scalable_microservices_with_kubernetes>

## Read a random note
find . -type d \( -name .git  \) -prune -o \( -name "*.mkd" -o -name "*.md" \) |shuf -n 1

## find a random doc to read
find . -type f | shuf -n 1
find . -type f -name "*.md" -not -path "./.git/*" |shuf -n 1
