---
title: Why CUE?
weight: 30
---

The features that make CUE so effective are the result of its careful design,
which is the product of decades of experience in the data and cofiguration
space. The language's behaviours are formally defined in
[The CUE Language Specification]({{< relref "/docs/reference/spec" >}}),
but you don't need to study the spec in order to understand how CUE can make
life easier.

If you work frequently with data or configuration, the CUE examples in this
introduction might have already given you ideas about how you could use CUE to
simplify, fortify, or otherwise improve your existing setup.
But before jumping in and getting started, it's worth reading through this
site's concept guides on how CUE enables various practices, such as
[configuration]({{< relref "/docs/concept/how-cue-enables-configuration" >}})
and
[data validation]({{< relref "/docs/concept/how-cue-enables-data-validation" >}}),
and
[how CUE works with different technologies]({{< relref "/docs/integration" >}}).

As further inspiration, here a more fully-formed example that demonstrates the
concepts and features that users of CUE often find compelling and powerful ...

### Combining schema, policy, and data, and reducing boilerplate

You've already seen how *unification* combines data with multiple, layered
constraints that limit the data's acceptable values. You saw how *schema* ("X
is an integer") can live seamlessly alongside *policy constraints* ("X must be
greater than 10") because of CUE's succinct and clear syntax. The *pattern
constraint* feature gives you a way to push down constraints from above,
instead of relying on the authors of nested data to reference your requirements.

**Here's a demonstration of these concepts in action, working together to drive down complexity**.
Let's start with a hypothetical schema describing the contents of a
website -- its pages and structure -- along with some separate policy
constraints in `policy.cue`:

{{< code-tabs >}}
{{< code-tab name="schema.cue" language="cue" area="top-left" >}}
package website

#Page: {
	title!:   string        // title is a required field, as every page must have a title.
	urlPath!: string        // urlPath is also required.
	file!:    string        // The page's file contains its content.
	date!:    string        // The page's date of publishing.
	isDraft!: bool          // Is the page part of the published site?
	summary?: string        // summary is an optional field, as some pages don't need a short summary.
	author?:  string | null // An optional author name.
}
{{< /code-tab >}}{{< code-tab name="policy.cue" language="cue" area="top-left" >}}
package website

import (
	"strings"
	"time"
)

#Page: {
	title?:   strings.MinRunes(1)   // title cannot be empty (could also be specified as !="").
	urlPath?: strings.MinRunes(1)   // urlPath cannot be empty (equivalent to !="").
	file?:    =~".html$" | =~".md$" // Content files can be HTML or Markdown.
	date?:    time.Time             // time.Time validates a RFC3339 date-time.
	summary?: strings.MaxRunes(150) // Our site layout requires page summaries to be limited in length.
	author?:  _                     // Policy imposes no additional constraints on the author.
	isDraft?: _
}
{{< /code-tab >}}{{< /code-tabs >}}

Here we've used several new language elements, particularly in `policy.cue`:

- required (`!:`) and optional (`?:`) fields
- regular expression constraints (`=~`)
- importing built-in packages containing the CUE standard library (`import ( ... )`)
- using the standard library (`strings.MinRunes()`)
<!-- FIXME: move - default values (`*`)
- conditional fields (`if ...`) -->

These features are explored and explained in the
[CUE language tour]({{< relref "/docs/tour" >}})
but -- just for now! -- continue by reading on with the assumption that they
all function as you might expect from their names.

Now we've set up some schema and policy constraints, we can start to populate
information about our small website's existing pages, marking them with a
publishing date that's in the past to reflect their "already published" state:

{{< code-tabs >}}
{{< code-tab name="site.cue" language="cue" area="top-left" linenos="table" >}}
package website

