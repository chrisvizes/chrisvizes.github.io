---
layout: post
title: "Basic Documentation"
author: "Chris Meardon"
categories: blog
tags: [blog, dbt, tests]
image: "courses.png"
cover_image: "dbt-logo.png"
excerpt: "Notes and thoughts on a session about basic documentation in dbt Cloud"
---

## Learning Objectives

1. Explain why documentation is crucial for analytics.
2. Understand the documentation features of dbt.
3. Write documentation for models, sources, and columns in .yml files.
4. Write documentation in markdown using doc blocks.
5. Generate and view documentation in development.
6. View and navigate the lineage graph to understand the dependencies between models.

Okay so there are multiple places you can add the documenation information to your project. Sources, models, columns all had ways to add documenation for them. This documentation either lives in the configuration yml file for that object or you can reference to a markdown file within the project.

For example, the model can have a description and the columns can too:

```yml
models:
  - name: stg_jaffle_shop__customers
    description: Staged customer data from our jaffle shop app.
    columns:
      - name: customer_id
        description: The primary key for customers.
        tests:
          - unique
          - not_null
```

The description can bee a doc reference too:

```yml
models:
  - name: stg_jaffle_shop__orders
    description: Staged order data from our jaffle shop app.
    columns:
      - name: order_id
        description: Primary key for orders.
        tests:
          - unique
          - not_null
      - name: status
        description: {% raw %}{{ doc('order_status') }}{% endraw %}
        tests:
          - accepted_values:
              values:
                - completed
                - shipped
                - returned
                - placed
                - return_pending
```

The doc reference is referencing a docs object inside a markdown file in the project. To reference it you use the object name (you don't need to know the file path to the markdown). E.g. 'order status' is the docs name within the markdown file:

```markdown
{% raw %}{% docs order_status %}{% endraw %}

One of the following values:

| status         | definition                                       |
| -------------- | ------------------------------------------------ |
| placed         | Order placed, not yet shipped                    |
| shipped        | Order has been shipped, not yet been delivered   |
| completed      | Order has been received by customers             |
| return pending | Customer indicated they want to return this item |
| returned       | Item has been returned                           |

{% enddocs %}
```

## Building the documentation

So you've added all the information to the objects within you project, now you can **build** the documenation using:

`dbt docs generate`

This creates a documenation interface you can now access (if it runs successfully) using the button up here:

![docs-button]('assets/img/docs-button.png')
