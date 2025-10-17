---
layout: post
title: "Hacky Solution? Using calculated field as a business preference"
author: "Chris Meardon"
categories: blog
tags: [blog, tableau next, salesforce]
image: "tableau-next/hacky-bp-cover.png"
cover_image: "tableau-next/hacky-bp-cover.png"
excerpt: "Guiding the logic in Concierge for Tableau Next has some challenges, here's some thoughts"
---

A problem I've found refining the user experience of Concierge/ Agentforce in Tableau Next is how you help it understand logic.

Let me explain

If we need to aggregate a filtered set of data, compare it to other aggregated and non-aggregated values, you'll quickly find the **semantic query that Tableau Next would need to do this is too complicated** and it fails.

So, you throw the logic into calculated fields. Along with using the business preferences, concierge can now come to a conclusion based on the logic you have created in the field. However, it has no awareness of what it has done, so it can't really explain it or act upon the logic.

You can write business preferences to help it know next steps of what to do with conclusions but you're limited how many preferences you can make and I would forsee hitting that limit quite easily. Perhaps you could then have a semantic model for each scenario, so that each scenario let's you write another 20 business preferences but that would quickly become a lot of semantic models to maintain.

Something that comes to mind, which may be worth exploring, is the usage of a calculated field that returns essentially a business preference based on the logical calculation. Therefore you could then have a single business preference that says "look at this calculated field for what to do next" and that calculated field has information on what to do depending on the scenario. I've not tried that before and it doesn't feel best practice but... **hacky solution??**

I think something to explore and what will affect the value of that as a solution is how well a field that concierge can query can then be used to inform what it does next.
