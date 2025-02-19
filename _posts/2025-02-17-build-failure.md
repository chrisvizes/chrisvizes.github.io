---
layout: post
title: "Trouble building my first project"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt, snowflake]
image: "courses.png"
cover_image: "courses.png"
excerpt: "What I realised about a build failure. Lesson learnt."
---

## Why is my build failing? The model is says doesn't exist exists!

Spent the last 15 minutes toiling over this one. Turns out my model lacked the file extension of `.sql` so it wasn't building. It's obvious once you realise. The clue was the icon next to it's name was different to everything else. It was a _file_ icon rather than a cube. I guess the cube means model.
