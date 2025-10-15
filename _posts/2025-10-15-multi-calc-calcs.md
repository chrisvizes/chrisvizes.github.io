---
layout: post
title: "\"Calculated dimensions can be only defined at either Row or LOD (Level of Detail) level\" bullshit"
author: "Chris Meardon"
categories: blog
tags: [blog, tableau next, salesforce]
image: "tableau-next/LOD-Error.png"
cover_image: "tableau-next/LOD-Error.png"
excerpt: "A discussion of, and solution to, a weird problem in Tableau Next"
---

In many ways Tableau Next is not the Tableau that Tableau people know, _but it does masquerade as it_.

For example it has Discrete Dimensions, Continuous Measures and Level of Detail calculations, but they don't work the same (some of the time).

I hit a wall recently when building a calculation to help concierge flag poorly performing clinical trial sites. I needed a field that concierge could use in a semantic query to filter the raw data for sites that are underperforming (rather than use it unreliable reasoning). This calculation needs an aggregated view of the data but concierge can't filter in a semantic query by aggregations, they have to be row level. So I wrapped my aggregation in a fixed LOD, which means this will have a row level result and can therefore be used in the semantic query. But that's not what happened.

My Fixed LOD calculation looked like:

```
{ FIXED [Site_ID] :
    (
    if avg([Retention Rate]) < 80 then 1 else 0 end
    + if avg([Screen Failure Rate]) > 40 then 1 else 0 end
    + if avg([Query Rate]) > 15 then 1 else 0 end
    ) >= 2
}
```

The result of which is a boolean field which I need to have the properties:
Field Type: Dimension
Data Type: Boolean
Data Role: Discrete

But when I used that configuration it returned the error `Calculated dimensions can be only defined at either Row or LOD (Level of Detail) level.`

Umm, my calculation is LOD level?!

## The Solution

It appears that Tableau Next does not like including any aggregations in a calculation that resutls in a Dimension. But if you abstract the aggregation into another calculation the problem goes away. Let me make that clearer

The calculation

```
{ FIXED [Site_ID] :
    (
    if avg([Retention Rate]) < 80 then 1 else 0 end
    + if avg([Screen Failure Rate]) > 40 then 1 else 0 end
    + if avg([Query Rate]) > 15 then 1 else 0 end
    ) >= 2
}
```

could be written as two parts

```

    (
    if avg([Retention Rate]) < 80 then 1 else 0 end
    + if avg([Screen Failure Rate]) > 40 then 1 else 0 end
    + if avg([Query Rate]) > 15 then 1 else 0 end
    ) >= 2

```

```
{ FIXED [Site_ID] :
    <Part 1>
}
```

### or more generally

```
{ FIXED [Dimension] :
    aggregation([Field])
}
```

converted into:

[Calc 1]

```
aggregation([Field])
```

[Calc 2]

```
{ FIXED [Dimension] :
    [Calc 1]
}
```

## So what have we learned?

Honestly feels like a bug resulting from a product being shipped too quickly... and maybe it is. So I'm writing this down in case anyone else hits their head against the wall too.

I think it's something to do with how with two calculations you can set two different configurations of Field Type, Data Role, Data type.
