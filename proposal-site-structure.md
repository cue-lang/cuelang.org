# Proposed cuelang.org Documentation Structure

## Problem Statement

The current cuelang.org documentation has several structural issues:

1. **Custom LHS navigation** — The nav doesn't follow conventions familiar
   to developers who use documentation frameworks like mkdocs-material.
   Developers expect a hierarchical, collapsible, topic-grouped sidebar.

2. **Flat diataxis sections** — While the diataxis split (tutorial, howto,
   concept, reference) is sound, having 104 howto guides and 30 concept
   pages in flat lists makes discovery difficult. The intent was to rely on
   tags, search, and linking from introductory pages, but in practice
   users land in a wall of titles.

3. **Features aren't collated** — CUE supports many encodings (JSON, YAML,
   TOML, Protobuf, OpenAPI, JSON Schema, XML), has a rich standard library
   (30+ packages), and a module system — but these aren't presented as
   coherent topics. Related content is scattered across howto, concept,
   integration, and reference sections.

4. **Overlapping sections** — "Integration" (5 pages) overlaps with
   encoding-related concept guides and howto guides. The boundary between
   "integration" and "concept" or "howto" for the same format is unclear.

5. **Fragmented learning path** — Introduction, Tour, and Tutorial are
   three separate top-level sections for newcomers, with no clear
   progression between them.

## Design Principles

- **Keep diataxis** — The tutorial/howto/concept/reference split is
  well-established and correct. Don't abandon it.
- **Add topic grouping within diataxis** — Group content by topic inside
  each diataxis category, so users can find all encoding-related howtos
  together, all module-related concepts together, etc.
- **Adopt mkdocs-material-style navigation** — Hierarchical, collapsible
  LHS nav with section headers. Each section has a landing page.
- **Single learning path** — Merge Introduction and Tour into one
  "Getting Started" flow. Tutorials remain separate (they're
  task-oriented, not concept-oriented).
- **Topic landing pages** — For major feature areas (encodings, modules,
  standard library), provide a landing page that links out to relevant
  tutorials, howtos, concepts, and references.

## Proposed Structure

