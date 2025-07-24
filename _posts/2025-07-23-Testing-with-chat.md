---
layout: post
title: "Testing to Learn"
author: "Chris Meardon"
categories: blog
tags: [blog, tableau, tableau next]
image: "tableau-next-cover.jpg"
cover_image: "tableau-next-cover.jpg"
excerpt: "First steps with Tableau Next"
---

So far, Tableau Next is feeling pretty simple to use. Add a connection to data in Data Cloud, create a Semantic Model in Tableau Next using the connection in Data Cloud (potentially adding metrics here too), make Visualisations and then add them to Dashboards. I'm findding that reading and watching more content about Tab Next is not helping me learn and my engagement is falling with it. So I decided to take it to an LLM chatbot and asked it to quiz me and then dive into the areas I fail to answer well on. So far it is feeling like a useful tool, but does come with some issues:

1. There isn't much training material out there about Tableau Next and so the model is likely to hallucinate
2. Validation of what it is saying is part of the conversation, so I cannot trust it
3. It might not fight back hard enough against my wrong answers, giving a false impression of answering correctly

However, despite this, I am finding it a useful way to test what I know and discuss the parts I don't know that well. I am at least much more engaged with a conversational way of learning that I am with watching more demos. I also feel like some of these problems are solvable with providing more context for the bot. I'm thinking a system to scrape the Tableau Next documenation to bring into the context would be a good start but does this site exist?

There is this: https://help.tableau.com/current/online/en-us/tableau_next_overview.htm
and: https://help.salesforce.com/s/articleView?id=analytics.tua.htm&type=5 (including all the many many sub-pages within it)
Also this: https://www.tableau.com/blog/tableau-next-faq
Also this: https://www.tableau.com/blog/what-is-tableau-plus
also: https://www.tableau.com/blog/agentic-analytics-new-paradigm-for-business-intelligence
also: https://www.tableau.com/blog/how-ai-powered-semantics-ensure-trustworthy-intelligent-agentic-analytics
also: https://www.tableau.com/blog/rethinking-analytics-agentic-enterprise

Okay so I have now scraped all of these resources into a single document.

Providing this document to a chatbot, it came up with the following questions to get a baseline of my understanding:

### 1. Core Features and Capabilities

Q1. In your own words, what is agentic analytics, and how does Tableau Next embody this concept?

Q2. What are the four layers of the Tableau Next architecture, and how do they interact?

Q3. How does the semantic layer in Tableau Next differ from traditional Tableau data sources or published data sources?

Q4. Name and describe the role of at least two agentic assistants in Tableau Next.

Q5. What is the purpose of the Action Layer in Tableau Next, and how does it link with Salesforce Flow?

### 2. Business Value and Fit

Q6. If a company is already using Salesforce extensively, what unique advantages would Tableau Next offer compared to traditional Tableau Desktop or Cloud?

Q7. How does Tableau Next serve a business that does not use Salesforce products? Is it still a worthwhile investment?

Q8. What impact does Tableau Next have on the workflow of customer support, sales, or operations teams compared to traditional BI tools?

### 3. Advising Organizations

Q9. A business wants to reduce duplication of semantic definitions and improve data trust. How would Tableau Next help?

Q10. What are some potential limitations or drawbacks of Tableau Next today that you would raise with a client before recommending adoption?

Q11. How would you position Tableau Next differently to:

- A data-savvy Tableau team familiar with PDS and custom dashboards
- A Salesforce CRM admin team with limited BI experience

### 4. Innovation and Strategic Thinking

Q12. Imagine you’re helping a retail company. What’s one innovative use case for Tableau Next that involves Agentforce and could improve operational efficiency?

Q13. How might the composable architecture of Tableau Next support cross-team collaboration or analytics scaling across departments?

Q14. How would you use the Marketplace in Tableau Next to drive faster dashboard creation across an enterprise?

### 5. Technical Knowledge and Readiness

Q15. What are DMOs, DLOs, and CIOs, and how are they used within Data Cloud and Tableau Next?

Q16. What are some ways Tableau Next supports governance and trust in AI-generated insights?

Q17. Can Tableau Next be used in hybrid environments (e.g., cloud + on-premise)? If so, how?

Q18. How does Tableau Next handle semantic learning, and why is this important for agent accuracy?

Q19. What is the difference between Tableau Next and Tableau Pulse or Tableau Agent?

Q20. If you needed to create a dashboard in Tableau Next that responds to natural language questions and also updates Salesforce records — what are the key components you'd need?
