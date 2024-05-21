---
title: Why CUE?
weight: 20
---

### Separate configuration from computation

There comes a time that one (seemingly) will need do complex
computations to generate some configuration data.
But simplicity of a configuration language can be paramount when one quickly
needs to make changes.
These are obviously conflicting interests.

CUE takes the stance that computation and configuration should
be separated.
And CUE actually makes this easy.
The data that needs to be computed can be generated outside of CUE
and put in a file that is to be mixed in.
The data can even be generated in CUE's scripting layer and automatically
injected in a configuration pipeline.
Both approaches rely on CUE's property that the order in which this data gets
added is irrelevant.



### Be useful at all scales

The usefulness of a language may depend on the scale of the project.
Having too many different languages can put a cognitive strain on
developers, though, and migrating from one language to another as
scaling requirements change can be very costly.
CUE aims to minimize these costs
by covering a myriad of data- and configuration-related tasks at all scales.

**Small scale**
At small scales, reducing boilerplate in configurations is not necessarily
the best thing to do.
Even at a small scale, however, repetition can be error prone.
For such cases, CUE can define schema to validate otherwise
typeless data files.

**Medium scale**
As soon the desire arises to reduce boilerplate, the `cue` tool can
help to automatically rewrite configurations.
See the Quick and Dirty section of the
[Kubernetes tutorial](https://github.com/cue-labs/cue-by-example/blob/main/003_kubernetes_tutorial/README.md)
for an example using the `import` and `trim` tool.
Thousands of lines can be obliterated automatically using this approach.

**Large scale**
CUE's underlying formalism was developed for large-scale configuration.
Its import model incorporates best practices for large-scale engineering
and it is optimized for automation.
A key to this is advanced tooling.
The mathematical model underlying CUE's operations allows for
automation that is intractable for most other approaches.
CUE's `trim` command is an example of this.


### Tooling

Automation is key.
Nowadays, a good chunk of code gets generated, analyzed, reformatted,
and so on by machines.
The CUE language, APIs, and tooling have been designed to allow for
machine manipulation.
Aspects of this are:

- make the language easy to scan and parse,
- restrictions on imports,
- allow any piece of data to be split across files and generated
  from different sources,
- define packages at the directory level,
- and of course its value and type model.

The order independence also plays a key role in this.
It allows combining constraints from various sources without having
to define any order in which they are to be applied to get
predictable results.


<!-- something about this?
Not turing complete.
Run in contexts where cost is hard to attribute.
Easier to make claims about termination (smart contracts).
-->
