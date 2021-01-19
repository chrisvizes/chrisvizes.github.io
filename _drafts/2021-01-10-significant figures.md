---
layout: post
title: "Formatting Tableau with Significant Figures, Decimal Places and K, M and B 4232134 to 4.2m"
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

## Three Methods: 

### Significant Figures Method

- Significant figure based precision *✓*
- Minimal calculated fields *✓*
- Simple calculation ✗
- Decimal place based precision ✗

#### Significant Figures Method Calculation

Any `[Number]` can be formatted into `N` significant figures using

```
(round([Number]*(10^(N-CEILING(log([Number],10)))))/(10^(N-CEILING(log([Number],10)))))
```

which can be divided as follows 

```
(round([Number]*(10^(N-CEILING(log([Number],10)))))/(10^(N-CEILING(log([Number],10)))))/(10^(floor(log([Number],10)/3)*3))
```

limiting the result to shown to feature a number ready to add the appropriate unit onto as shown in the result column below.

| Number   | Significant Figures | Unit | Result |
| -------- | ------------------- | ---- | ------ |
| 123      | 1                   |      | 100    |
| 1234     | 1                   | k    | 1k     |
| 123      | 2                   |      | 120    |
| 1234     | 2                   | k    | 1.2k   |
| 123456   | 2                   | k    | 120k   |
| 1234567  | 2                   | m    | 1.2m   |
| 16789123 | 3                   | m    | 16.8m  |

Notice the 

##### Further Ways to Write the Calculation That May Be Easier To Understand

```
(round
    ([Number]*(10^(N-CEILING(log([Number],10)))))
    /(10^(N-CEILING(log([Number],10))))
)
/
(
	10^(floor(log([Number],10)/3)*3)
)
```

------


$$
\frac{Round\left (  \frac{X.10^{\left( N-Ceiling(\log_{10}X)\right )}}{N-Ceiling(\log_{10}X)}\right)
}{10^{3.Floor\left(\frac{\log_{10}X}{3}\right)}}
$$

------

$$
\frac{Round\left (  \frac{10^{A}X}{A}\right)
}{10^{3.Floor\left(\frac{\log_{10}X}{3}\right)}}
$$
where 
$$
A = N-Ceiling(\log_{10}X)
$$

### Single calculation formatting a number into 



### a string to N decimal places and units

- Minimal calculated fields *✓*
- Simple calculation *✓* 
- Decimal place based precision *✓*
- Significant figure based precision ✗ 

[More on method ](https://playfairdata.com/how-to-dynamically-change-number-units-between-k-m-b-in-tableau/)

### A calculation for each 'kind' of formatting, making use of built-in Tableau formatting

- Simple calculation *✓* 
- Simple formatting *✓* 
- Decimal place based precision *✓*
- Minimal calculated fields *✗*
- Significant figure based precision ✗

[More on method](https://www.theinformationlab.co.uk/2016/08/04/label-dynamic-number-formatting-tableau/)