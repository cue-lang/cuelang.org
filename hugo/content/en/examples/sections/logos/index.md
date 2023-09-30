---
title: Logos
weight: 41
---

You can use the `{{</* logos */>}}` shortcode in combination with the `{{</* logos__item */>}}` to add a logo section to your content.

Since there is the option to add markdown to the `{{</* logos__item */>}}`, this shortcode should **always** be closed, even when there is no markdown used. So when there is no markdown used you use the shortcode like this:

```
{{</* logos__item /*/>}}
```
**notice the slash (/)*

Ofcourse, when there is markdown, you close the shortcode like any other

```
{{</* logos__item */>}}
...
{{</* /logos__item */>}}

```

## Example

```
{{</* logos
    bgColor="white"
    title="Title of logos section"
    intro="This is the intro of the section"
    buttonText="Show me more"
    buttonUrl="/examples"
*/>}}
    {{</* logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
        alt="Logo of GerritForge"
        name="GerritForge"
        lazy=false
        popup=true
    */>}}

## Lorem Ipsum

Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas a blanditiis,
quis dicta incidunt ipsum iure at laborum? Dolore recusandae ullam maxime
perspiciatis autem rem cumque possimus, aperiam optio at sunt. Accusantium
maxime ab facere ea repellat ipsum iusto! Nostrum similique repudiandae eveniet
nemo non. Libero reiciendis sapiente corrupti voluptatem!

    {{</* /logos__item */>}}

    {{</* logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
        popup=true
        buttonUrl="/examples/"
        buttonText="Show case study"
    */>}}

## Lorem Ipsum

Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas a blanditiis,
quis dicta incidunt ipsum iure at laborum? Dolore recusandae ullam maxime
perspiciatis autem rem cumque possimus, aperiam optio at sunt.

Accusantium maxime ab facere ea repellat ipsum iusto! Nostrum similique
repudiandae eveniet nemo non. Libero reiciendis sapiente corrupti voluptatem!

    {{</* /logos__item */>}}
{{</* /logos */>}}
```

{{< logos
    bgColor="white"
    title="Title of logos section"
    intro="This is the intro of the section"
    buttonText="Show me more"
    buttonUrl="/examples"
>}}

    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
        alt="Logo of GerritForge"
        name="GerritForge"
        lazy=false
        popup=true
    >}}

## Lorem Ipsum

Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas a blanditiis, quis dicta incidunt ipsum iure at laborum? Dolore recusandae ullam maxime perspiciatis autem rem cumque possimus, aperiam optio at sunt. Accusantium maxime ab facere ea repellat ipsum iusto! Nostrum similique repudiandae eveniet nemo non. Libero reiciendis sapiente corrupti voluptatem!

    {{< /logos__item >}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
        popup=true
        buttonUrl="/examples/"
        buttonText="Show case study"
    >}}

## Lorem Ipsum

Lorem ipsum dolor sit amet consectetur adipisicing elit. Quas a blanditiis, quis dicta incidunt ipsum iure at laborum? Dolore recusandae ullam maxime perspiciatis autem rem cumque possimus, aperiam optio at sunt.

Accusantium maxime ab facere ea repellat ipsum iusto! Nostrum similique repudiandae eveniet nemo non. Libero reiciendis sapiente corrupti voluptatem!

    {{< /logos__item >}}
{{< /logos >}}

## Attributes

### Logos shortcode

bgColor
: optional - Set the background color of the section

buttonText
: optional - Enter the text for the button

buttonUrl
: optional - Enter the target, i.e., url of page you want to link to

intro
: optional - Enter the introduction text of the section

title
: optional - Enter the title of the section

### Logos item shortcode

src
: required - Enter the path to the image

alt
: optional - Enter the alt title for the image (recommended for SEO)

lazy
: optional - default value is true. When this section is the first section you might want to set this value to false (recommended for first meaningfull paint). In this case set lazy to `false`

link
: optional - Enter the target, i.e., url of page you want the logo to link to. In case popup is set to true, this link will be used for the logo in the popup

name
: optional - Adds the name of the company to the screenreader link

popup
: optional - If set to true, clicking the logo will result in a popup which contains the logo, and -if filled in- the description and/or button

description
: optional - Only used when popup is set to true. Enter the text you want to show in the popup

buttonText
: optional - Only used when popup is set to true. nter the text you want to show in the button of the popup

buttonUrl
: optional - Only used when popup is set to true. Enter the target, i.e., url of page you want the button to link to

## Background colors

### white

{{< logos bgColor="white" >}}

    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
    />}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    />}}

{{< /logos >}}

### blue

{{< logos bgColor="blue" >}}

    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
        lazy="false"
    />}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    />}}

{{< /logos >}}

### grey

{{< logos bgColor="grey" >}}

    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
    />}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    />}}

{{< /logos >}}

### yellow

{{< logos bgColor="yellow" >}}

    {{< logos__item
        src="/img/logos/logo-gerritforge.png"
        link="https://www.gerritforge.com/"
    />}}

    {{< logos__item
        src="/img/logos/logo-netlify.svg"
        link="https://www.netlify.com/"
    />}}

{{< /logos >}}
