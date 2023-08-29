---
title: Front Matter
weight: 14
date: "2023-08-01"
meta:
    - type: readingTime
      value: 5
tags:
    - Use encodings in CUE
    - Language
    - Ecosystem
authors:
    - pauljolly
---

Hugo uses front-matter to add meta information to a content page. This can be done various formats - in the CUE website we prefer **YAML** (To be decided).

## Default Front Matter

Hugo has a couple of [front matter options](https://gohugo.io/content-management/front-matter/) available by default.
Be sure to read up on the options mentioned below.

- title
- description
- summary
- date
- images
- weight
- draft
- publishDate
- expiryDate


## Custom Front Matter

Additionally there are custom front matter options added to the CUE website, below an overview.

header_type
: You can override the header style rendered on top of the page. Options are `default` and `wide`.
For example the `wide` variant is used in the documentation (via the cascade front matter).

math
: You can add `math: true` to the front matter, if you want to enable [MathJax](https://www.mathjax.org/) on a content page.

meta
: You can show additional meta information below the title of a content page. This is a map of items consisting of a type and value.
: If you include the type readingTime, 'min Read' will be added to the given value.

: When you include a date in the front-matter, it will be automatically included in the meta information.

: Available types:

- readingTime (value is in minutes)

```
meta:
- type: readingTime
  value: 5
```

notification
: You can add a sticky notification on the current page. The `content` allows for simple markdown options.

```
notification:
    content: '**Note:** a sticky note we wanted to show at the bottom'
```

Additionally you can add a button to the notification (the icon param is optional).
```
notification:
    content: '**Note:** a sticky note we wanted to show at the bottom'
    button:
        link: '/download'
        text: 'Download'
        icon: 'download'
```
You can also add a site-wide notification via the config file for params (ex. `config/_default/params.toml`)

tags
: By adding tags in the front-matter, they will be displayed in both the header and footer of the content page. Tags link to `/search?q=tag:{name}` and initiate a search for all documents that contain the respective tag.
```
tags:
- Ecosystem
- Language
```

authors
: adding the author(s) to the frontmatter, makes the content header show an image + name of the assigned author. It also shows a popup on click, with again an image + (display) name, and when available a link to their Github, and a link to the search page so users can search for other articles of this author.

noindex
: adding noindex: true to the front-matter add the meta tag `<meta name="robots" content="noindex, nofollow">` to the head of the page. Also the pages will be excluded from the sitemap.xml.
