---
layout: post
title: "Introducing ZipLogsAnonymizer"
author: "Chris Meardon"
categories: blog
tags: [blog, tools, open source, security, logs]
image: "ziplogsanonymizer/gui.png"
cover_image: "ziplogsanonymizer/gui.png"
excerpt: "I built a tool to strip sensitive data from log files so you can share them without worrying about leaking passwords, emails or internal infrastructure details."
---

## Why I Built This

If you've ever had to troubleshoot an issue with support — whether it's Tableau, Salesforce or some other vendor — you've probably been asked to send over your logs. And if you've ever actually opened those logs, you'll know they're full of stuff that probably shouldn't leave your organisation. Usernames, email addresses, internal hostnames, maybe even the occasional password sitting in a connection string. It's a mess.

The usual options are:

1. Send the logs anyway and hope for the best
2. Spend hours manually redacting files
3. Just... don't send them and try to solve the problem blind

None of those are great. **So I made a tool to do it properly.**

---

## What ZipLogsAnonymizer Does

[ZipLogsAnonymizer](https://github.com/chrisvizes/ZipLogsAnonymizer) takes a zip file full of logs, scans every text file inside and replaces sensitive information with safe placeholders. Then it spits out a clean version you can actually share.

**What gets redacted:**

- Passwords and API keys (detected through context like `password=` or `apikey:`)
- Email addresses
- Usernames
- Private IP addresses (10.x, 192.168.x, 172.16-31.x ranges)
- Internal hostnames (.corp, .local, .internal domains)
- UNC paths and MAC addresses
- Database connection strings
- Private keys and certificates
- And for the Tableau folks: site names, workbook names, datasource names and project names

**What stays untouched:**

- External IPs (usually needed for troubleshooting)
- Timestamps
- Error messages and stack traces
- The stuff you actually need to diagnose the problem

I also included a feature to help with **consistency**. If the same email address appears 50 times across different files, it'll get the same placeholder every time. So you can still trace things through the logs without knowing the actual value.

---

## How To Use It

**If you're on Windows**, you can just download the exe from the [releases page](https://github.com/chrisvizes/ZipLogsAnonymizer/releases) and run it. No Python, no setup, just open her up.

**If you're on Mac/Linux** (or prefer the command line), clone the repo, install the requirements and run:

```bash
python3 anonymizer.py /path/to/your/logs.zip
```

You'll get two outputs: an anonymized zip file (handy for tools like LogShark) and an uncompressed folder so you can browse the results.

---

## Performance

I was a bit worried this would be painfully slow, but it's actually decent. **Roughly 11 MB/s throughput** thanks to parallel processing. A chunky 1.8GB zip file processes in under 30 minutes. For most support cases, your logs will be ready in seconds or a few minutes at most.

---

## A Word of Caution

This tool is **not a magic security guarantee**. It uses pattern matching and context detection, which means it can miss things — especially custom application data, full names or anything in a format it doesn't expect. If you're dealing with highly sensitive data, **always review the output before sharing**.

It also only processes text files. Binary files pass through unchanged, which is usually fine for logs but worth knowing.

---

## Go Try It

If this sounds useful, grab it from GitHub: [https://github.com/chrisvizes/ZipLogsAnonymizer](https://github.com/chrisvizes/ZipLogsAnonymizer)

And if you find bugs or have ideas for improvements, let me know. This started as a tool I built for myself, but hopefully it saves someone else a few hours of manual redaction too.