```
docs/
├── getting-started/                    # Merged Introduction + Tour
│   ├── index                           # "What is CUE" + quick orientation
│   ├── install/                        # Installation
│   ├── first-steps/                    # Condensed tour: basics, types, expressions
│   │   ├── values-and-types/
│   │   ├── constraints/
│   │   ├── structs-and-lists/
│   │   ├── expressions/
│   │   ├── references-and-scoping/
│   │   └── packages/
│   └── next-steps/                     # Where to go from here (links to tutorials, topics)
│
├── tutorial/                           # Task-oriented learning (diataxis: tutorial)
│   ├── index                           # Tutorial index with difficulty/topic filters
│   ├── validating-yaml-files/
│   ├── converting-json-schema/
│   ├── working-with-modules/
│   ├── controlling-kubernetes/
│   ├── using-the-go-api/
│   ├── using-the-java-api/
│   └── publishing-modules/
│
├── howto/                              # Goal-oriented recipes (diataxis: how-to)
│   ├── index                           # Howto index with topic filters
│   │
│   ├── encode-decode/                  # Encoding & format conversion
│   │   ├── json/                       # e.g. validate-json, encode-json, decode-json
│   │   ├── yaml/
│   │   ├── toml/
│   │   ├── csv/
│   │   ├── xml/
│   │   ├── protobuf/
│   │   ├── openapi/
│   │   └── json-schema/
│   │
│   ├── constrain/                      # Validation & constraints
│   │   ├── strings/                    # e.g. regex, length, format
│   │   ├── numbers/                    # e.g. ranges, precision
│   │   ├── lists/                      # e.g. min/max items, unique
│   │   └── structs/                    # e.g. required fields, closed
│   │
│   ├── transform/                      # Data manipulation
│   │   ├── strings/                    # e.g. replace, split, join, trim
│   │   ├── lists/                      # e.g. sort, flatten, filter
│   │   └── structs/                    # e.g. merge, select fields
│   │
│   ├── modules/                        # Module operations
│   │   ├── create-module/
│   │   ├── add-dependency/
│   │   ├── publish-module/
│   │   └── use-private-registry/
│   │
│   ├── tooling/                        # CLI & workflow
│   │   ├── format-files/
│   │   ├── workflow-commands/
│   │   └── embed-files/
│   │
│   └── integrate/                      # Language & tool integration
│       ├── go/
│       ├── java/
│       └── kubernetes/
│
├── concept/                            # Understanding-oriented (diataxis: concept)
│   ├── index                           # Concept index
│   │
│   ├── language/                       # Core language concepts
│   │   ├── logic-of-cue/              # Lattice theory, unification
│   │   ├── types-and-values/          # CUE's type system
│   │   ├── constraints/               # How constraints work
│   │   ├── closedness/                # Open vs closed structs
│   │   ├── definitions/               # Definitions vs regular fields
│   │   └── order-independence/        # Evaluation model
│   │
│   ├── encodings/                      # How CUE works with data formats
│   │   ├── overview/                  # Supported encodings at a glance
│   │   ├── json/                      # CUE ↔ JSON relationship
│   │   ├── yaml/
│   │   ├── toml/
│   │   ├── protobuf/
│   │   ├── openapi/
│   │   └── json-schema/
│   │
│   ├── modules/                        # Module system concepts
│   │   ├── overview/                  # How modules work
│   │   ├── packages-and-instances/
│   │   ├── registries/                # Central Registry, OCI registries
│   │   └── versioning/               # Semantic versioning, MVS
│   │
│   ├── schema-and-validation/          # CUE for validation & policy
│   │   ├── data-validation/
│   │   ├── configuration/
│   │   └── policy-enforcement/
│   │
│   └── tooling/                        # Tool concepts
│       ├── workflow-commands/          # _tool.cue system
│       ├── code-generation/           # cue get go, cue get crd
│       └── editor-support/            # LSP, IDE integration
│
├── reference/                          # Information-oriented (diataxis: reference)
│   ├── index
│   │
│   ├── spec/                           # Language specification
│   │
│   ├── command/                        # CLI reference (auto-generated)
│   │   ├── cue/
│   │   ├── cue-eval/
│   │   ├── cue-export/
│   │   ├── cue-vet/
│   │   ├── cue-def/
│   │   ├── cue-fmt/
│   │   ├── cue-mod-init/
│   │   ├── cue-mod-tidy/
│   │   ├── cue-login/
│   │   └── ...                        # (all subcommands)
│   │
│   ├── modules/                        # Module reference (authorization, env vars, etc.)
│   │
│   ├── stdlib/                         # Standard library reference
│   │   ├── index                      # Package listing with descriptions
│   │   ├── strings/
│   │   ├── list/
│   │   ├── regexp/
│   │   ├── math/
│   │   ├── net/
│   │   ├── time/
│   │   ├── uuid/
│   │   ├── struct/
│   │   ├── crypto/
│   │   ├── encoding/                  # encoding/json, encoding/yaml, encoding/csv, etc.
│   │   ├── html/
│   │   ├── path/
│   │   ├── strconv/
│   │   ├── text/
│   │   └── tool/                      # tool/cli, tool/exec, tool/file, tool/http, tool/os
│   │
│   ├── builtins/                       # Built-in functions reference
│   │   ├── index                      # len, and, or, close, matchif, matchn, etc.
│   │
│   ├── environment/                    # Environment variables reference
│   │
│   └── glossary/
│
└── about/                              # Project meta
    ├── code-of-conduct/
    └── contribution-guidelines/
```

## Key Changes from Current Structure

### 1. Merged "Introduction" + "Tour" → "Getting Started"

Currently there are three entry points for newcomers: Introduction (4
pages), Tour (56 pages across 5 subsections), and Tutorial (11+ pages).
This is confusing.

**Proposed:** A single "Getting Started" section that takes a user from
zero to productive. The Tour content is condensed into ~6 focused
"First Steps" pages (the current 56 Tour pages cover the same ground
multiple times at different granularities). Tutorials remain separate
because they're task-oriented ("validate these YAML files") rather than
concept-oriented ("here's how types work").

