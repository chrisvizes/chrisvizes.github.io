---
layout: post
title: ""
author: "Chris Meardon"
categories: blog
tags: [Tableau Server, Tableau Desktop]
image: "data-source-error.png"
cover_image: "data-source-error.png"
---

## The Scenario

When creating a datasource using custom SQL for Tableau Server, Tableau Cloud or Tableau Desktop there is an issue that arises when one of the fields used in the query no longer exists. Tableau errors when you use this datasource and won't let you edit it anymore. It will return an error like `Unable to proceed because of an error from the data source` with details like `Invalid column name`.

## The Solution

If you cannot edit the query within desktop/server/cloud then don't panic, we can recover the original query and then rebuild the datasource.

### 1. Download the datasource or workbook

- If you have the issue within Tableau Desktop (rather than a server product) then skip this step.
- If you are using Tableau Cloud or Server then navigate to the datasource or workbook and download it. The file will be a `.tdsx` (packaged datasource) or `.twbx` (packaged workbook)

### 2. Unpackage the datasource / workbook

- If your issue is with a `.twb` file or `.tds` then you can skip this step

The 'x' at the end of `.twbx` or `.tdsx` tells you it is a packaged workbook / datasource and we want to edit the files within it and so must unpackage it.

Fortunately this is simple to do, just change the file extension from `.tdsx` or `.twbx` to `.zip`, e.g.

```
my_datasource.tdsx
```

to

```
my_datasource.zip
```

Then unpackage this file using the "extract all" feature in windows, or your favourite unpackaging tool.

### 3. Open the .twb or .tds file with a text editor

Workbooks (`.twb`) and datasources (`.tds`) are just XML containing all of their configuration. If you know what you're doing and you are careful, you can edit the XML yourself to make changes. That is what we are going to do. All you need is a text editor, e.g. notepade or VS Code.

Open up the `.twb` or `.tds` file with a text editor.

### 4. Find the Custom SQL

I would recommend using the search feature in your text editor to look for `'Custom SQL Query'` or for common words using in SQL like `select`, `from`, `where` etc. This should help you narrow down the part of the XML where your query is stored.

### 5. Make changes to the query

Whatever the issue was with the query you can now fix and save the file. Just make sure the syntax is perfect as you will not get any prompts about errors with it here.

### 6. Repackage your file

If you started with a packaged file (i.e. `.twbx` or `.tdsx`) then you now need to package it back into a zip file. You can do this using the `Compress to zip file` option in windows.

### 7. Change the file extension back

Change the `.zip` extension back to what you started with (i.e. `.twbx` or `.tdsx`).

### Finally, open it up to test

You're now ready to open up the file in Tableau Desktop to test whether it works and then publish back to server/cloud if needed.

## Extending the Solution

We changed the custom sql used here, but you can extend this trick to change any of the configuration inside a workbook or datasource. Below are some examples of where I use this same trick to achieve different goals:

### Precision size adjustments

In Tableau Desktop it is hard to precicely set the size of a mark to be the same across multiple sheets. However, if you open up the `.twb` file and find the part that sets the size of the mark, you can set the pixel size manually yourself. It allows much greater consistency and precision than using the Tableau Desktop interface.

### Transparent colour hexcodes

Another handy trick is creating hexcodes with transparency. In the Tableau Desktop interface you are limited to what colour hex codes you can use, notable not letting you add transparacy values. However editing the `.twb` file, like done here, you can add these values.

### Repointing file paths

Perhaps the most common use case of this trick is to mass edit the file paths used in a workbook. Let's saw your datasource reference a file path specific to your user and you give the workbook to a colleague who has a different file path (perhaps a networked file path) to those files. You can use this trick to edit the file paths all at once using find and replace on the `.twb` file.
