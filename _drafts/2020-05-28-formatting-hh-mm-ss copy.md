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

For Tableau to be able to know how many hours minutes and seconds the number represents it would need some kind of mapping between the number and a unit of time. The number of 678 could be hours, years or millennia unless it correctly makes an assumption that this number represents seconds. Well Tableau actually recognises it as DAYS. Doesn't sound so bad right? But there is another caveat, Tableau treats it as the number of days SINCE 30th of December 1899. 

This is a result of how dates are stored in some systems and how Tableau assumes we are following this convention. So we need another way. 

My first thought is to use a calculation instead that breaks the number - 678 - into how many hours minutes and seconds it represents and then combining them into one string. 

If we had less than 60 seconds I hope you can see that we would just need to have a calculation that returns 
'00:00:' + [Seconds] *returning* 00:00:35 for example
with [Seconds] being the field we had representing a time with the unit seconds. But if the number was say 65, then we can no longer do this as we need to 'restart' the count of seconds once we pass 59. THe next 5 seconds after 59 are 0, then 1, then 2, 3, 4. So the seconds would now be 4, with the minutes going up one.

To calculate the value to use in our clock we need to find how many whole lots of 60 second we have and then take keep the extra seconds left over. With 65 we have 60 seconds + 5 seconds, so we keep the 5. For 124 seconds we have 2 lots of 60 seconds + 4 seconds, so we keep the 4. There is an operator to do this mathematical function for us in Tableau (also found elsewhere) which uses the syntax '%'. [Seconds] % 60 tells us this left over number of seconds. 

65 % 60 = 5
124 % 60 = 4

Great, we now have a way to calculate the seconds on the clock given we know [Seconds]. Next up, minutes.

We need a way to convert our example of 65 seconds to the number of whole minutes that represents (1). A way to do this is to divide by 60, to get the number of minutes and then use the floor function to round it down to a whole number. This would look like

floor(65/60) = 1
or
floor(124/60) = 2

Brilliant, we now have the number of whole minutes on our clock, but if we had 60 minutes (i.e. 1 hour) then we need our clock to restart back at 0, just like with seconds. We do this the same way as before:

floor(65/60) % 60 = 1 minute
or
floor(124/60) % 60 = 1 minute
or
floor(3600/60) 60 = 0 (which is good because this is an hour and the clock should restart)

What about hours? Well it's more of the same. 

extensions
yy:ww:hh:mm:ss
what about if my time is in hours,mins,days,months (harder)?

make a bunch of examples of how to do it for all the possible scenarios you can think of