---
layout: post
title: "How to Refactor SQL into dbt Cloud Models"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt]
image: "courses.png"
cover_image: "dbt-logo.png"
excerpt: "Notes and thoughts on a course about refactoring in dbt Cloud"
---

This is all about taking existing sql scripts and migrating them into dbt. This includes:

1. Migrating into dbt
2. Implementing sources
3. Refactoring strategies
4. Cosmetic cleanups, CTE groupings
5. Centralizing logic, dividing into models (stg, int, final)
6. Auditing dbt vs existing code

## 1. Migration process

Starting from a sql script we want to migrate into a dbt project. It might be a good first step to create a folder within your models called 'legacy' where we can copy and paste our script to. We can then run that script to check it all works in this environment.

If you're migrating between source systems (e.g. SQL Server to Snowflake) then this is where work will be needed to migrate between the flavours of sql.

## 2. Sources

Look through sql for hardcoded table references. Create folder hierarchy for the staging tables following the convention of `models` > `staging` > `source system`. We can then create source configuration files within those system folders, calling them something like `_sources.yml` and it's okay if these files have the same name in different folders as the folder makes them unique.

Now you can go through and replace all hardcoded table references with source references.

## 3. Choosing refactoring strategy

This is the steps you'll choose to take to organise the models you make as part of refactoring.

If you create a branch and start working on the legacy model, changing sources, modifying the script structure etc, you won't have something to audit against within this project/environment.

Another way to refactor would be to work along side the legacy model. You'd start this by have the legacy model sitting relatively untouched in the legacy folder, but you'd also copy it to the model folder that is you end goal, e.g. a `mart` folder. You'd then work on this copy in the goal destination. It might feel like you have duplicate models being run, but that's the point, something to audit against without relying on another environment.

## 4. CTE Groupings and cosmetic cleanups

### Cosmetics

The goal is to make it easier to read.

If you have mixed cases used, perhaps convert all to lowercase [how to](https://chrisvizes.github.io/blog/transform-lowercase.html)

This is also a good time to convert long lines into new line and tabbed structures for readability.

### CTE Grouping

There is an order that would be _good practice?_ to do our CTEs in.

**Import CTEs** Anything using the source references, but just that part, e.g.
:

```sql
payments as (
 select * from {% raw %}{{ source('stripe', 'payment') }}{% endraw %}
)
```

Logical CTEs
:Working with the import CTEs

Final CTEs
:The _final_ product of the script

Simple Select Statement
:I was unconvinced on this part, but it's a simple `select * from <final CTE>` and apparently this makes life easier down the line

**Now our script can be read, top down**
