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

This is all about taking existing sql scripts and migrating them into dbt

1. Migrating into dbt
2. Implementing sources
3. Refactoring strategies
4. Cosmetic cleanups, CTE groupings
5. Centralizing logic, dividing into models (stg, int, final)
6. Auditing dbt vs existing code

---

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

If you have mixed cases used, perhaps convert all to lowercase **([how to](https://chrisvizes.github.io/blog/transform-lowercase.html))**

This is also a good time to convert long lines into new line and tabbed structures for readability.

### CTE Grouping

At this point it will be useful to order our CTEs to make the script readable from top to bottom.

1. **Import CTEs**
   : Anything using the source references, but just that part, e.g:

   ```sql
   payments as (
   select * from {% raw %}{{ source('stripe', 'payment') }}{% endraw %}
   )
   ```

2. **Logical CTEs**
   : Working with the import CTEs

3. **Final CTEs**
   : The _final_ product of the script

4. **Simple Select Statement**
   : I was unconvinced on this part, but it's a simple
   `select * from <final CTE>`
   and apparently this makes life easier down the line

## 5. Centralizing logic, dividing into models

Identify what CTEs could be staging and marts models **[confused which is which?](https://chrisvizes.github.io/blog/dbt-models.html)**

Aiming to have sources that have structures like:

```sql
with

source as (

    select * from {% raw %}{{ source('jaffle_shop', 'customers') }}{% endraw %}

),

transformed as (

    select

        id as customer_id,
        last_name as surname,
        first_name as givenname,
        first_name || ' ' || last_name as full_name

    from source

)

select * from transformed
```

These staging models are the only models to reference sources directly.

Then we can build intermediate models and our final mart models in a top down fashion, building with the staging models and further CTEs to simplifiy the logic.

## 6. Auditing

We could now select from our legacy model and from our new mart model to compare them. However there are also packages that help do this. One of which is **[audit_helper](https://hub.getdbt.com/dbt-labs/audit_helper/latest/)**. [Read more about packages](https://chrisvizes.github.io/blog/packages.html)

Using audit_helper, you can quickly compare against legacy and look for any issues that came up/ assert you new model is performing as expected.
