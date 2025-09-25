---
layout: post
title: "What's the difference between a DLO, DMO and CIO in Tableau Next/ Data Cloud"
author: "Chris Meardon"
categories: blog
tags: [blog, tableau next, data cloud, salesforce]
image: "tableau-next-cover.jpg"
cover_image: "tableau-next-cover.jpg"
excerpt: "Distinguishing these different objects confused me at first"
---

I think for me the confusion started when I through myself into the Tableau Next (and more generally Salesforce) platform and started to build things to see what stuck. When building a semantic model I noticed there were three categories of data objects you could add, but I only had one:

- Data Lake Objects (DLOs)
- Data Model Objects (DMOs)
- Calculated Insights (CIOs)

I only had DLOs because I had ingested the data myself into the platform and not built anything else on top of it yet. But this left me wondering what the others were...

## But first, what's a DLO?

If you want to ingest data, you're going to need to upload it and that object you create is a DLO. It's just data stored somewhere like an S3 bucket. So if you looked into the data stream details (that creates the DLO) you'll see an S3 bucket address.

**Use DLOs to ingest or stage data in Data Cloud without transformations.**

## So what's a Data Model Object?

A DMO sits on top of one or more DLOs, relating them together and adding additional metadata (semantics). The result is a reusable and governed data object that represents a business concept.

**These are what your business users are going to interact with.**

## So what's a Calculated Insight Object?

Think reusable calculated results from DMOs, or in otherwords CIOs are materialised calculations. They help you optimise calculation times by letting you refer to this result from dashboards, concierge or agents without having to recalculate each time.

## Summary

- DLO – Raw storage of ingested data (tables).
- DMO – Semantic model of the data (entities, relationships).
- CIO – Reusable calculated results or insights built on top of DMOs.
