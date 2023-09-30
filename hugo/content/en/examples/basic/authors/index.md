---
title: Authors
weight: 15
---

In order to add authors to the articles, they need to be set up. This is done by
creating them in the `content/authors/` directory.

## Author set up

For each author, create a new directory inside `content/authors/` using their
GitHub username, referred to as `$user` below.

Add the author's details to `content/authors/$user/en.md`, inside the
page's frontmatter. For example:

```
---
displayName: "Tom Hanks"
---
```

All fields are optional.

## Article frontmatter

To reference an author in an article, add (or extend) the following list in the
article's frontmatter:

```
authors:
- $user
```
