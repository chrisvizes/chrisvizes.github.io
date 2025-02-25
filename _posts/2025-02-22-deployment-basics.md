---
layout: post
title: "dbt Deployment"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt, deployment]
image: "courses.png"
cover_image: "dbt-logo.png"
excerpt: "Notes and thoughts on a session about basic deployment in dbt Cloud"
---

## Learning Objectives

1. Understand why it's necessary to deploy your project.
2. Explain the purpose of creating a deployment environment.
3. Schedule a job in dbt Cloud.
4. Review the results and artifacts of a scheduled job in dbt Cloud.

Deployment is running yo stuff on a schedule, but it's also about production environments being kept separate from your wacky dev project branch.

Deployment typically runs off your main branch (but can configure otherwise).

Typically you have a separate warehouse for your production runs vs development, always leaving behind a usable warehouse for the teams downstream.

Typically it is best practice to deploy product dbt projects using a service account separate to what is used in development.

Jobs are typically only for production.
