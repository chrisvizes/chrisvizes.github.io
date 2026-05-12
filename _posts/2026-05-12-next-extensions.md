---
layout: post
title: "You're telling me I can vibe-code a dashboard?"
author: "Chris Meardon"
categories: blog
tags: [tableau, tableau next, salesforce]
image: 
cover_image: 
excerpt: "Tableau Next Dashboard Extensions"
---

Recently a new button appears on the toolbar of dashboards in Tableau Next: Extensions.

When you click it, it shows all Lightning Web Components (LWCs) that have a target of an "analytics dashboard". Make sure your agent is including that correct target. It takes a little while to find them as it is compiling and running various checks to generate the list of options for you.

## You add your extension, but "We couldn't display this content."

We can open developer tools in our browser to help. In the console errors are shown which we can check. This error could be shared back with the agent that built it or something you could change yourself. 

## So what does the Agent generate?

A lightning web combonent, which is made up of standard web assets:

- CSS
- HTML
- JS
  - Where the cool stuff is
- js-meta.XML

## You can work on your extensions all together

When working on your extensions you are working from a repo that could contain all of your extensions. When applying changes you could then apply them across all.

## Things you want you LWC to do

- Use a specific semantic model
- Create live, reactive visualisations with tooltips
- Create filterable visualisations
- Use the Extensions SDK from Salesforce

## Package Manager

Within the setup of a Salesforce Org, there is a page under Packaging -> Package Manager.

Here you can create packages using first generation packaging where you build the package in the orgs UI in the browser. Second generation packaging is where you can use a repo, like from GitHub.

You add a component with type Lightning Web Component and add the resources and pages. 

This generates a package of this extention that has an installation URL which can be shared with others so they can install it.

# Relevant docs

1. [Integrate Custom LWC in Dashboards with the Extensions SDK](https://developer.salesforce.com/docs/analytics/tableau-next-isv-dev/guide/tn-development-dashboard-extensions.html)
2. [Tableau Next Model Context Protocol (MCP) Server](https://help.salesforce.com/s/articleView?id=analytics.tua_data_sdm_mcp.htm&type=5)
3. [Semantic Model docs](https://help.salesforce.com/s/articleView?id=analytics.tua_data_sdm_about_models.htm&type=5)
4. [Semantic Query API Quick Start Guide](https://developer.salesforce.com/docs/data/semantic-layer/guide/quick-start-query-api.html)
5. [Developer Guide on Extensions](https://developer.salesforce.com/docs/analytics/tableau-next-isv-dev/guide/tn-development-dashboard-extensions.html)

# Some Lessons

## Ensuring your targest include analytics dashboards

Set up the following in the js-meta.xml:
```
<targets>
    <target>analytics__Dashboard</target>
</targets>
```

## Query Limits

The query limit property needed for setting up the extension is less than 10,000, maybe more like 1k or 5k.

## Using Salesforce d3 JS repo

Use the following to import D3:

`import D3 from "@salesforce/resourceUrl/d3";`

# Roadmap

This is a very new feature and many parts are live today, like:

1. Custome LWCs - Build extensions with lightning web components
2. Dashboard Extension SDK - Event-drive integrations (filters, parameters, selections, data)
3. AppExchange Distributions - Pulish your extensions, reach thousands of customers
4. AI-powered Development - LWC skills for rapid extension creation

Hopefully coming soon:

1. Dynamic Data Binding - SDM picker UI & field mappings (helps removing hard coding of SDMs in extension)
2. Platform Interoperability - Enhanced filter propagation, Tableau Classic/CRMA integration
3. Skills & Plugin Exosystem - Reusable, confiurable extension templates
4. Developer Experience - Starter templates, improved debugging, better extension management
5. Agentic Dashboard Authoring - Generates extensions & configure dashboards on-the-fly with natural language

# Do Extension in Next Replace Existing Charts?

No, use extensions as a way to achieve a goal that Next can't do. It's much easier in terms of development, maintainance and integration to use what's in the product. But maybe you can do someting cool in an extension that isn't currently supported.