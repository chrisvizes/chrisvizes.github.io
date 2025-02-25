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

The syntax for Jinja in dbt conflicts with the builder for Jekyll when creating this blog site. Double curly brackets are used for Liquid templates on the site so if I include Jinja in code snippets the builds fail.

## How to get around it

To tell Liquid not to use the syntax you can surround it with `{% raw %}` and `{% endraw %}`.

If it's inline code you can just use {% raw %}`{% raw %}{% docs order_status %}{% endraw %}`{% endraw %}.

For block code, I've been surrounding the entire block:
{% raw %}
\{\% raw \%\}

```yaml
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
        description: {{ doc('order_status') }}
        tests:
          - accepted_values:
              values:
                - completed
                - shipped
                - returned
                - placed
                - return_pending
```

\{\% endraw \%\}
{% endraw %}
