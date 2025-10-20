---
layout: post
title: "Ummmm what is Tableau Next?"
author: "Chris Meardon"
categories: blog
tags: [blog, tableau, tableau next]
image: "tableau-next-cover.jpg"
cover_image: "tableau-next-cover.jpg"
excerpt: "First steps with Tableau Next"
---

I've been working with Tableau for over 5 years at this point and I still think of it, at the heart, as Tableau Desktop. A tool to take data, explore it and visualise it in a very flexible way. But Salesforce recently launched Tableau Next and that raises alarm bells for me. What do you mean next? Tableau Desktop is great and doesn't need a major overhaul! But this new ~~product~~, ~~program~~, ~~add on~~, ~~replacement~~ _part of the salesforce ecosystem_ has significant potential to cross my path as a Tableau consultant and so learning about how it works and it's significance to the businesses I work with is important.

I'm going to work towards a greater understanding of Tableau Next and make notes here about it; maybe they'll be interesting to you too. Or maybe my data will be scraped, used to train LLMs and then regurgitated back to you with emojis in the headings and a unhumanly high rate of semi-colons.

## Getting started

Okay so I have a URL to access a Salesforce org and there is an app for Tableau Next. Within Tableau Next I can create a workspace to _store?organise?add?_ data, semantic models, visualizations and dashboards. I am uploading some superstore tables (CSV). I also played around with connecting to snowflake. You can add data from various sources by using Data Cloud (another Salesforce app) and then adding them into Tableau Next from there.

## Semantic Model

Jargon aye, what ya gunna do. Here you can bring in your data objects and set up relationships between them and create metrics and calculated fields. Metrics are what you set up to take the data and track it over time somehow. These metrics are what will be monitored for change over time. Oh there's also _logical views?_ and _parameters_. Parameters just seem like a value you can store and select from (like in the Tableau Desktop world I know). Logical views let you union tables?

## What is actually in a Workspace?

So right now, I’ve got this thing called a workspace, which seems like the "project folder" for Tableau Next. Everything happens in here — your data, your semantic model, your charts, your dashboards, your metrics, your hopes and dreams, all live in this one place.

And importantly, a workspace doesn’t necessarily own all the assets. It can also just reference stuff that lives elsewhere — like in another workspace or in Data Cloud. It's kind of like having a Google Doc shortcut in a shared folder. You don’t duplicate the file — you’re just saying “hey, I want to use this here too.”

This means if I make a metric in Workspace A, I can use it in Workspace B without rebuilding it. Nice. But also potentially chaotic if you don’t name things clearly. (Looking at you, "New_Metric_Final_v2_Copy2").

## Assets, Assets Everywhere

Let’s break this down. When they say “assets,” they mean all the bits that make up your analysis:

- **Data**: This has to come through Data Cloud. Even if I upload a CSV, it’s getting transformed into a Data Lake Object (DLO) behind the scenes. Tableau Next doesn’t just take your CSV raw — it absorbs it into the Salesforce data machinery.
- **Semantic Models**: These are where the structure and business logic live. Think of it like the “Relationships” and “Calculated Fields” tabs in Tableau Desktop, but on steroids and with stricter rules.
- **Metrics**: Built off semantic models. These are trackable KPIs — kind of like the metric feature in Tableau Cloud, but more native to the platform. They’re time-aware and dimension-groupable.
- **Vizzes**: Built in a “Visualization Builder.” It’s like Tableau-lite, all web-based. Drag and drop feels familiar, but there are fewer bells and whistles than full Desktop (so far).
- **Dashboards**: This is where it all comes together. You can pull in vizzes, metrics, filters, text, buttons — and even add Salesforce Flow actions. It’s a bit more “app-like” than the traditional dashboard canvas in Desktop.

## So What?

This all sounds shiny and new — but let’s be real. If you're a longtime Tableau Desktop user like me, you're probably asking:

- Do I have to learn this?
- Is Tableau Desktop being replaced?
- Should I start pushing clients towards Tableau Next?

Here’s how I’m thinking about it:

- **No, Tableau Desktop isn’t going away**. But for businesses already deep into Salesforce and Data Cloud, Tableau Next is going to feel much more integrated and native.
- **If you’re a consultant or internal data team**, understanding Tableau Next is going to help you plug into more enterprise projects — especially ones where Salesforce is the source of truth.
- **If you’re doing governance or data architecture**, the semantic layer and workspace model will probably appeal to you. It’s more structured and shareable. Basically: it’s not Tableau instead, it’s Tableau next to.

## Coming Up Next

I'll keep poking at this platform and writing down thoughts as I go. Next up, I want to test:

- How intuitive is the Visualization Builder compared to Desktop?
- Can I embed dashboards somewhere outside Salesforce?
- How good is Agentforce actually — will it help me build logic, or just reword tooltips?

And I still have a few questions rattling around:

- Can you schedule extracts or refreshes from external data?
- How secure are these workspace references across orgs?
- Are there APIs for automating anything in Tableau Next?

If you've played around with Tableau Next or have thoughts, reach out. Otherwise, stay tuned for part two where I try to break things on purpose.
