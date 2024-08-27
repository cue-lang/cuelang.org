---
title: Modules, Packages, and Instances
description: How files are organized in CUE
tags: [modules]
toc_hide: true
---

{{<info>}}
This guide describes "new" modules, which are the current implementation of
dependencies in CUE.

[The previous version of this guide]({{< relref "old-modules-packages-instances" >}})
covers "old" modules, which were the previous way to manage CUE dependencies,
and is preserved for reference by folks using older versions of CUE.
The FAQ "{{< linkto/inline "concept/faq/new-modules-vs-old-modules" >}}"
explains their differences.
{{</info>}}

## Overview

CUE heavily relies on its order independence for package organization.
Definitions and constraints can be split across files within a package,
and even organized across directories.

Another key aspect of CUE's package management is reproducibility.
A module, the largest unit of organization, has a fixed location
of all files and dependencies.
There are no paths to configure.
With configuration, reproducibility is key.

Within a module, CUE organizes files grouped by package.
A package can be defined within the module or externally.
In the latter case, CUE maintains a copy of the package within the module
in a dedicated location.

{{< info >}}
### For those familiar with Go packages
CUE's definitions of packages and modules are modeled after Go's.
Here is how they differ:

- The package clause is optional: such files do not belong to a package
  and cannot be imported.

- A package is identified by its import path _and_ its package name,
  separated by a `:`.
  If its name is equal to the base of this path it may be omitted.

- There can be more than one package per directory.

- All files within a module with the same package name belong to the same package;
  an _instance_ of such a package for a given directory contains all its files
  from that directory up till the module root.

{{< /info >}}

## Modules

A module contains a configuration laid out in a directory hierarchy.
It contains everything that is needed to deterministically
calculate the outcome of a CUE configuration.
The root of this directory is marked by containing a `cue.mod`
directory.
The contents of this directory are mostly managed by the `cue` tool.
In that sense, `cue.mod` is analogous to the `.git` directory marking
the root directory of a repo, but where its contents are mostly
managed by the `git` tool.

<!--
TODO: should this be the case?:

A module root is identified by a `cue.mod` directory and spans all
subdirectories that do not itself contain a `cue.mod` directory.

For going up, maybe, but for enforcing constraint top-down
it would be good if users could not disable the root by adding a cue.mod.
-->

The use of a module is optional, but required if one wants to import files.

<!-- TODO: is this necessary to understand modules?
All `.cue` files within the span of a module that have a package clause
are considered to be part of this module.
-->

### Creating a module

A module can be created by running the following command
within the module root:

{{{with script "en" "cue mod init"}}}
cue mod init a.module.name/with/an/optional/path@v0
{{{end}}}

If the module name is not specified then a default value is used - currently
`cue.example`. The module name must be used in CUE code if a package within the
module needs to import another package within the module. Module names look
similar to URLs, starting with a fully-qualified domain name and optional
forward-slash-separated path and ending with an optional major version suffix.
Ideally, the domain name and path would map to a resource that's controlled by
the CUE user but this is not enforced (or even looked up) in any way.

A module can also be created by setting up the `cue.mod` directory
and `module.cue` file manually, but this is not recommended.

### The cue.mod directory

The module directory has the following contents:

{{{with code "en" "cue-module-directory"}}}
-- plain.txt --
cue.mod
|-- module.cue  // The module file
|-- pkg         // copies of external packages [DEPRECATED]
|-- gen         // files generated from external sources [DEPRECATED]
|-- usr         // user-defined constraints [DEPRECATED]
{{{end}}}

This directory is predominantly managed by the `cue` tool.

