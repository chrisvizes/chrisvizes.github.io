---
layout: post
title: "Tableau: How to Format Seconds into hh:mm:ss (like a clock)"
author: "Chris Meardon"
categories: blog
tags: [tableau,formatting,calculation]
image: "formatting-clock-cover.png"
cover_image: "formatting-clock-cover.png"
excerpt: "How do you turn a number of seconds, say 678, into the format hh:mm:ss to make it more readable. This blog will show you how to do this within Tableau, and extend it for some other use cases."
---
## Why
Sometimes it can be useful to turn a number of seconds, say 678, into the format hh:mm:ss to make it more readable. This blog will show you how to do this within Tableau, and extend it for some other use cases.

There's formatting options in Tableau that allow you to display numbers in a variety of formats e.g. 678, 678.00, 0.678k, £678 and there is a custom formatting where you could write "hh:mm:ss". Then it may seem that Tableau will display your number in an hour minute second format, but there is an issue. 

For Tableau to be able to know how many hours, minutes and seconds the number represents it would to know what unit of time the number represented, which it cannot on its own. Tableau will actually recognise the as DAYS if we choose a format like "hh:mm:ss". Doesn't sound so bad right? But there is another caveat, Tableau treats it as the number of days SINCE 30th of December 1899. 

This is a result of how dates are stored in some systems and how Tableau assumes we are following this convention. So we need another way. 

## Motivating the Method
My first thought is to use a calculation instead that breaks the number - like 678 - into how many hours minutes and seconds it represents and then combining them into one string, kind of like a clock interface. 

If we had less than 60 seconds I hope you can see that we would just need to have a calculation that returns 
'00:00:' + [Seconds] *returning* 00:00:35 for example
with [Seconds] being the field we had representing a time with the unit seconds. But if the number was say 65, then we can no longer do this as we need to 'restart' the count of seconds once we pass 59. The next 5 seconds after 59 are 0, then 1, then 2, 3, 4. So the seconds would now be 4, with the minutes going up one.

To calculate the value to use in our clock we need to find how many whole lots of 60 second we have and then keep the extra seconds left over. With 65 we have 60 seconds + 5 seconds, so we keep the 5. For 124 seconds we have 2 lots of 60 seconds + 4 seconds, so we keep the 4. There is an operator to do this mathematical function for us in Tableau (also found elsewhere) called modulo which uses the syntax '%'.<br>
`[Seconds] % 60`<br>
tells us this left over number of seconds. E.g.<br>
`65 % 60 = 5 seconds`<br>
and<br>
`124 % 60 = 4 seconds`

Great, we now have a way to calculate the seconds on the clock given we know [Seconds]. Next up, minutes.

We need a way to convert our example of 65 seconds to the number of whole minutes that represents (1 in this case). A way to do this is to divide by 60, to get the number of minutes, and then use the floor function to round it down to a whole number. This would look like

`floor(65/60) = 1 minute`<br>
or<br>
`floor(124/60) = 2 minutes`

Brilliant, we now have the number of whole minutes on our clock, but if we had 60 minutes (i.e. 1 hour) then we need our clock to restart back at 0, just like with seconds. We do this the same way as before:

`floor(65/60) % 60 = 1 minute`<br>
`floor(124/60) % 60 = 2 minutes`<br>
`floor(3540/60) % 60 = 59 minutes`<br>
and<br>
`floor(3600/60) % 60 = 0`

Getting 0 in that last example is what we expect as 3600 seconds is one hour (60 x 60).

## Generalising the Method
In general we can think of the formula needed to translate the amount of time in one unit, A, to the amount of whole units of time A in the desired unit of time, B, resetting to 0 every time it hits it's maximum value, C, as:`Floor(A/B)%C`

### Examples Covered

