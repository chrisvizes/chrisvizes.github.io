---
layout: post
title: "DevOps in Tableau Next & Data360"
author: "Chris Meardon"
categories: blog
tags: [tableau next, salesforce, data360]
image: 
cover_image: 
excerpt: ""
---

My background is more in the Tableau Core products, but I've been working in Tableau Next and Data360, developing content for clients. And the differences between how we develop content, where we do it, where we promote it to when it's ready for users, all of that sort of development for DevOps around content is fundamentally different.

Therefore it's worth us comparing the two. And I hope that's helpful for others that were in a similar scenario to me.

# How it works in Tableau Core

In Tableau Core products, mostly thinking about Tableau Server and Tableau Cloud, typically dev, UAT and prod environments are handled via projects. In some scenarios they could be via sites, but typically it's via projects. And to move content from one project to another is a simple task of moving a sub-project into prod from UAT, for example. It's not a very complicated process, nor rigorous. You can develop your content in a project and then just move it to another one.

<!-- Diagram suggestion: side-by-side promotion comparison. Left: Tableau Core (Dev project to UAT project to Prod project, single arrow, "just move it"). Right: Data360/Tableau Next (Sandbox, DevOps data kit, change set or CLI, Production). This is the single image that carries the whole post. -->

# How it works in Tableau Next & Data360

In a Salesforce org things are typically handled a bit differently. There are more comprehensive DevOps features that you can make use of which handle this migration process.

## What you're migrating

In Tableau Server and Tableau Cloud, we're typically dealing with workbooks, published data sources, things like that. To promote content, we're simply moving it to another project, wherever that be, via the GUI or via an API.

In Data360 and Tableau Next things are a bit different. The artifacts you have that you want to migrate are things like:

- Data Streams
- Data Lake Objects (DLOs)
- Data Model Objects (DMOs)
- Mappings
- Data Transforms
- Calculated Insights

These are all just metadata. You might say the Data Lake Object is an actual file, but really within the Salesforce environment it's just pointing to where it's stored. So all of that is just metadata about data pipeline content.

## Sandboxes

The way you'd separate your development from your prod would be via sandbox orgs or similar lower down environments. You can think of these as replications of prod but completely separate. So you get like copying prod into a sandbox and then you can work within that sandbox. In that sandbox is typically where you're gonna be doing this kind of development, and to move it from there to prod there are a few different features: you have change sets, you have the Salesforce command line interface and you have data kits. Some things you have to set up separately between the two environments; those are things which don't move and have to be set up in both. So DevOps within Salesforce is going to follow the Salesforce application life cycle management, or ALM, and we're going to apply that to the Data360 and Tableau Next content. So you develop in a sandbox and deploy to production.

A Data360 sandbox is a metadata only copy of your production Data360 org. It supports all sandbox types (developer, developer pro, partial copy, full copy) but never copies data. To use Data360 in a sandbox you must have it turned on and licensed in production. The core pipeline objects (DLOs, DMOs, Data Transforms, Calculated Insights, Data Graphs etc.) are all replicated and deployable. Several activation targets and connectors are not. In the documentation there is a matrix of what is supported. The table is quite long, so it's worth having a look at that if you're interested in this process.

## Data kits

Data kits wrap around packageable Data360 metadata so that you can create and deploy complete solutions. It's the closest thing to a deployable bundle of your pipeline, and there are two types:

- **Standard data kits** package and distribute a solution. You could use these to provide or package up content to give to a customer, or to put something onto the AppExchange. They're created from a developer edition org and you can deploy them to any data space in the target org.
- **DevOps data kits** are about migrating metadata between your own orgs, sandbox to production or production to production, not for distribution. They can be created from any data space but must deploy to the same data space in the target org. Connector information is added automatically.

So for internal DevOps you're looking at the DevOps data kit.

## Transports

A data kit is the payload; you still need a transport. Data360 supports three, and they map onto familiar CI/CD maturity levels:

- **Change sets**: the point and click org-to-org transport. Good for getting started and for teams without a pipeline. You add the data kit to a change set as a Data Package Kit Definition component.
- **The Salesforce CLI**: the scriptable transport, and the real automation hook. This is what you put in a git driven pipeline.
- **The Metadata API**: which I haven't seen much of yet, but understand it's for sandbox to sandbox.

For distribution rather than internal promotion, there is also the managed package path via Package Manager.

<!-- Diagram suggestion: anatomy of a deployment. A "data kit" box containing the artifact types (the payload), with three arrows out labelled change sets / Salesforce CLI / Metadata API (the transports). Reinforces "the data kit is the payload, you still need a transport". -->

# The workflow: promoting from sandbox to production

So what is the actual process, the workflow to promote content from sandbox to production? First of all, you'll need the Data Cloud Architect permission set to do any of this, so make sure you've got that.