The `module.cue` file defines settings such as the globally unique
[*module identifier*]({{< relref "#import-path" >}}), which
allows packages defined within the module to be importable within the module
itself. It also holds version information of imported packages to determine
the precise origin of imported files. The modules reference fully specifies
[the contents of `module.cue`]({{< relref "docs/reference/modules" >}}#cue-mod-file).

#### Deprecated directories

The `pkg`, `gen` and `usr` directories mentioned above can hold packages that
are facsimiles, derivatives, or augmentations of external packages, but their
use is deprecated. Their manually-specified contents
[can be incompatible]({{< relref "docs/concept/faq/new-modules-vs-old-modules" >}}#can-i-use-cuemodusr-with-new-modules)
with modules that the
[`cue mod`]({{< relref "docs/reference/command/cue-help-mod" >}}) command
manages automatically, but they are still supported as they can be useful in a
limited set of circumstances. They are intended to be used for the following
purposes, but only when CUE's current modules can't handle a particular use-case:

- `pkg`: manually managed and imported external packages
- `gen`: CUE generated from external definitions, such as protobuf or Go
- `usr`: user-defined constraints for external packages

{{<info>}}
Read the FAQ "{{< linkto/inline "concept/faq/new-modules-vs-old-modules" >}}" to
learn about the differences between these two types of CUE module. Please help
the CUE project by providing your feedback in {{<issue 2865/>}} whenever you
find yourself needing to use these deprecated directories - this will help
guide and shape the future of the modules implementation.
{{</info>}}

These three directories split files from the same package across different
parallel hierarchies based on the origin of the content.
But for all intent and purposes they should be seen as a single directory
hierarchy.

The `usr` directory is a bit special here.
The `gen` directory is populated by the `cue` tool and
the `pkg` directory, whilst deprecated, can hold 3rd-party or external constraints.
The `usr` directory, on the other hand, holds user-defined
constraints for the packages defined in the other directories.

User-defined constraints can be used to fill gaps in generated constraints;
as generation is not always a sure thing.
They can also be used to enforce constraints on imported packages, for instance
to enforce that a certain API feature is still provided or of the desired form.
The `usr` directory allows for a cleaner organization compared to storing
such user-defined constraints directly in the `cue`-managed directories.

## Packages

### Files belonging to a package

CUE files may define a package name at the top of their file.
CUE uses this to determine which files belong together.
If the `cue` tool is told to load the files for a specific directory,
for instance:

{{{with code "en" "cmd-cue-eval-directory"}}}
-- plain.txt --
cue eval ./mypkg
{{{end}}}

it will only look files with such a clause and ignore files without it.

If the package name within the directory is not unique, `cue` needs to
know the name of the package as well

{{{with code "en" "cmd-cue-eval-directory-and-package"}}}
-- plain.txt --
cue eval ./mypkg:packageName
{{{end}}}

If no module is defined then the `cue` command will only load the files in this
directory.
If a module is defined then it will *also* load all files with the same
package name in its ancestor directories up to the module root.
As we will see below,
this strategy allows for defining organization-wide schemas and policies.

### Import path

Each package is identified by a globally unique name, called its _import path_.
The import path consists of a unique location identifier
followed by a colon (`:`) and its package name.

{{{with code "en" "import-path-explicit-package-name"}}}
-- plain.txt --
k8s.io/api/core/v1:v1
{{{end}}}

If the basename of the path and the package name are the same, the latter
can be omitted.

{{{with code "en" "import-path-implicit-package-name"}}}
-- plain.txt --
k8s.io/api/core/v1
{{{end}}}

The unique location identifier consists of a domain name followed by a path.

Modules themselves also have a unique location identifier.
A package inside a module can import another package from this same module
by using the following import path:

{{{with code "en" "general-module-import-path"}}}
-- plain.txt --
<module identifier>/<relative position of package within module>:<package name>
{{{end}}}

So suppose our module is identified as `example.com/transport` and a package
located at `schemas/trains` and has the package name `track`,
then other packages can import this packages as:

{{{with code "en" "example-module-import-path"}}}
-- plain.txt --
import "example.com/transport/schemas/trains:track"
{{{end}}}

Putting it all together:

{{{with code "en" "module-root-directory-contents"}}}
-- plain.txt --
root                    // must contain:
|-- cue.mod
|   |-- module.cue      // module: "example.com/transport"
|-- schemas
|   |-- trains
|   |   |-- track.cue   // package track
...
|-- data.cue            // import "example.com/transport/schemas/trains:track"
{{{end}}}

The relative position may not be within the `cue.mod` directory.

<!-- TODO: about how to resolve these names into concrete locations. -->

### Location on disk

A `.cue` file can import a package by specifying its import path
with the import statement. For instance,

{{{with code "en" "cue-import-example"}}}
-- in.cue --
import (
	"list"
	"example.com/path/to/package"
)
{{{end}}}

Packages for which the first path component is **not** a fully qualified domain
name are builtin packages and are not stored on disk, as with `list` in the
example above. For other packages, CUE determines the location on disk as
follows:

If a module identifier is defined and is a prefix of the import path, the
package is located at the corresponding location relative to the module root.
Otherwise: 

1. If the import path (or some prefix of it) is defined in
   [the `deps` field of the `cue.mod/module.cue` file]({{< relref "docs/reference/modules" >}}#cue-mod-file)
   then the package contents are looked up in the
   [shared module cache]({{< relref "docs/reference/modules" >}}#module-cache).
2. The package contents are looked up, unconditionally, in the `cue.mod/pkg`,
   `cue.mod/gen`, and `cue.mod/usr` directories. If they are found in any of
   these three directories then the package contents are unified from the
   relevant files in all the directories.
3. If package contents were found by both steps #1 and #2 then
   [an error occurs]({{< relref "docs/concept/faq/new-modules-vs-old-modules" >}}#can-i-use-cuemodusr-with-new-modules)
   because packages must not exist in both locations simultaneously.
4. If package contents were found by only one of steps #1 and #2 then the
   successful step's result is used.
5. If package contents were not found by either step #1 or #2 then an error
   occurs.

## Builtin Packages

CUE has a standard library of builtin packages that are compiled into the `cue`
command.

A list of these packages can be found at
[pkg.go.dev/cuelang/go/pkg](https://pkg.go.dev/cuelang.org/go/pkg).
The intention is to have this documentation in CUE format, but for now
we are piggybacking on the Go infrastructure to host and present the CUE
standard library documentatation.

To use a builtin package, import its path relative to `cuelang.org/go/pkg`
and invoke the functions using its qualified identifier.
For instance:

{{{with code "en" "stdlib-import-example"}}}
exec cue eval
cmp stdout out
-- stdlib.cue --
package example

import "strings"

A: "Hello, world!"
B: strings.ToUpper(A)
C: strings.HasPrefix(B, "HELLO")
-- out --
A: "Hello, world!"
B: "HELLO, WORLD!"
C: true
{{{end}}}

## File Organization

### Instances

Within a module, all `.cue` files with the same package name are part
of the same package.
A package is evaluated within the context of a certain directory.
Within this context, only the files belonging to that package in that
directory and its ancestor directories within the module are combined.
We call that an _instance_ of a package.

Using this approach, the different kind of directories within a module
can be ascribed the following roles:

- *module root*: schema
- *medial directories*: policy
- *leaf directories*: data

The top of the hierarchy (the module root) defines constraints that apply
across the organization.
Leaf directories typically define concrete instances, inheriting all the
constraints of ancestor directories.
Directories between the leaf and top directory define constraints,
like policies, that only apply to its subdirectories.

Because order of evaluation does not matter in CUE, leaf packages do not
explicitly have to specify which parts of their parents they want to inherit
from.
Instead, parent directories can be seen to "push out"
constraints to their subdirectories.
In other words, parent directories define policies to which subdirectories
must comply.

<!-- TODO

### Example

Examples showing top-level schemas, policy and concrete files.

--?

<!-- TODO
### Merged View

-->
