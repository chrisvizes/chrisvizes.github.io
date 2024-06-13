---
layout: post
title: "Beta Distributions as a Tool in Dummy Data Creation"
author: "Chris Meardon"
categories: blog
tags: [ChatGPT, Python]
image: ""
cover_image: ""
---
Creating a distribution of values that a given metric has across the rows of data you are generating is a common task in generating "dummy" data. A common techinque is to use normal distribution functions for various metrics so that the resulting values in this field seem more realistic. However, in many cases other functions (or distribution curves) would be more suitable. 

Recently while playing around with LLMs I can across beta distribution functions and I wanted to describe how I found them useful here.