1. **Create a deployment connection** in the production target org. Authorize inbound change sets from the sandbox source org.
2. **Create a DevOps data kit in the sandbox.** Set data kit type to DevOps, choose the same data space (the same name data space must exist in production), add the Data360 components to deploy and review the publishing sequence. Components publish in creation date order.
3. **Create and upload an outbound change set in the sandbox.** Add the DevOps data kit as a Data Package Kit Definition. Add its dependencies (scroll through all pages of components), and for a custom DMO add its relationships as Field Source Target Relationship components. Delete any key qualifier files for DMOs/relationships. Upload.
4. **Deploy the inbound change set in production.** This installs the data kit and its components. Verify on the data kit's Deployment History tab.

If a component fails, everything after it in the sequence is skipped. If you later push the same kit for another change set, it installs but does not redeploy components: open the kit and click Deploy Data Kit.

The Salesforce CLI performs the same move scriptably, which is how you wire it into your CI.

To move metadata across two production orgs, you hop through sandboxes: Prod A to Sandbox A, then Sandbox A to a sandbox linked to Prod B, then into Prod B.

<!-- Diagram suggestion: prod-to-prod hop. Prod A to Sandbox A to Sandbox B to Prod B. Small, but the sentence above is hard to follow without it. -->

# The semantic layer

The semantic data model (SDM), the layer Tableau Next visualizations actually query, sits on top of your DMOs and is itself first-class Salesforce metadata. This means two things:

- **It packages into a data kit.** A data kit includes all the semantic definitions, such as the data objects, the relationships, parameters, calculated fields and metrics. However, a data kit doesn't include dependencies like data streams and calculated insights, so those must already exist in the target before you deploy the model.
- **API names are immutable.** You can't change the API name after the model is created, and changing a model's API name on deploy can break definitions and cause inconsistency with newer versions. Stable API names, i.e. on the model, calculated fields, groups, metrics, are the linchpin of repeated deployment. Decide naming upfront the way you would treat a database schema.

# The analytics content layer

Tableau Next content deploys through the same Salesforce ALM machinery; it's not a gap. Workspaces, visualisations and dashboards are first-class Metadata API components, so you move them with change sets, the Salesforce CLI or a data kit, exactly like the data layer. Three rules govern it:

**1. The semantic model and the content can't ride in the same change set.** To quote the documentation, "semantic models and Tableau Next assets can't be deployed in a single change set". You must deploy semantic models using data kits. So the usual split is: the SDM and Data360 assets via a data kit, and the workspaces, visualisations and dashboards via a change set or the CLI. Or bundle everything together in one data kit.

**2. Deploy in dependency order or it fails.** The publishing sequence must be semantic models, workspaces, visualisations, dashboards. In a data kit, if you don't review and update the publishing sequence, data kit deployment will fail. Selecting a visualisation or dashboard auto adds its workspace.

<!-- Diagram suggestion: publishing sequence. Semantic model, then workspace, then visualisation, then dashboard as a simple ordered chain, sitting next to rule 2. -->

**3. Companion orgs don't take data kits.** The Data360 companion org can't receive a data kit, so semantic models can only deploy to the home org. To light up Tableau Next content in a companion org: deploy the SDM to the home org, confirm it has synced to the companion, then deploy the workspace, visualisations and dashboards to the companion with a change set.

<!-- Diagram suggestion: companion org flow. SDM to Home org, sync to Companion org, with content arriving at the companion via a change set. Optional, but this is the fiddliest bit of the post. -->

## Limits and permissions

There are some limits to plan around: 50 instances per deploy, 100 per retrieve request, and 100 deploys per entity type per day.

Permissions:

- Creating/editing assets needs **Tableau Next Platform Analyst** or **Tableau Next Unlimited Platform Analyst**.
- Change sets need **Create and Upload Change Sets**, **Deploy Change Sets**, and **Modify Metadata Through Metadata API Functions**.
- Data kits need **Data Cloud Architect**.

Scripted CLI deployment is documented in the Tableau Next ISV/developer guide.

# The contrasts that matter most

So this process is quite different to Tableau Core products. And let's explore the contrasts that matter the most.

## The data never travels

A sandbox is metadata only. You deploy the pipeline definition, then connect sources and ingest data in each org. There is no "publish the extract" step, and no way to clone production data into a sandbox for testing. Re-ingest or use representative test data.

## One pipeline, not two concerns

In Tableau Server/Cloud, the data platform and BI content are deployed by different teams with different tools. In Data360 and Tableau Next, ingestion, modelling, semantic layer and analytics are all in one org and move through one ALM process. Even a dashboard is a Metadata API component, not an opaque TWBX. The data engineer and BI developer promotion paths converge onto the same sandbox to production deployment.

## Connectors deploy inactive

A data stream connector arrives in the target org disabled. You add credentials and activate it there. On later deployments, if an active connector already exists, the deploy ignores changes to its attributes.