| A | B | C | Floor(A/B)%C |
|-------|--------|---------|---------|
| **65** seconds | **1** second per **second** | reset at **60** seconds | Floor(65/1) % 60 = 5 seconds |
| **65** seconds | **60** seconds per **minute** | reset at **60** minutes | Floor(65/60) % 60 = 1 minute |
| **124** seconds | **60** seconds per **minute** | reset at **60** minutes | Floor(124/60) % 60 = 2 minutes |
| **3540** seconds |**60** seconds per **minute** | reset at **60** minutes | Floor(3540/60) % 60 = 59 minutes |
| **3600** seconds | **60** seconds per **minute** | reset at **60** minutes | Floor(3600/60) % 60 = 0 minutes |

### Extending Method to Other Examples: 3656 Seconds in hh:mm:ss

| A | B | C | Floor(A/B)%C |
|-------|--------|---------|---------|
| **3656** seconds | **3600** seconds per **hour** | reset at **24** hours | Floor(3656/60) % 24 = 1 hour |
| **3656** seconds | **60** seconds per **minute** | reset at **60** minutes | Floor(3656/60) % 60 = 0 minutes |
| **3656** seconds | **1** second per **second** | reset at **60** seconds | Floor(3656/1) % 60 = 56  seconds |

So 3656 seconds on a hh:mm:ss clock, would be 01:00:56

### Extending Method to Other Examples: 99999 Seconds in dd:hh:mm:ss

| A | B | C | Floor(A/B)%C |
|-------|--------|---------|---------|
| **99999** seconds | **86,400**‬ seconds per **day** | reset at **365** days | Floor(99999/86400) % 365 = 1 day |
| **99999** seconds | **3600** seconds per **hour** | reset at **24** hours | Floor(99999/3600) % 24 = 3 hours|
| **99999** seconds | **60** seconds per **minute** | reset at **60** minutes | Floor(99999/60) % 60 = 46 minutes|
| **99999** seconds | **1** second per **second** | reset at **60 **seconds | Floor(99999/1) % 60 = 39 seconds|

So 99999 seconds on a dd:hh:mm:ss clock would be 01:03:46:39

### Extending Method to Other Examples: 100 Minutes in hh:mm:ss

| A | B | C | Floor(A/B)%C |
|-------|--------|---------|---------|
| **100** minutes | **1/60**‬ minutes per **second** | reset at **60** seconds | Floor(100/(1/60)) % 60 = 0 seconds |
| **100** minutes | **1**‬ minutes per **minute** | reset at **60** minutes | Floor(100/1) % 60 = 40 minutes |
| **100** minutes | **60**‬ minutes per **hour** | reset at **24** hours | Floor(100/60) % 24 = 1 hour |

So 100 minutes on a hh:dd:ss clock would be 01:40:00

### Moving Theory Into Tableau
To do this in Tableau Desktop we can create a calculated field for each conversion, i.e. converting the field representing seconds into each of hh, mm and ss and ensuring we show the value 1 as 01 and 5 as 05 for example:

ss<br>
```
if len(str([Seconds]%60)) < 2
    then '0' + str([Seconds]%60)
else str([Seconds]%60)
end
```

mm<br>
```
if len(str(floor([Seconds]/60) % 60)) < 2
    then '0' + str(floor([Seconds]/60) % 60)
else str(floor([Seconds]/60) % 60)
end
```

hh<br>
```
if len(str(floor([Seconds] / 3600) % 24)) < 2
    then '0' + str(floor([Seconds] / 3600) % 24)
else str(floor(floor([Seconds] / 3600) % 24))
end
```

Then we can add these strings together with a ':' between:<br>
`[H] + ':' + [M] + ':' + [S]`<br>
and we have a string processing our input seconds into the format hh:mm:ss, done. 

## Wrapping up

This method lays out how to covert time from seconds into a formatted string in Tableau that can be more easily readable, like a digital clock. This can be extended to take any unit of time as the input (A) and to create any format clock, if the conversion between the input and output time units is known (B). The maximum number for the units of time (C) is optional and in particular it may be useful to omit on the largest time unit on the clock. This works for Tableau, but also anywhere else these functions or similar are available, by using:<br>
`Floor(A/B)%C` 