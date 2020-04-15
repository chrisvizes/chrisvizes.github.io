---
layout: post
title: "Blog about a creating a blog"
author: "Chris Meardon"
categories: blog
tags: [blog]
image: "making-a-blog-cover.jpg"
cover_image: "making-a-blog-cover-cover.jpg" # this is an example of using a different image for the image of the blog in the home feed compared to the top of the blog

---

## Let's talk about how this blog came into existence.

I've been writing blogs for the [Data School Blog](https://www.thedataschool.co.uk/author/chris-meardon/) since starting my role there on topics around tableau and alteryx tutorials/ tips and what it's like being a data schooler. My writing is usually pretty relaxed and I like to have a laugh to keep things a bit more interesting. However, sometimes I'm a bit too casual for the companies blog or I'd rather be free from conforming to my idea of what is appropriate for their blog. 

I also thought it would be a good challenge for me to get back into web development and to also have a place that acts as a portfolio to help build my personal brand.

These motivated me to create my own blog. And here it is.

## But how does it work?

This blog is a *static site* hosted on Github Pages, built by Github Pages using Jekyll and written using VSCode. All of these service is free along with the software. I want to describe a little more about what all these terms mean and how the site works from my point of view.

To give an idea on how I operate the blog after it is all set up, see the diagram below.

## How I publish new content
![Working process](/assets/img/blogging-working-process.png "yeah, I'm not sure why I made this an image either...")

The text editor that I use is VSCode which has an integrated terminal which I then use for pushing the new content to Github, but there are many tools for this process. Any kind of text editor will do and the basic terminal on your machine will do fine. I believe the simplest approach may be to edit the blog directly with Github itself (even the desktop application). The point I'm trying to make is that once the blog has been set up, writing blogs is quick and simple.

## Blog setup

### Theme
I am using the [Millenial theme](https://github.com/LeNPaul/Millennial) by [Paul Le](https://www.lenpaul.com/) which I quite like for it's minimalistic approach. To use it, I have follow the instructions provided in the readme at the theme link above. Essentially, the blog code is copied from their repository and then I have edited it slightly to suit my needs. I removed all their demonstration content and then added my own.

### Github Repository 
The code for this blog sits in a [public repository](https://github.com/chrisvizes/chrisvizes.github.io). There is a small amount of configuration on github itself to get it to build and host your github pages site, which essentially comes down to naming the repository <your-github-name.github.io> and not much more. I've got the code from the theme mentioned above that I have edited in this repository and github then builds it and hosts it for me. Learn more [here](https://pages.github.com/).

## Issues I had getting set up
I spent a few evenings *(imagine 200 commits/changes)* trying to understand how Github Pages, Jekyll and a couple themes worked. Trying to get a theme consistently working across my local testing environment and the live site was proving a challenge and I came to the conclusion that the theme may not have been fully functional. I'm still not sure whether it was me or the theme but I've moved on. I am glad that through the struggle I feel that I have come out with a better understanding of the process though.


#### Well I think that wrap things up
Check out my repository for the blog to see the code behind this, but the best place to learn about how to do this yourself if you're not comfortable with that I have mentioned is probably a combination of youtube tutorials and guides on Github Pages or Jekyll. 

#### Thanks for reading