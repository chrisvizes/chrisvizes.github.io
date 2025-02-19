---
layout: post
title: "Who is an Analytics Engineer?"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt]
image: "dbt-logo.png"
cover_image: "dbt-logo.png"
---

Okay so in this next section the objectives are...

# Learning Objectives

1. Explain the structure of traditional data teams.
2. Explain how advances in technology enabled the transition from ETL to ELT.
3. Explain the role of analytics engineer and the modern data team.
4. Explain how dbt fits into the modern data stack.
5. Understand the structure of a dbt project.

## Team change through technology

Okay so _traditional data teams_ have engineers and analysts (I'm dropping the use of 'data' in their names). Engineers are the backend people, getting data into databases in nice structures with cadences. Analysts sit downstream, playing in the data, building useful things with it. For the analyst to get the most of the the data, the engineers must do their jobs in different ways, and this requirement has led to a more _modern_ structure of having an analytics engineer, a bit of both.

The idea is this will lead to greater efficiency as there is not a need to communicate between these roles, if the roles are one person.

### ETL go bye bye

Data warehouses have changed the game and ETL processes are being replaces with ELT. Left behind are the self managed database systems that you add data to, pull back out, change and add back to the db. Data warehouses let you do that all in the cloud, treating the tech as a service, and handing over the compute to super computers. The storage is _fairly_ cheap and let's you add the raw data, then process it within the warehouse. Run of of space or want to improve speed, scaling is easy (if you have the cash).

The analytics engineer is the T (from ELT), transforming data from the warehouse into the BI layer, ready for the analyst to use. This frees up work from the engineers, doing the EL, to work without handling requests from analysts. So analytics engineers does not replace data engineers and data analysts, but rather sits in the team with them.

**Leaving us with a work split like:**

### Data Engineers

- Build custom data ingestion integrations
- Manage overall pipeline orchestration
- Develop and deploy machine learning endpoints
- Build and maintain the data platform
- Data warehouse performance optimization

### Analytics Engineers

- Provide clean, transformed data ready for analysis
- Apply software engineering practices to anaytics code (e.g. version control, testing, continuous integration)
- Maintains data documenation & definitions
- Train business users on how to use data platform data visualization tools

### Data Analysts

- Deep insights work (e.g. why did churn spike last month? What are the best acquisition channels?)
- Work with business users to understand data requirements
- Build critical dashboards
- Forecasting (hmmm debatable, that's for the data scientists in my books)

But the lines are blurry and one person may wear many hats.

---

# CRISIS

TWO chilli seedlings are withering, battle stations 🚨

_(10 minutes later)_

Okay, the gang have been watered and some pots have been prepped to pot them up later on (have to warm up the soil first because these tropical plants don't like the northern UK climate).

---

## dbt in the modern stack

It's not a data loader and it's not a BI tool. It works with data platforms to transform data after it has been loaded and before BI tools can uses it. It also is particularly nice for T (ELT), with it's dev interface, testing, documentation and deployment.

## DAGs look nice

I'm a data visual person really, so I enjoy the nodes and how they connect. Directed Acyclic Graph (because I'll forget).

## Being shown some more things in the Cloud IDE

- **dbt run**: Run yo models(?), materialize your models(?), not sure on the language yet but it makes dbt do it's main thing
- **dbt test**: oooo lovely, run tests against the materialized models
- **the yml**: the _yamal_ looks important
- **dbt docs generate**: automatically create documentation so stakeholders know what columns etc mean? sounds nice
- **dbt build**: run and test (Y)
