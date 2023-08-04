---
title: Front Matter
weight: 14
tags:
    - Use encodings in CUE
    - Language
    - Ecosystem
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
: You can show additional meta information below the title of a content page. This is map of items consisting of a type and value (and optionally a link).
```
meta:
- type: link
  value: Website
  link: https://www.usmedia.nl
- type: person
  value: Joop Verkerke
- type: other
  value: Some info
```
The type will be mapped to an icon, see `/assets/svg/ui` for a full list of possible types.

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
