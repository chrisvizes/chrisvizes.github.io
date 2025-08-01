---
layout: post
title: "Understanding the Architecture of Tableau Next"
author: "Chris Meardon"
categories: blog
tags: [blog, tableau, tableau next]
image: "tableau-next-cover.jpg"
cover_image: "tableau-next-cover.jpg"
excerpt: "(Without the Jargon)"
---

## **Understanding the Architecture of Tableau Next (Without the Jargon)**

If you’re starting to explore Tableau Next, you’ll probably come across phrases like "composable architecture" or "semantic models powering insight-driven agents". Useful in theory, but hard to connect to what you actually do day-to-day.

So in this post, I want to break down what sits under Tableau Next and how its different layers work together. This isn’t just a technical deep dive. Understanding the structure helps you see where the value really comes from, what’s still early, and where you’ll need to think carefully about implementation.

---

### Why architecture matters

Unlike traditional Tableau where most work happens in a workbook, Tableau Next spreads the analytics process across a wider platform. That means more reuse, more automation, and more governance. But it also means you need to think a bit differently. **Your visualisations are no longer the centre of the universe.** They sit on top of a stack of layers that need to be connected and maintained.

There are four of these core layers, and they all interact with each other.

---

### 1. The Data Layer

This is where everything starts. Tableau Next is built to work best with Salesforce’s Data Cloud, but it can also connect to other platforms like Snowflake or BigQuery without having to physically move the data. That part is important. You don’t need to copy or extract everything first (but it depends on the data source).

When you upload a file like a CSV, Tableau Next stores it as a data lake object inside Data Cloud. From there, it becomes part of the broader ecosystem. This layer is about access, storage, and making data available across use cases. The key point is that all the data you use in Tableau Next ideally flows through this layer so that everything stays in sync.

---

### 2. The Semantic Layer

This is the part that gives meaning to the data. Think of it like your company’s shared dictionary of terms. You define what a “customer” is, how “net revenue” is calculated, or what “on-time delivery” means across regions.

Tableau Next uses something called Tableau Semantics to manage this. It lets you create models that include field names, relationships between tables, metrics, and even preferences based on your business context. These models are then used by your dashboards, by AI agents, and by other systems connected to Tableau.

What makes this different from a normal Tableau data source is that it’s more centralised and built to scale across users. Rather than each dashboard author making their own calculations, they pull from a shared model that can be governed and updated in one place.

---

### 3. The Visualisation Layer

This is where most users start to recognise the Tableau they’re used to. It’s the part where you build charts, explore trends, and drag and drop fields to build dashboards. It feels familiar if you’ve used Tableau Desktop, though it’s web-based and a bit more limited for now.

The key difference here is that you’re not building from scratch every time. The visual layer connects directly to your semantic models. That means your calculations, metrics, and business rules are already defined. You can focus on communicating insights, rather than rebuilding logic.

It also sets things up nicely for agentic analytics. Because everything you’re building is tied back to defined metrics and models, AI agents like Concierge know what to look at when answering questions or suggesting actions.

---

### 4. The Action Layer

This is the newest and least familiar part for most Tableau users. The action layer is about turning insights into something useful. Instead of just looking at a chart and thinking “we should probably do something about that”, Tableau Next lets you take action directly.

For example, if a support case has been open too long, you might update the record or trigger a follow-up message straight from the dashboard. This is powered by Salesforce Flows, which are basically automation sequences that respond to triggers.

You don’t need to be a developer to use them, but you do need to be clear about what actions are safe, who should have permission, and what kind of audit trail you need. Used well, this layer can help shorten the gap between seeing a problem and fixing it. Used badly, it can introduce more complexity than it solves.

---

### How it all fits together

Each layer builds on the one beneath it.

- The **data layer** gives you access to everything, without duplication.
- The **semantic layer** defines what that data means.
- The **visualisation layer** lets people explore and understand it.
- The **action layer** closes the loop by helping you do something with it.

You don’t have to use all four straight away, but the more you do, the more benefit you get from automation and scale. You also reduce the chance of people misinterpreting data or duplicating work.

This structure also makes it easier for APIs and AI agents to plug in and help. Because each layer is defined and governed, agents can monitor for anomalies, suggest responses, or even trigger workflows without requiring someone to build a new dashboard every time.

---

### Final thoughts

The architecture of Tableau Next is designed for a future where analytics isn’t just about looking back, but also about acting in real time. That said, it takes planning to use it well. You’ll need to think beyond just charts and get clear about your data flows, definitions, and business processes.

The four layers aren’t just technical concepts. They reflect how modern analytics needs to work if it’s going to be trusted, reused, and embedded into decision-making.

If you’re moving from traditional Tableau to Tableau Next, understanding this structure is a good first step. It’ll help you see what’s possible, where the rough edges are, and how to avoid building another stack of dashboards that no one ends up using.
