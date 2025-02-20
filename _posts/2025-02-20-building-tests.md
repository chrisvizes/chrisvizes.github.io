---
layout: post
title: "Building Tests"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt, tests]
image: "courses.png"
cover_image: "dbt-logo.png"
excerpt: "Notes and thoughts on a session about building tests in dbt Cloud"
---

## Learning Objectives

1. Explain why testing is crucial for analytics.
2. Explain the role of testing in analytics engineering.
3. Configure and run generic tests in dbt.
4. Write, configure, and run singular tests in dbt.

In general I love tests, so maybe we're in for a good one here.

I need no justification of why tests are good.

`dbt test` runs tests

Two kinds of tests here.

- **Singular** Specific tests are one offs, for a specific end result. Perhaps validating a column that appears in a single dashboard down the line
- **Generic** Basic tests, highly scalable, included as standard: unique, non_null, relationships, accepted_values

That list of generic tests is pretty obvious what they all do aside relationships, this one asserts that the unique values in a column each exist in another column of another table.

You can write your own generic tests, but I'm not yet allowed to know how. The course confines me. A prison of information.

There are also packages for more tests you can get (lets gooooo)

You can see how the test has been compiled into sql in the _logs_ of a test after you run it.

## Singular Tests

After seeing a demo of a singular test, it looks like the idea is:

- Write a sql query
- Put it into a tests folder
- Add test to configuration
- If test returns data, test fails... (I think)

## Where can you apply tests?

- Test **models** to see if project is working as expected
- Test **sources** to see if the data you rely on is as expected
  - You apply them in the same place, configuration

It feels like tests of a column on a model, could be flow back to a test on the source... I wonder if that is a feature of some sort.

Looks like testing a source is a bit of a different command to run that testing models, like tests were made for models and adapted for sources too.
`dbt test --select <model_name>`
or
`dbt test --select source: <source_name>`

## When does testing apply?

Testing applies after models have been built. So you need a way to run a model before you can test it. If you just run `dbt run` to build all the models and then you run `dbt test` to test all the models, you may be running and testing downstream models that have a failure upstream. Introducting `dbt build`.

Building will test sources, then run the first set of models, then test those models, then run the next ones, etc, working through the DAG.

## What happens if a failure occurs upstream?

Models downstream are skipped (i.e. not run) (but I think some of the deploy config maybe alter this).
