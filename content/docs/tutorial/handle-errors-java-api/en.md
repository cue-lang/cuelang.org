---
title: Getting started using CUE in Java
authors: [jpluscplusm,4ad]
tags: [java api]
toc_hide: true
---

The library `cue-api-java` provides a way to use CUE from Java programs.
This tutorial helps you get started using `cue-api-java`,
after you have installed it successfully.

{{<info>}}
`cue-api-java` is an experimental technology preview. This means that it's
under development and its behaviour might change from one release to the next.
{{</info>}}

## Prerequisites

- You need the low-level library
  [libcue](https://github.com/cue-lang/libcue)
  to be compiled and available on your computer,
  which is demonstrated in the guide
  "{{< linkto/inline "howto/build-libcue-shared-library" >}}".
- You must have the Java library
  [cue-api-java](https://github.com/cue-lang/cue-api-java)
  compiled and available on your computer. The guide
  "{{< linkto/inline "howto/build-cue-api-java-jar" >}}"
  shows you how to compile and install it.
  *This tutorial needs you to install the same version as that guide.*
- Your computer needs to have the Java Development Kit (JDK)
  [version 22](https://openjdk.org/projects/jdk/22/)
  (or later) installed. If you need help choosing a distribution of Java,
  the site [whichjdk.com](https://whichjdk.com) is a useful guide.
  Note that many operating systems offer a "Long Term Support" version of Java,
  but this often means JDK version *21*, which isn't recent enough.
  Make sure that you have *version 22 or later!*

## Set up your environment

{{{with step}}}
Tell the operating system (and Java) where to find the library `libcue` on your
computer:

{{{with script "en" "export LD_LIBRARY_PATH"}}}
export LD_LIBRARY_PATH=/usr/local/lib/
{{{end}}}

If you have installed `libcue` into a different directory than `/usr/local/lib/`
then adapt the command to refer to that directory instead.
{{{end}}}

{{{with step}}}
Tell Java where to find the library `cue-api-java` on your computer:

{{{with script "en" "export CLASSPATH"}}}
export CLASSPATH='/usr/local/share/java/*'
{{{end}}}

If you have installed `cue-api-java` into a different directory than
`/usr/local/share/java/` then adapt the command to refer to that directory
instead.
{{{end}}}

{{{with step}}}
Cross-check the value of this important variable:

{{{with script "en" "check CLASSPATH"}}}
echo "$CLASSPATH"
{{{end}}}

Java's requirements mean that we need the value of the `CLASSPATH` variable to
end with an asterisk: **make sure you see the trailing `*`**.

If this value ends with a filename instead of an asterisk (for example:
`/usr/local/share/java/CUE.jar`) then you need to fix this.
Repeat the previous step while making sure that you surround the value of the
variable with quotes (`'`) when you `export` it.
{{{end}}}

{{{with step}}}
Check that this tutorial's prerequisites are present:

{{{with script "en" "check prereqs"}}}
javac --version
ls $LD_LIBRARY_PATH | grep libcue.so || echo 'fail!'
ls $CLASSPATH | grep /CUE.*jar$ || echo 'fail!'
{{{end}}}

If any of these commands fail then your computer doesn't have the related
prerequisite installed as expected and **this is a problem that you need to fix
before continuing with this tutorial.**
{{{end}}}

TODO from here

## Related content

- {{<linkto/related/howto "build-cue-api-java-jar" >}}
- {{<linkto/related/tutorial "get-started-cue-java">}}
- {{<linkto/related/tutorial "convert-values-java-cue">}}
- {{<linkto/related/tutorial "handle-errors-java-api">}}
- {{<linkto/related/tutorial "validate-data-schema-java">}}
