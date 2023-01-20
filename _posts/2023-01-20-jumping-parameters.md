---
layout: post
title: "Jumping Filters"
author: "Chris Meardon"
categories: blog
tags: [Tableau, Tableau Desktop, Parameters, Parameter Actions, Tableau Public]
image: "jumping-parameters.gif"
cover_image:
---
In long form dashboards you may find yourself wanting filters or parameter options to travel with you down the page. Tableau does not support a feature like this but we can use a technique to let the users reposition them at a click of a button. In this blog we will take a look at what I came with and how you can do it too.

In a [Tableau Public dashboard](https://public.tableau.com/app/profile/chris.meardon/viz/MultipleParameter-BasedFilters/DemoV3) I published recently I took on this challenge and came up with a solution. This blog will make the most sense if you have an explore of it first, so click the link to get started.
[![Tableau Public Dashboard](/assets/img/mpf-top.png)](https://public.tableau.com/app/profile/chris.meardon/viz/MultipleParameter-BasedFilters/DemoV3)

## Tutorial
### 1. Dynamic Zone Visibility 
Firstly, this dashboard makes extensive use of dynamic zone visiblity, which is a recently added feature. This enables objects and containers in dashboards to be dynamically shown or hidden based on a boolean calculation. 

With a dashboard open, select the object you want to dynamically hide and go to the layout pane. This is where you'll find the "Control visibility using value" option. In here you can select any of your boolean calculations. 

**When the calculation is true, the object is shown, when it is false it is hidden.** 

### 2. Creating Structure of Zones
What we are going to show and hide in the dashboard are blanks. But let's start showing the dashboard we are going to work on in this tutorial.

![long dashboard](/assets/img/long-boi.gif)

### 3. Creating Buttons
### 4. Setting up Parameter & Actions