// pages is a struct whose fields each adhere to the
// #Page constraint imposed through a pattern constraint.
pages: [_]: #Page
pages: {
	home: {
		title:   "Welcome to Widgets'R'We!"
		urlPath: "/"
		file:    "pages/home.html"
		summary: "The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East."
		date:    "1999-01-01T00:00:00Z"
		isDraft: false
		author:  null
	}
	about: {
		title:   "About Widgets'R'We"
		urlPath: "/about/"
		file:    "pages/about.html"
		summary: "Information about the Widgets'R'We company."
		date:    "1999-01-01T00:00:00Z"
		isDraft: false
		author:  null
	}
	contact: {
		title:   "Contact Widgets'R'We"
		urlPath: "/contact/"
		file:    "pages/contact.html"
		summary: "Contact information for the Widgets'R'We company."
		date:    "1999-01-01T00:00:00Z"
		isDraft: false
		author:  "Markus Marketing"
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

We can run `cue vet` to check that each of our pages' data meets the
requirements of the `#Page` constraint.
Like many command line tools, it stays silent to indicate success:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldA==" }
$ cue vet
```

Whilst our site metadata is correctly specified, it's hard not to feel that it
seems a little *unwieldy*. There's quite a lot of duplicated information that
distracts from the important detail of each page - often called "boilerplate".
Let's use CUE to reduce it ...

We'll use various CUE features to make our configuration shorter, which will
allow the most important information to stand out. Here's the CUE we'll use:

{{< code-tabs >}}
{{< code-tab name="pageDefaults.cue" language="cue" area="top-left" >}}
package website

pages?: [pageId=_]: {
	isDraft: _ | *false
	author:  _ | *null
	date:    _ | *"1999-01-01T00:00:00Z"
	urlPath: _ | *"/\(pageId)/"
	file:    _ | *"pages/\(pageId).html"
}
{{< /code-tab >}}{{< /code-tabs >}}

In `pageDefaults.cue`, we:

- use a [pattern constraint]({{< relref "/docs/tour/basics/folding-structs" >}})
  to unify fields inside each member of `pages`, creating what CUE calls a
  [template]({{< relref "/docs/tour/types/templates" >}}),
- use the template to assign five fields a
  [default value]({{< relref "/docs/tour/types/defaults" >}}) - a value that
  only takes effect if a configuration doesn't specify a value elsewhere,
- bring an [alias]({{< relref "/docs/tour/references/aliases" >}}) into
  existence (`pageId`) that contains the value of the identifier of each member
  of the `pages` struct, and allows us to refer to each page's identifier
  *inside* the template. This lets us derive two string fields' default values
  dynamically.

We again use `cue vet`, confirming that *adding* this CUE file to our `website`
package hasn't caused a problem:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldA==" }
$ cue vet
```

Next we need to *remove* the duplicate data from our `site.cue` metadata file -
a tedious and error-prone task, especially if our set of pages were larger, or
were split across more files. Or it *would* be tedious, if it weren't for CUE!

The `cue trim` command performs **automatic removal of boilerplate** from
configurations where the data can be inferred from other constraints.
Let's try it out here:

```text { title="TERMINAL" codeToCopy="Y3VlIHRyaW0=" }
$ cue trim
```

`cue trim`, just as with `cue vet`, stays silent if it was successful. Let's
take a look at the updated `site.cue` metadata file:
{{< code-tabs >}}
{{< code-tab name="site.cue" language="cue" area="top-left" linenos="table" >}}
package website

// pages is a struct whose fields each adhere to the
// #Page constraint imposed through a pattern constraint.
pages: [_]: #Page
pages: {
	home: {
		title:   "Welcome to Widgets'R'We!"
		urlPath: "/"
		summary: "The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East."
	}
	about: {
		title:   "About Widgets'R'We"
		summary: "Information about the Widgets'R'We company."
	}
	contact: {
		title:   "Contact Widgets'R'We"
		summary: "Contact information for the Widgets'R'We company."
		author:  "Markus Marketing"
	}
}
{{< /code-tab >}}{{< /code-tabs >}}
Only the notable, *important* information about each page is left behind, with
the boring-but-necessary boilerplate configuration safely isolated in the
`pageDefaults.cue` file.

Let's use `cue vet` again to confirm that the `#Page` schema still validates
our site metadata after the boilerplate was removed, and then run `cue export`
to show us the concrete data result of our changes:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldApjdWUgZXhwb3J0IC0tb3V0IHlhbWw=" }
$ cue vet
$ cue export --out yaml
pages:
  home:
    title: Welcome to Widgets'R'We!
    urlPath: /
    summary: The homepage of Widgets'R'We - manufacturer and purveyor of the finest left-angled reverse-clockwise widgets in the North East.
    isDraft: false
    author: null
    date: "1999-01-01T00:00:00Z"
    file: pages/home.html
  about:
    title: About Widgets'R'We
    summary: Information about the Widgets'R'We company.
    isDraft: false
    author: null
    date: "1999-01-01T00:00:00Z"
    urlPath: /about/
    file: pages/about.html
  contact:
    title: Contact Widgets'R'We
    summary: Contact information for the Widgets'R'We company.
    author: Markus Marketing
    isDraft: false
    date: "1999-01-01T00:00:00Z"
    urlPath: /contact/
    file: pages/contact.html
```

We can see that we exported the same data that we started with ... but with a
significantly clearer and more succinct representation behind the scenes!
Lastly, we'll introduce a new CUE file to the `website` package that *attempts*
to modify an existing page's title:

{{< code-tabs >}}
{{< code-tab name="updates.cue" language="cue" area="top-left" >}}
package website

pages: {
	about: title: "Cyber Widgets 2000"
}
{{< /code-tab >}}{{< /code-tabs >}}

The `cue vet` command complains, because the title already has a concrete value
specified elsewhere and data is immutable in CUE.
Notice that it tells us the locations of the conflicting values (encoded as
`filename:line-number:character-number`) so that we can find and resolve this
kind of mistake faster and easier:

```text { title="TERMINAL" codeToCopy="Y3VlIHZldA==" }
$ cue vet
pages.about.title: conflicting values "Cyber Widgets 2000" and "About Widgets'R'We":
    ./site.cue:13:12
    ./updates.cue:4:16
```

Here's a reminder of the concepts and features that we just used:

- *Constraints* were *unified* across the multiple files in our CUE package.
- *Pattern constraints* allowed us to push constraints down from above.
- *Templates* and *default values* gave us a way to centralise repetitive
  information without repeating it.
- *Aliases* gave us way to construct a template's field values dynamically.
- `cue vet` checked that data adhered to its constraints.
- `cue export` produced concrete data.
- `cue trim` automatically removed duplicate information from our data source.

{{< warning >}}
**On the next page**: learn some strategies to make effective use of CUE.
{{< /warning >}}

*Next page:* [Effective CUE]({{< relref "effective-cue" >}})
