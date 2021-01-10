---
layout: post
title: ""
author: "Chris Meardon"
categories: blog
tags: [tableau, calculation, formatting]
image: 
cover_image: 

---

In this blog I will describe three methods for dynamically formatting numbers in Tableau and in particular looking at significant figures and decimal places. 

## What Kind of Formatting?

Significant figures, explain with table showing numbers converted to various degrees of significant figures

Significant figures and units (k,m,b), explain with table showing numbers converted to various degrees of significant figures

## Explain three methods without details

### Single calculation formatting a number into a string to N significant figures and units

- Consistent precision (SF only) *✓*
- Minimal calculated fields *✓*
- Simple calculation ✗ 

### Single calculation formatting a number into a string to N decimal places and units

- Minimal calculated fields *✓*
- Simple calculation *✓* 
- Consistent precision (DP only) *✓*

[More on method ](https://playfairdata.com/how-to-dynamically-change-number-units-between-k-m-b-in-tableau/)

### A calculation for each 'kind' of formatting, making use of built-in Tableau formatting

- Simple calculation *✓* 
- Simple formatting *✓* 
- Consistent precision (DP only) *✓*
- Minimal calculated fields *✗*

[More on method](https://www.theinformationlab.co.uk/2016/08/04/label-dynamic-number-formatting-tableau/)