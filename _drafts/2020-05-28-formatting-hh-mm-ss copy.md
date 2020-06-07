---
layout: post
title: "How to format seconds into hh:mm:ss"
author: "Chris Meardon"
categories: blog
tags: [tableau,formatting,calculation]
image: 
cover_image: 
---
Sometimes it can be useful to turn a number of seconds, say 678, into the format hh:mm:ss to make it more readable. This blog will show you how to do this within Tableau, and extend it for some other use cases.

There's formatting options in Tableau that allow you to display numbers in a variety of formats e.g. 678, 678.00, 0.678k, £678 and there is a custom formatting where you could write "hh:mm:ss". Then it may seem that Tableau will display this number in an hour minute second format, but there is an issue. 

For Tableau to be able to know how many hours minutes and seconds the number represents it would need some kind of mapping between the number and a unit of time. The number of 678 could be hours, years of millennia unless it correctly makes an assumption that this number represents seconds. Well Tableau actually recognises it as DAYS. Doesn't sound so bad right? But there is another caveat, Tableau treats it as the number of days SINCE 30th of December 1899. 

This is a result of how dates are stored in some systems and how Tableau assumes we are following this convention. So we need another way. 

Translating the number into 

why you can't just format the number with custom formatting

extensions
yy:ww:hh:mm:ss
what about if my time is in hours,mins,days,months (harder)?
