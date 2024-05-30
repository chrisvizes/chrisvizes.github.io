---
layout: post
title: "Multiple Parameter Options Technique"
author: "Chris Meardon"
categories: blog
tags: [Tableau, Tableau Desktop, Parameters, Parameter Actions, Tableau Public]
image: "mpf-top.png"
cover_image:
---

Often parameters are used in place of filters in Tableau Desktop, but you can't have a specific parameter option on a dashboard multiple times in the current build. If you need to add this parameter option to different parts of a dashboard, e.g. a long dashboard, then this blog is for you.

### How can I add a parameter options to a dashboard in multiple places?

What we can do is make use of parameter actions combined with small charts **instead** of using the parameter options.

Instead of this:

![Filter 1](/assets/img/category-parameter.png)

The dashboard uses these _charts_

![Filter 2](/assets/img/category-parameter-2.png)

and has parameter actions that copy the value you click into the parameter. This results in identical functionality to the original parameter option but is different in one key way: we can have as many of these as we want.

So this could then placed multiple times on a dashboard, resolving the issue.

### Example

To see this in action, explore my workbook on [Tableau Public](https://public.tableau.com/app/profile/chris.meardon/viz/MultipleParameter-BasedFilters/DemoV3)
[![example](/assets/img/mpf-top.png "Go to Tableau Public")](https://public.tableau.com/app/profile/chris.meardon/viz/MultipleParameter-BasedFilters/DemoV3)
