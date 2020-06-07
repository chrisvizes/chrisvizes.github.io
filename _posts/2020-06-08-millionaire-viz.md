---
layout: post
title: "Kicking off exam preparations with a viz about millionaires"
author: "Chris Meardon"
categories: blog
tags: [tableau,dashboard]
image: "millionaires.png"
cover_image: ""
---
## The Plan
I'm planning on taking the Tableau Certified Professional exam soon and as a part of preparing for it, I want to practice making dashboards quickly that are effective and follow visual best practice. My plan is to make one each day, spending no more than an hour on each. The time limit here is key as it is an important factor in the exam and creates pressure to have an efficient process in creation. 

## What I did
To kick off this sprint, I created a dashboard taking a look at data on the number of adults with wealth greater than $1M. Now I'm not exactly sure on the definitions here of wealth, nor how it is measured so please take my dashboard with a pinch of salt. 

[![The dashboard](/assets/img/Millionaires_dash.png "I should probably make this a hyperlink")](https://public.tableau.com/profile/chris.meardon#!/vizhome/MillionairesoftheWorldUSDomination/Millionaires)

## Reflections
To try and grow I want to record down my thoughts on the dashboard. It may also help indicate why I made certain decisions if you're interested. Without blowing my own trumpet, let's start on a positive note. 

### The Good
* I quite like my focus into one particular country as it created a better story as you move through the dashboard.
* I like the use of colour (at least in the top half) to focus on this story, highlighting particular elements.
* To compare the countries on this value and show how countries rank at the same time is the perfect case for a bar chart and I think this was the right choice. 
* Breaking up the countries into the top countries and then the rest of the world was suitable here too as the numbers became less important the further down and really we are looking at US comparisons.
* To tell the story of how dominant the US is, I think going from the bar chart to the waterfall, showing how all the countries add up to the US,  was an effective way to do this. It makes the sum of these value visually clear. 
![waterfall](/assets/img/millionaire_waterfall.png "What is this field again?")
* I like the reference line on the waterfall chart making it clearer how the totals are the same. It's pretty subtle but I think helps. 
* I think using the BAN of the US percentage was a great fit for the flow of the story working through the dashboard. 
![BAN](/assets/img/millionaire_ban.png )
 
### The Bad
Focus colour reused not great
bottom viz doesn't answer the question
confusing wording on annotation
took more than 1.5 hours
top viz too big taking up too much of the screen
Perhaps mis represented numbers? DS says units were thousands of adults but that give US 18 billion adults?
Definition of numbers not present