### 2. Eliminated "Integration" as a top-level section

The current "Integration" section (Go, JSON, YAML, OpenAPI, Protobuf)
is an awkward fit — it's neither howto nor concept nor reference, but a
mix of all three. Its content overlaps heavily with encoding-related
concept guides and howto guides.

**Proposed:** Integration content is distributed to where it belongs
in the diataxis framework:
- Conceptual content → `concept/encodings/` (e.g. "how CUE relates to
  JSON Schema")
- Practical recipes → `howto/encode-decode/` or `howto/integrate/`
- Tutorials → `tutorial/` (e.g. "Converting JSON Schema to CUE")

### 3. Topic grouping within howto and concept

The flat list of 104 howto guides is replaced with topic-based
subdirectories. A user looking for "how do I validate JSON" can navigate
to `howto/encode-decode/json/` instead of scanning a flat alphabetical
list. Similarly, concept guides are grouped by theme.

This mirrors how mkdocs-material sites present content: the LHS nav
shows collapsible topic groups, not a single long list.

### 4. Standard library reference

CUE has 30+ standard library packages but currently they have no
dedicated reference section on cuelang.org. Users must use `cue help`
or read godoc-style docs elsewhere. Adding `reference/stdlib/` with
per-package pages (which could be auto-generated from the CUE source,
similar to how command help pages are already auto-generated) would be
a significant improvement.

### 5. Built-in functions reference

Built-in functions like `len`, `and`, `or`, `close`, `matchif`,
`matchn` currently only appear as scattered howto guides ("Use `len` to
..."). A dedicated `reference/builtins/` page provides a single place
to look up all built-in functions with their signatures and semantics.

## Navigation Comparison

### Current LHS Nav

```
Introduction
  Welcome
  What is CUE
  Getting Started
  Installation
Tour
  Basics (11 pages)
  Types (22 pages)
  Expressions (11 pages)
  References (8 pages)
  Packages (4 pages)
Concept (30 pages, flat)
How-to Guides (104 pages, flat)
Integration
  Go
  JSON
  YAML
  OpenAPI
  Protocol Buffers
Tutorial (11+ pages, flat)
Reference
  Command (44 pages)
  Modules
  Spec
  Glossary
```

### Proposed LHS Nav (mkdocs-material style)

```
Getting Started
  ▸ First Steps (6 pages)
  Next Steps

Tutorials
  Validating YAML Files
  Converting JSON Schema
  Working with Modules
  ...

How-to Guides
  ▸ Encode & Decode (by format)
  ▸ Constrain (by type)
  ▸ Transform (by type)
  ▸ Modules
  ▸ Tooling
  ▸ Integrate (by language)

Concepts
  ▸ Language
  ▸ Encodings
  ▸ Modules
  ▸ Schema & Validation
  ▸ Tooling

Reference
  Specification
  ▸ CLI Commands
  ▸ Standard Library
  Built-in Functions
  Modules
  Environment Variables
  Glossary
```

The `▸` arrows indicate collapsible sections. Each group contains 3-10
items, keeping the nav scannable. Users can expand only the topic they
care about.

## Migration Path

This restructuring can be done incrementally:

1. **Phase 1: Regroup howto guides** — Move existing howto pages into
   topic subdirectories. Add section index pages. This is the highest
   impact change with the least risk (just moving files + adding
   redirects from old URLs).

2. **Phase 2: Merge Introduction + Tour** — Condense the Tour into
   "First Steps" pages. Redirect old Tour URLs.

3. **Phase 3: Dissolve Integration** — Move Integration content into
   the appropriate diataxis sections. Add redirects.

4. **Phase 4: Add stdlib reference** — Auto-generate standard library
   reference pages from the CUE source, similar to how command help
   pages are generated today.

5. **Phase 5: Regroup concept guides** — Move concept pages into topic
   subdirectories.

Each phase can be a separate set of commits/CLs and can be validated
independently.
