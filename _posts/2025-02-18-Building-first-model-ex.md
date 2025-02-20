---
layout: post
title: "First dbt Exercise"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt]
image: "courses.png"
cover_image: "dbt-logo.png"
excerpt: "Notes from my first dbt exercise"
---

We kick off with creating folder to structure the storage of our models. As far as I can tell the location of a model only affects the properties applied to that location (like setting how the models will materialize in the project yml file). But it will help the structure be readable and managable, so good practice.

## Creating simple staging models

Not much to write up here, we created three staging models to light touch the sources, creating more appropriate field headers. They're all in the staging folder and will have any config applied from the project yml to them.
![Staging](/assets/img/staging-image.png)

## Adjust project file

I then added configuration to the project yml file to materialize the the staging and marts models differently.
![Project Config](/assets/img/project-config.png)

## Build a fact table for orders

Okay so a new sql file, taking data from two tables, aggregating, joining. My first time joining tables from jinja references... It's gone okay.

## Refactoring an intermediate model

Adding a new field, using the new fact table. This requires a new CTE in the dim model, aggregating from the fact model and then joining that to the dims. Ran all that through and checked the data by querying it in snowflake, comparing to a known value and my figures were 100x bigger than they should be. Looks like someone forgot to convert from cents/pennies to dollars/pounds. Now where would a change like that go? The staging models of course!

## End Result

Comparing my sql to what they provided as an example I can see that I have not ended up with the simplest solution. I'll admit I could do with more practice with SQL. I got to the desired comparison value but the models I left behind were the bare minimum for the answer and wouldn't re-use well (going against a key idea of dbt). I also missed that I created a new CTE where I should just edit the existing one.
![Lineage](/assets/img/example-lineage.png)
