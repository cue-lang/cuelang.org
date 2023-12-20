---
title: "Modules, Packages, and Instances"
description: "How files are organized in CUE"
toc_hide: true
---

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

A module contains a configuration layed out in a directory hierarchy.
It contains the everything that is needed to deterministically
determine the outcome of a CUE configuration.
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

```txt
cue mod init [module name]
```

The module name is required if a package within the module needs to
import another package within the module.

A module can also be created by setting up the `cue.mod` directory
and `module.cue` file manually.


### The cue.mod directory

The module directory has the following contents:

```txt
cue.mod
|-- module.cue  // The module file
|-- pkg         // copies of external packages
|-- gen         // files generated from external sources
|-- usr         // user-defined constraints
```

Aside from an occasional addition to the `usr` subdirectory or tweak
to `module.cue`, this directory is
predominantly managed by the `cue` tool.

The `module.cue` file defines settings such as
globally unique _module identifier_ (more on this in the
[Import Path]({{< relref "#ImportPath" >}}) section).
This information allows packages defined within the module to be importable
within the module itself.
In the future, it may hold version information of imported packages to determine
the precise origin of imported files.

The other directories hold packages that are facsimiles, derivatives, or
augmentations of external packages:

- *pkg*: an imported external CUE package,
- *gen*: CUE generated from external definitions, such as protobuf or Go,
- *usr*: user-defined constraints for the above two directories.

These directories split files from the same package across different
parallel hierarchies based on the origin of the content.
But for all intent and purposes they should be seen as a single directory
hierarchy.

The `cue.mod/usr` directory is a bit special here.
The `cue.mod/pkg` and `cue.mod/gen` directories are populated by the `cue` tool.
The `cue.mod/usr` directory, on the other hand, holds user-defined
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

```txt
cue eval ./mypkg
```

it will only look files with such a clause and ignore files without it.

If the package name within the directory is not unique, `cue` needs to
know the name of the package as well

```txt
cue eval -p pkgname ./mypkg
```

If no module is defined, it will just load the files in this directory.
If a module is defined, it will _also_ load all files with the same
package name in its ancestor directories up till the module root.
As we will see below,
this strategy allows for defining organization-wide schemas and policies.


### Import path

Each package is identified by a globally unique name, called its _import path_.
The import path consists of a unique location identifier
followed by a colon (`:`) and its package name.

```txt
k8s.io/api/core/v1:v1
```

If the basename of the path and the package name are the same, the latter
can be omitted.

```txt
k8s.io/api/core/v1
```

The unique location identifier consists of a domain name followed by a path.

Modules themselves also have a unique location identifier.
A package inside a module can import another package from this same module
by using the following import path:

```txt
<module identifier>/<relative position of package within module>:<package name>
```

So suppose our module is identified as `example.com/pkg` and a package
located at `schemas/trains` and has the package name `track`,
then other packages can import this packages as:

```txt
import "example.com/pkg/schemas/trains:track"
```

Putting it all together:

```txt
root                    // must contain:
|-- cue.mod
|   |-- module.cue      // module: "example.com/pkg"
|-- schemas
|   |-- trains
|   |   |-- track.cue   // package track
...
|-- data.cue            // import "example.com/pkg/schemas/trains:track"
```

The relative position may not be within the `cue.mod` directory.

<!-- TODO: about how to resolve these names into concrete locations. -->

### Location on disk

A `.cue` file can import a package by specifying its import path
with the import statement. For instance,

```cue
import (
	"list"

	"example.com/path/to/package"
)
```

Packages for which the first path component is not a fully qualified
domain name are builtin packages and are not stored on disk.
For other packages, CUE determines the location on disk as follows:

1. If a module identifier is defined and is a prefix of the import path,
   the package is located at the corresponding location relative to the
   module root.
2. Otherwise, the package contents looked up in
   the `cue.mod/pkg`, `cue.mod/gen`, and `cue.mod/usr` subdirectores.

In Step 2, an import path may match more than one directory.
In that case, the contents of _all_ matched directories are used to build the
package.
Virtually, these directories should be seen as a single directory tree.


## Builtin Packages

CUE has a collection of builtin packages that are compiled into the `.cue`
binary.

A list of these packages form
can be found here https://pkg.go.dev/cuelang.org/go/pkg.
The intention is to have this documentation in CUE format, but for now
we are piggybacking on the Go infrastructure to host and present the CUE
packages.

To use a builtin package, import its path relative to `cuelang.org/go/pkg`
and invoke the functions using its qualified identifier.
For instance:

{{< code-tabs >}}
{{< code-tab name="regexp.cue" language="cue"  area="top" >}}
import "regexp"

matches: regexp.FindSubmatch(#"^([^:]*):(\d+)$"#, "localhost:443")
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" type="terminal" area="bottom" >}}
$ cue eval regexp.cue
matches: ["localhost:443", "localhost", "443"]
{{< /code-tab >}}
{{< /code-tabs >}}

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
