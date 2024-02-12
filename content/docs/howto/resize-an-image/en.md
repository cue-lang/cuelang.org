---
title: How to resize an inline image on cuelang.org
---

This page contains the file `content/blog/example/cow.jpg` as an inline image,
using various markdown, Hugo, and raw HTML mechanisms to insert it onto the
page. All the images have the same visual width, despite my attempts to shrink
them ... except the last image on the page.

## Markdown default

```markdown
![A cow](/blog/example/cow.jpg)
```
![A cow](/blog/example/cow.jpg)

## HTML default

```html
<img src="/blog/example/cow.jpg" />
```
<img src="/blog/example/cow.jpg" />

## Figure shortcode with numeric width attribute

```
{< figure src="/blog/example/cow.jpg" width=50 >} (double {{/}} are used in the source)
```

{{< figure src="/blog/example/cow.jpg" width=50 >}}

## HTML with width attribute

```html
<img src="/blog/example/cow.jpg" width="75" />
```
<img src="/blog/example/cow.jpg" width="75" />

## HTML with height attribute

```html
<img src="/blog/example/cow.jpg" height="75" />
```
<img src="/blog/example/cow.jpg" height="75" />

## HTML with width and height attributes

```html
<img src="/blog/example/cow.jpg" width="75" height="50" />
```
<img src="/blog/example/cow.jpg" width="75" height="50" />

## HTML with width set in a style attribute

```html
<img src="/blog/example/cow.jpg" style="width:75px;" />
```
<img src="/blog/example/cow.jpg" style="width:75px;" />
