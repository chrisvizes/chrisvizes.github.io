---
layout: post
title: "Reminder on finding objects in SQL"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt, snowflake]
image: "dbt-logo.png"
cover_image: "dbt-logo.png"
excerpt: "A note for future Chris when he next comes back to snowflake"
---

# Difficulties finding snowflake within dbt Cloud

I was expecting the autocomplete in the worksheets to know about the snowflake tables but I was not getting any suggestions from any tables. This was a bit of a blocker for me because I could seem to find anything in snowflake but I realised there is a much better way to find things.

Using `SHOW SCHEMAS` `SHOW DATABASES` `SHOW TABLES`

or

`SHOW TABLES IN DATABASE <database name>`
`SHOW TABLES IN SCHEMA <schema name>`
`SHOW DATABASES IN SCHEMA <schema name>`

I always forget about these!

...and just so I remember where the tables for this course are:

```SQL
select * from raw.jaffle_shop.customers;
select * from raw.jaffle_shop.orders;
select * from raw.stripe.payment
```
