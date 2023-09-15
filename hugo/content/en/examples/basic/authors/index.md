---
title: Authors
weight: 15
---

In order to add authors to the articles, they need to be set up. This is done by
creating them in the `content/authors/` directory.

## Author set up

For each author, create a new directory inside `content/authors/`. (This
directory's name is the string that's placed inside article front matter, as
shown below.)

Add the author's details to `content/authors/<author-id>/en.md`, inside the
page's frontmatter. For example:

```
---
name: "Tom Hanks"
image: "tomhanks.jpg"
displayName: "Thomas Jeffrey Hanks"
githubLink: https://github.com/<some username>
---
```

All fields are optional.

The "image" field's path is resolved relative to the author's individual
directory, and a fallback image exists.

## Article frontmatter

To reference an author in an article, add (or extend) the following list in the
article's frontmatter:

```
authors:
- <author-id>
```

The "author-id" is the directory name, as described above.
