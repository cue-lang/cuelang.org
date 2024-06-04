---
title: CUE Modules
authors:
- rogpeppe
toc_hide: true
tags:
- modules
---

## Introduction {#intro}

Modules are how CUE manages dependencies.
This document is a detailed reference manual for CUE's module system.
CUE's modules support has a lot in common with Go's modules
and this document has substantial parts that have been taken
directly from the [Go modules reference](https://go.dev/ref/mod).
Thanks very much to Russ Cox and the Go team for their
amazing work there.

This document largely supercedes the
[prior modules documentation]({{< relref "docs/concept/modules-packages-instances" >}})
although, as a transitionary measure, the CUE tool still supports
the import of packages present in the `cue.mod/pkg`, `cue.mod/usr` and
`cue.mod/gen` directories. This only applies to the main module, and if
there is any ambiguity with respect to regular module dependencies an
"ambiguous import" error will be reported.

## Modules, packages, and versions {#modules-overview}

A <dfn>module</dfn> is a collection of packages that are released,
versioned, and distributed together. Modules are downloaded from
[OCI-compliant](https://github.com/opencontainers/distribution-spec/blob/main/spec.md)
artifact registries. This means that if you are deploying CUE to the cloud,
you can use the same distribution mechanism that you might be using for
Docker images to deploy your CUE configuration too.

A module is identified by a module path, which is declared in a
`cue.mod/module.cue` file, together with information about the module’s
dependencies. The module root directory is the directory that contains
the `cue.mod` directory. The main module is the module containing the
directory where the `cue` command is invoked.

Each package within a module is a collection of source files that are
unified together, usually all in the same directory.  A package path
is the module path joined with the subdirectory containing the package,
relative to the module root.


<!--
For example, the module "TODO" contains a package in the directory "TODO". That package’s path is "TODO".
-->

### Module paths {#module-path}

A <dfn>module path</dfn> is the canonical name for a module, declared with the
module field in the module’s `cue.mod/module.cue` file. A module’s
path is the prefix for package paths within the module.

A module path consists of a root path and a major version suffix,
for example in the module path `myhost.example/foo@v0`, the root path is
`myhost.example/foo` and the major version suffix is `@v0`.

Module paths are domain-name qualified: a module path always begins
with a host name, although that host is only a guide to the origin of
the module and is not used directly to fetch the module's contents (see
[here](#cue-registry-env) for details about that)). The expectation is
that any modules you create should have names that are inside domains
or namespaces that you have control of, enabling modules from different
creators to live together without conflicts in the same registry.

* The <dfn>root path</dfn> is the
  portion of the module path that identifies the OCI repository within
  a registry. All versions of a module are located in that same OCI
  repository.
* The major version suffix declares the major
  version of the module and is of the form `@v1` where the version
  `v1` here must match the major version of the full version it's been
  published as.

There are also several lexical restrictions on characters allowed in
module paths. As modules are stored in OCI repositories, these correspond
to the restrictions
[documented there](https://github.com/opencontainers/distribution-spec/blob/main/spec.md#pulling-manifests).
To summarize:

* The path must consist of one or more path elements separated by slashes
  (`/`, U+002F). It must not begin or end with a slash.
 * No characters are allowed in the path except lower case ASCII letters,
   ASCII digits, and limited ASCII punctuation (`-`, `_`, `.`).
 * The first character of each path element is a letter or a digit.
 * No more than one period (`.`) is allowed in sequence.
 * No more than two underscores (`_`) are allowed in sequence.

In addition, the first path element must contain at least one period character (`.`).

No restriction is directly enforced on the length of module names, but as registries
can refuse module paths over 128 characters, and it's possible to specify
an arbitrary storage prefix, long module paths may fail.

### Versions {#versions}

A <dfn>version</dfn> identifies an immutable snapshot of a module, which may be
either a release or a
pre-release (with a pre-release suffix). Each version starts with the letter
`v`, followed by a semantic version. See
[Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html) for details on how versions are
formatted, interpreted, and compared.

To summarize, a semantic version consists of three non-negative integers (the
major, minor, and patch versions, from left to right) separated by dots. The
patch version may be followed by an optional pre-release string starting with a
hyphen.

<!-- TODO: Go allows build metadata suffixes (and ignores them for the purposes of comparison). Should we do the same? -->

Each part of a version indicates whether the version is stable and whether it is
compatible with previous versions.

* The major version must be incremented and the minor
  and patch versions must be set to zero after a backwards incompatible change
  is made to the module's public interface or documented functionality, for
  example, after a package is removed.
* The minor version must be incremented and the patch
  version set to zero after a backwards compatible change, for example, after a
  new function is added.
* The patch version must be incremented after a change
  that does not affect the module's public interface, such as a bug fix or
  change to the documentation.
* The pre-release suffix indicates a version is a pre-release. Pre-release versions sort before
  the corresponding release versions. For example, `v1.2.3-pre` comes before
  `v1.2.3`.

A version is considered unstable if its major version is 0 or it has a
pre-release suffix. Unstable versions are not subject to compatibility
requirements. For example, `v0.2.0` may not be compatible with `v0.1.0`, and
`v1.5.0-beta` may not be compatible with `v1.5.0`.

### Major version suffixes {#major-version-suffixes}

Module paths must have a _major version
suffix_ like `@v2` that matches the major version. For example, if a module
has the path `foo.example/mod@v1` at `v1.0.0`, it must have the path
`foo.example/mod@v2` at version `v2.0.0`.

Major version suffixes implement the _[import compatibility
rule](https://research.swtch.com/vgo-import)_:

{{< quote >}}
If an old package and a new package have the same import path,
the new package must be backwards compatible with the old package.
{{< /quote >}}

By definition, packages in a new major version of a module are not backwards
compatible with the corresponding packages in the previous major version.
Consequently each new major version of a package needs a new import path.
This is accomplished by adding a major version suffix to the module path.
The import path for a package also includes the major version suffix,
providing a distinct import path for each incompatible version.

Unlike [in Go](https://go.dev/ref/mod#major-version-suffixes),
major version suffixes are always required in module paths	. The burden
of changing import paths in packages is eased by allowing the
major version suffix to be omitted and inferred from the `module.cue`
file. See [major version defaults](#major-version-defaults) for details.

Major version suffixes let multiple major versions of a module coexist in the
same build. This may be necessary due to a [diamond dependency
problem](https://research.swtch.com/vgo-import#dependency_story). Ordinarily, if
a module is required at two different versions by transitive dependencies, the
higher version will be used. However, if the two versions are incompatible,
neither version will satisfy all clients. Since incompatible versions must have
different major version numbers, they must also have different module paths due
to major version suffixes. This resolves the conflict: modules with distinct
suffixes are treated as separate modules, and their packages—even packages in
same subdirectory relative to their module roots—are distinct.

### Major version defaults {#major-version-defaults}

When a package import path does not contain a major version,
the `module.cue` file is consulted to determine which major
version of the module to use. In a canonical `module.cue` file,
all imports without major versions will have an explicit `default: true`
present in the corresponding dependency entry, but `cue mod tidy`
will add those if not present and there is no ambiguity in the build list.

That is, given only a single major version of a module in the build list,
the major version need not be specified in any of the package imports.

### Resolving a package to a module {#resolve-pkg-mod}

When CUE loads a package using a [package
path](#glos-package-path), it needs to determine which module provides the
package.

It starts by searching the [build list](#glos-build-list) for
modules with paths that are prefixes of the package path. For example, if the
package `foo.example/a/b` is imported, and the module `foo.example/a` is in the
build list, CUE will check whether `foo.example/a` contains the
package, in the directory `b`. At least one file with the `.cue` extension must
be present in a directory for it to be considered a package. [Build
constraints](/pkg/go/build/#hdr-Build_Constraints) are not applied for this
purpose. If exactly one module in the build list provides the package, that
module is used. If no modules provide the package or if two or more modules
provide the package, CUE reports an error. The `cue mod tidy` command
will attempt to find new modules providing missing
packages and to update `cue.mod/module.cue` accordingly.

<!-- NOTE(golang.org/issue/27899): CUE reports an error when two
or more modules provide a package with the same path, as described
above. In the future, we may try to upgrade one (or all) of the colliding modules.
TODO raise an issue about the above.
-->

### The `CUE_REGISTRY` environment variable {#cue-registry-env}

When CUE looks up a new module for a package path, it checks the
`CUE_REGISTRY` environment variable. This determines the registry
and repository within a registry that a module will be searched for.
It holds a complete list of any registries that are consulted for fetching modules.

Specifically it holds a comma-separated list specifying which registry to use for
downloading and publishing modules. A registry is specifed
as follows:

```
[modulePrefix=]hostname[:port][/repoPrefix][+insecure]
```

The optional _modulePrefix_ specifes that all modules with a path that
has the given prefix will use the associated registry. If there are
multiple registries with a prefix, the longest matching prefix wins.
It's an error for there to be multiple entries with the same prefix.

The hostname holds the OCI registry host (in square brackets if it's
an IPv6 address), with an optional numeric TCP port.

Each module is stored inside its own repository in the registry which
is named after the module path.  The _repoPrefix_ holds a prefix to be
added to the repository name.  That is, all repositories in the registry
will be of the form _repoPrefix_`/`_modulePath_.

If there's a `+insecure` suffix it specifies that an insecure HTTP
connection should be used to this registry. The default is to use a
secure HTTPS connection except for localhost addresses. For symmetry,
it's also possible to use `+secure` to force an HTTPS connection even
on localhost connections.

For example, given:

```
CUE_REGISTRY=public-registry.example,github.com/acmecorp=registry.acme.example:6000/modules
```
all modules, such as `github.com/foo/bar` will be fetched from
`public-registry.example` with the exception of modules with the
prefix `github.com/acmecorp/`, such as `github.com/acmecorp/somemodule`
which will be fetched from the `modules/github.com/acmecorp/somemodule` repository
in the host `registry.acme.example` at port 6000.

## `cue.mod/module.cue` files {#cue-mod-file}

A module is defined by a `cue.mod` directory in its root containing
a `module.cue` CUE file.

```cue
// module indicates the module's path.
module!: #Module

// version indicates the language version used by the code in this module
// - the minimum version of CUE required to evaluate the code in this
// module. When a later version of CUE is evaluating code in this module,
// this will be used to choose version-specific behavior. If an earlier
// version of CUE is used, an error will be given.
language?: version?: #Semver

// source holds information about the source of the files within the
// module. This field is mandatory at publish time.
source?: #Source

// description describes the purpose of this module.
description?: string

// deps holds dependency information for modules, keyed by module path.
deps?: [#Module]: #Dep

// custom holds arbitrary data intended for use by third-party tools.
// Each field at the top level represents a tooling namespace,
// conventionally a module or domain name. Data migrated from legacy
// module.cue files is placed in the "legacy" namespace.
custom?: [#Module | "legacy"]: [_]: _

#Dep: {
	// v indicates the minimum required version of the module.
	v!: #Semver

	// default indicates this module is used as a default in case more
	// than one major version is specified for the same module path.
	// Imports must specify the exact major version for a module path if
	// there is more than one major version for that path and default is
	// not set for exactly one of them.
	default?: bool
}

// #Module constrains a module path. The major version indicator is
// optional, but should always be present in a normalized module.cue
// file.
#Module: =~#"^[^@]+(@v(0|[1-9]\d*))$"#

// #Semver constrains a semantic version.  This regular expression is taken
// from https://semver.org/spec/v2.0.0.html
#Semver: =~#"^v(?P<major>0|[1-9]\d*)\.(?P<minor>0|[1-9]\d*)\.(?P<patch>0|[1-9]\d*)(?:-(?P<prerelease>(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*)(?:\.(?:0|[1-9]\d*|\d*[a-zA-Z-][0-9a-zA-Z-]*))*))?(?:\+(?P<buildmetadata>[0-9a-zA-Z-]+(?:\.[0-9a-zA-Z-]+)*))?$"#

// #Source describes a source of truth for a module's content.
#Source: {
	// kind specifies the kind of source.
	//
	// The special value "self" signifies a module is stand-alone, associated
	// with no particular source. The module's file list is determined from
	// the contents of the directory (and its subdirectories) that contains
	// the cue.mod directory.
	//
	// See https://cuelang.org/docs/reference/modules/#determining-zip-file-contents
	// for details on all the possible values for kind, and how they relate
	// to determining the list of files in a module.
	kind!: "self" | "git"
}
```

For example:

```cue
language: version: "v0.4.3"

module: "foo.example/my/thing@v1"

deps: {
	"foo.example/other/thing@v1": v: "v1.0.2"
	"foo.example/new/thing@v2": v:   "v2.3.4"
}
```

The `module.cue` file is designed to be human readable and machine writable. The
`cue` command will provide several subcommands that manipulate `cue.mod/module.cue` files.
For now, the only one is `cue mod tidy` which will fetch dependencies
and canonicalize the `module.cue` file to reflect all the most recent versions.

A `cue.mod/module.cue` file is required for all modules.

## Minimal version selection (MVS) {#minimal-version-selection}

CUE uses an algorithm called <dfn>Minimal version selection (MVS)</dfn> to select
a set of module versions to use when building packages. MVS is described in
detail in [Minimal Version Selection](https://research.swtch.com/vgo-mvs) by
Russ Cox.

Conceptually, MVS operates on a directed graph of modules, specified with
[`module.cue` files](#glos-cue-mod-file). Each vertex in the graph represents a
module version. Each edge represents a minimum required version of a dependency,
specified with an entry in the `deps` field.

MVS produces the [build list](#glos-build-list) as output, the list of module
versions used for an evaluation.

MVS starts at the main modules (special vertices in the graph that have no
version) and traverses the graph, tracking the highest required version of each
module. At the end of the traversal, the highest required versions comprise the
build list: they are the minimum versions that satisfy all requirements.

Unlike other dependency management systems, the build list is
not saved in a "lock" file. MVS is deterministic, and the build list doesn't
change when new versions of dependencies are released, so MVS is used to compute
it at the beginning of every module-aware command.

{{< figure
  src="buildlist.svg" link="buildlist.svg" align="right"
  caption="Module version graph with visited versions highlighted"
>}}
Consider the example in this diagram. The main module requires module A
at version 1.2 or higher and module B at version 1.2 or higher. A 1.2 and B 1.2
require C 1.3 and C 1.4, respectively. C 1.3 and C 1.4 both require D 1.2.

MVS visits and loads the `cue.mod/module.cue` file for each of the module versions
highlighted in blue. At the end of the graph traversal, MVS returns a build list
containing the bolded versions: A 1.2, B 1.2, C 1.4, and D 1.2. Note that higher
versions of B and D are available but MVS does not select them, since nothing
requires them.

## Module storage format {#module-storage}

Modules are stored in a registry using a standard manifest + blob
format. There is rarely any need to
interact directly with these artifacts, since the `cue` command creates, downloads,
and extracts them automatically from registries. However, it's still useful to know about these
files to understand cross-platform compatibility constraints.

A module is stored in a registry with a top level manifest with media type
`application/vnd.oci.image.manifest.v1+json` and artifact type
`application/vnd.cue.module.v1+json`, that points to two blobs.
The first blob (also known as a "layer 0" although there's actually
no layering going on here) has media type `application/zip` and holds the full contents
of the module. The second blob, layer 1, has media type `application/vnd.cue.modulefile.v1`
and stores an exact copy of the contents of the `cue.mod/module.cue` file
from the zip file. The latter enables fast access to the dependency information
without the need to download the entire module archive.

<!-- TODO: more complete docs for the format -->
<!-- TODO: diagram showing structure of storage -->

## File path and size constraints {#zip-path-size-constraints}

There are a number of restrictions on the content of module zip files. These
constraints ensure that zip files can be extracted safely and consistently on
a wide range of platforms.

* A module zip file may be at most 500 MiB in size. The total uncompressed size
  of its files is also limited to 500 MiB. `module.cue` files are limited to 16 MiB.
  `LICENSE` files are also limited to 16 MiB. These limits exist to mitigate
  denial of service attacks on users, proxies, and other parts of the module
  ecosystem. Repositories that contain more than 500 MiB of files in a module
  directory tree should tag module versions at commits that only include files
  needed to build the module's packages; videos, models, and other large assets
  are usually not needed for builds.
* File modes, timestamps, and other metadata are ignored.
* Empty directories (entries with paths ending with a slash) may be included
  in module zip files but are not extracted. The `cue` command does not include
  empty directories in zip files it creates.
* Symbolic links and other irregular files are ignored when creating zip files,
  since they aren't portable across operating systems and file systems, and
  there's no portable way to represent them in the zip file format.
* Files within directories containing `cue.mod` directories, other than the module
  root directory and the `cue.mod` directory itself, are ignored when creating zip files,
  since they are not part
  of the module. CUE ignores subdirectories containing `cue.mod`
  directories when extracting zip files.
* No two files within a zip file may have paths equal under Unicode case-folding
  (see [`strings.EqualFold`](https://pkg.go.dev/strings?tab=doc#EqualFold)).
  This ensures that zip files can be extracted on case-insensitive file systems
  without collisions.
* A `cue.mod/module.cue` file must appear in the top-level directory.
  If present, it must have the name `cue.mod/module.cue` (all
  lowercase). Directories named `cue.mod` are not allowed in any other directory.
* File and directory names within a module may consist of Unicode letters, ASCII
  digits, the ASCII space character (U+0020), and the ASCII punctuation
  characters `!#$%&()+,-.=@[]^_{}~`. Note that package paths may not contain all
  these characters. See
  [`module.CheckFilePath`](https://pkg.go.dev/cuelang.org/go/internal/mod/module?tab=doc#CheckFilePath)
  and
  [`module.CheckImportPath`](https://pkg.go.dev/golang.org/x/mod/module?tab=doc#CheckImportPath)
  for the differences.
* A file or directory name up to the first dot must not be a
  [reserved file name on Windows]( https://learn.microsoft.com/en-us/windows/win32/fileio/naming-a-file#naming-conventions),
  regardless of case (`CON`, `com1`, `NuL`, and so on).

## Module caching {#module-cache}

By default, the `cue` command caches downloaded modules in the local
filesystem. It uses the local user configuration directory by default, but
that can be changed by setting `$CUE_CACHE_DIR`, which is
documented under [`cue help environment`]({{< relref "docs/reference/cli/cue-environment" >}}).

## Authorization

For custom OCI registries, CUE understands the usual conventions
for authorization: specifically the usual way to configure
registry authorization information for custom OCI registries
is by setting them up in the `$HOME/.docker/config.json` file.
You can
[use `docker login`](https://docs.docker.com/engine/reference/commandline/login/)
to do this or
[edit the file directly](https://www.flatcar.org/docs/latest/container-runtimes/registry-authentication/).

The CUE command knows how to read auth tokens from the `$HOME/.docker/config.json`,
including running helper commands to fetch them from secure storage.

For organizations that don't allow the use of docker, [podman
login](https://docs.podman.io/en/latest/markdown/podman-login.1.html) allows
using the `--compat-auth-file $HOME/.docker/config.json` flag to generate a
docker compatible json file.

## Glossary {#glossary}

<!-- TODO: This glossary could move to its own page -->

<a id="glos-build-constraint"></a>
**build constraint:** A condition that determines whether a CUE source file is
used when compiling a package. Build constraints are expressed with file-level `@if(name)`
annotations.

<a id="glos-build-list"></a>
**build list:** The list of module versions that will be used for a CUE
command such as `cue export`, or `cue vet`. The build list is
determined from the [main module's](#glos-main-module) [`cue.mod/module.cue`
file](#glos-cue-mod-file) and `cue.mod/module.cue` files in transitively required modules
using [minimal version selection](#glos-minimal-version-selection). The build
list contains versions for all modules in the [module
graph](#glos-module-graph), not just those relevant to a specific command.

<a id="glos-canonical-version"></a>
**canonical version:** A correctly formatted [version](#glos-version) without
a build metadata suffix other than `+incompatible`. For example, `v1.2.3`
is a canonical version, but `v1.2.3+meta` is not.

<a id="glos-current-module"></a>
**current module:** Synonym for [main module](#glos-main-module).

<a id="glos-cue-mod-file"></a>
**`cue.mod/module.cue` file:** The file that defines a module's path, requirements, and
other metadata. Appears in the [module's root
directory](#glos-module-root-directory). See the section on [`cue.mod/module.cue`
files](#cue-mod-file).

<a id="glos-import-path"></a>
**import path:** A string used to import a package in a CUE source file.
Synonymous with [package path](#glos-package-path).

<a id="glos-main-module"></a>
**main module:** The module in which the `cue` command is invoked. The main
module is defined by a [`cue.mod/module.cue` file](#glos-cue-mod-file) in the current
directory or a parent directory. See [Modules, packages, and
versions](#modules-overview).

<a id="glos-major-version"></a>
**major version:** The first number in a semantic version (`1` in `v1.2.3`). In
a release with incompatible changes, the major version must be incremented, and
the minor and patch versions must be set to 0. Semantic versions with major
version 0 are considered unstable.

<a id="glos-major-version-suffix"></a>
**major version suffix:** A module path suffix that matches the major version
number. For example, `@v2` in `foo.example/mod@v2`. See
the section on [Major version suffixes](#major-version-suffixes).

<a id="glos-minimal-version-selection"></a>
**minimal version selection (MVS):** The algorithm used to determine the
versions of all modules that will be used in a build. See the section on
[Minimal version selection](#minimal-version-selection) for details.

<a id="glos-minor-version"></a>
**minor version:** The second number in a semantic version (`2` in `v1.2.3`). In
a release with new, backwards compatible functionality, the minor version must
be incremented, and the patch version must be set to 0.

<a id="glos-module"></a>
**module:** A collection of packages that are released, versioned, and
distributed together.

<a id="glos-module-cache"></a>
**module cache:** A local directory storing downloaded modules, located in
`$CUE_CACHE_DIR`. See [Module cache](#module-cache).

<a id="glos-module-graph"></a>
**module graph:** The directed graph of module requirements, rooted at the [main
module](#glos-main-module). Each vertex in the graph is a module; each edge is a
version from an entry in the `deps` field in a `cue.mod/module.cue` file.

<a id="glos-module-path"></a>
**module path:** A path that identifies a module and acts as a prefix for
package import paths within the module. For example, `"cuelang.org/x/foo"`.

<a id="glos-module-root-directory"></a>
**module root directory:** The directory that contains the `cue.mod/module.cue` file that
defines a module.

<a id="glos-package"></a>
**package:** A collection of source files, usually in the
same directory, that are evaluated together. See the [Packages
section](https://cuelang.org/docs/references/spec/#modules-instances-and-packages)
in the CUE Language Specification.

<a id="glos-package-path"></a>
**package path:** The path that uniquely identifies a package. A package path is
a [module path](#glos-module-path) joined with a subdirectory within the module.
For example `"cuelang.org/x/foo/html"` is the package path for the package in the
module `"cuelang.org/x/foo"` in the `"html"` subdirectory. Synonym of
[import path](#glos-import-path).

<a id="glos-patch-version"></a>
**patch version:** The third number in a semantic version (`3` in `v1.2.3`). In
a release with no changes to the module's public interface, the patch version
must be incremented.

<a id="glos-pre-release-version"></a>
**pre-release version:** A version with a dash followed by a series of
dot-separated identifiers immediately following the patch version, for example,
`v1.2.3-beta4`. Pre-release versions are considered unstable and are not
assumed to be compatible with other versions. A pre-release version sorts before
the corresponding release version: `v1.2.3-pre` comes before `v1.2.3`. See also
[release version](#glos-release-version).

<a id="glos-release-version"></a>
**release version:** A version without a pre-release suffix. For example,
`v1.2.3`, not `v1.2.3-pre`. See also [pre-release
version](#glos-pre-release-version).

<a id="glos-repository-root-path"></a>
**repository root path:** The portion of a [module path](#glos-module-path) that
corresponds to a version control repository's root directory. See [Module
paths](#module-path).

<a id="glos-selected-version"></a>
**selected version:** The version of a given module chosen by [minimal version
selection](#minimal-version-selection). The selected version is the highest
version for the module's path found in the [module graph](#glos-module-graph).

<a id="glos-version"></a>
**version:** An identifier for an immutable snapshot of a module, written as the
letter `v` followed by a semantic version. See the section on
[Versions](#versions).

## Related content

- {{< linkto/related/tutorial "working-with-a-custom-module-registry" >}}
