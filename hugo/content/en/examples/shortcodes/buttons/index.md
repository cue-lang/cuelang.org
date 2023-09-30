---
title: Buttons
weight: 21
---

You can use the `{{</* button */>}}` shortcode to add a button/call-to-action to a piece of content.

## Basic usages

```
{{</* button href="/" label="Go to the homepage" */>}}
{{</* button href="/" label="Go to the homepage" icon="download" */>}}
{{</* button href="/" label="Go to the homepage" theme="outline" */>}}
```

{{< button href="/" label="Go to the homepage" >}}
{{< button href="/" label="Go to the homepage" icon="download" >}}
{{< button href="/" label="Go to the homepage" theme="outline" >}}

## Attributes

href
: required - Enter the target, i.e., url of page you want to link to

label
: required - The text that needs to be shown on the button

icon
: optional - You can add an icon for extra emphasis, see the folder `assets/svg/ui/` for possible icons

theme
: optional - If you want to show a button with a different look-and-feel you can change the theme.
Below an overview of options.

size
: optional - If you want to show resize button to be a little smaller with `size="small"`


## Theme

outline
: {{< button href="/" label="Button" theme="outline" >}}

white
: {{< button href="/" label="Button" theme="white" >}}

white-simple
: {{< button href="/" label="Button" theme="white-simple" >}}

red
: {{< button href="/" label="Button" theme="red" >}}

blue
: {{< button href="/" label="Button" theme="blue" >}}

light-blue
: {{< button href="/" label="Button" theme="light-blue" >}}

dark-blue
: {{< button href="/" label="Button" theme="dark-blue" >}}

yellow
: {{< button href="/" label="Button" theme="yellow" >}}

## Sizes

default
: {{< button href="/" label="Go to the homepage" >}}

small
: {{< button href="/" label="Go to the homepage" size="small" >}}
