---
layout: post
title: "Set up dbt Cloud"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt]
image: "dbt-logo.png"
cover_image: "dbt-logo.png"
---

# Learning Objectives

1. Load training data into your data platform
2. Set up an empty repository and connect your GitHub account to dbt Cloud.
3. Set up your warehouse and repository connections.
4. Navigate the dbt Cloud IDE.
5. Complete a simple development workflow in the dbt Cloud IDE.

This session is all about getting into the tool and using it. I've got my connections to snowflake and github sorted out (partly by our admin here on dbt cloud). But so far I'm a little lost. I expected to open the develop view and have a blank slate, but instead there is a sample project there... okay... I create a blank worksheet to test pulling in some data from snowflake as the lesson suggests but I can't seem to find any snowflake tables... hmmmm The only auto complete I'm getting after the _from_ is sql syntax, rather than databases/tables etc. hmmm maybe it is something to do with that I am on the main branch in this _project_(?). Looks like there is a dropdown to change branch and people have their own ones in here with test-like names for learning. I should make one. I think that needs to be done in github... but I don't know what the github repository is called.

So I spoke to people internally and the repository is listed against the project in the setting. It is a repo hosted by dbt. So I still don't know how to make a new branch but I do have more clues.

Learning things is hard

TO MAKE A BRANCH YOU HAVE TO BE IN MAIN AND CLICK MERGE THIS BRANCH TO MAIN (even though that's not what you want to do) AND THEN YOU CAN CREATE A BRANCH. SO SILLY

Turned out I just needed to watch this session and the quiz was super easy. It's just an overview of the interface
