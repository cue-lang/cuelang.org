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

{{< step stepNumber="1" >}}
Tell the operating system (and Java) where to find the library `libcue` on your
computer:

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IExEX0xJQlJBUllfUEFUSD0vdXNyL2xvY2FsL2xpYi8=" }
$ export LD_LIBRARY_PATH=/usr/local/lib/
```

If you have installed `libcue` into a different directory than `/usr/local/lib/`
then adapt the command to refer to that directory instead.
{{< /step >}}

{{< step stepNumber="2" >}}
Tell Java where to find the library `cue-api-java` on your computer:

```text { title="TERMINAL" type="terminal" codeToCopy="ZXhwb3J0IENMQVNTUEFUSD0nL3Vzci9sb2NhbC9zaGFyZS9qYXZhLyon" }
$ export CLASSPATH='/usr/local/share/java/*'
```

If you have installed `cue-api-java` into a different directory than
`/usr/local/share/java/` then adapt the command to refer to that directory
instead.
{{< /step >}}

{{< step stepNumber="3" >}}
Cross-check the value of this important variable:

```text { title="TERMINAL" type="terminal" codeToCopy="ZWNobyAiJENMQVNTUEFUSCI=" }
$ echo "$CLASSPATH"
/usr/local/share/java/*
```

Java's requirements mean that we need the value of the `CLASSPATH` variable to
end with an asterisk -- **make sure you see the trailing `*`**.

If this value ends with a filename instead of an asterisk (for example:
`/usr/local/share/java/CUE.jar`) then you need to fix this.
Repeat the previous step while making sure that you surround the value of the
variable with quotes (`'`) when you `export` it.
{{< /step >}}

{{< step stepNumber="4" >}}
Check that this tutorial's prerequisites are present:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YWMgLS12ZXJzaW9uCmxzICRMRF9MSUJSQVJZX1BBVEggfCBncmVwIGxpYmN1ZS5zbyB8fCBlY2hvICdmYWlsIScKbHMgJENMQVNTUEFUSCB8IGdyZXAgL0NVRS4qamFyJCB8fCBlY2hvICdmYWlsISc=" }
$ javac --version
javac 22.0.2
$ ls $LD_LIBRARY_PATH | grep libcue.so || echo 'fail!'
libcue.so
$ ls $CLASSPATH | grep /CUE.*jar$ || echo 'fail!'
/usr/local/share/java/CUE.jar
```

If any of these commands fail then your computer doesn't have the related
prerequisite installed as expected and **this is a problem that you need to fix
before continuing with this tutorial.**
{{< /step >}}

{{< step stepNumber="5" >}}
Create a directory to hold some files, and change into it:

```text { title="TERMINAL" type="terminal" codeToCopy="bWtkaXIgLXAgY3VlLWphdmEtYXBpLXR1dG9yaWFscwpjZCBjdWUtamF2YS1hcGktdHV0b3JpYWxz" }
$ mkdir -p cue-java-api-tutorials
$ cd cue-java-api-tutorials
```
{{< /step >}}

## Create a Java program

{{< step stepNumber="6" >}}
Place this Java program in the file `GetStarted.java`:

{{< code-tabs >}}
{{< code-tab name="cue-java-api-tutorials/GetStarted.java" language="java" area="top-left" >}}
import org.cuelang.cue.*;

public class GetStarted {
    public static void main(String[] args) throws Exception {
        // Begin by creating a context. Every CUE value must come from a
        // context, and every CUE operation must use CUE values that come from
        // the *same* context.
        var ctx = new CueContext();

        // The compile() method loads CUE passed as a string and evaluates it.
        var a1 = ctx.compile("x: true");
        var b1 = ctx.compile("y: 42");

        // The equals() method checks concrete values for equality.
        var a2 = ctx.compile("x: false");
        var b2 = ctx.compile("y: 42");
        System.out.println("a1 equals a2:\t\t\t" + a1.equals(a2));
        System.out.println("b1 equals b2:\t\t\t" + b1.equals(b2));

        // The unify() method unifies CUE values, returning a new CUE value.
        var c1 = ctx.compile("a: int");
        var c2 = ctx.compile("a: 5");
        var c3 = ctx.compile("b: true");
        var c = c1.unify(c2).unify(c3);
        var d = ctx.compile("{ a: 5, b: true }");
        System.out.println("c equals d:\t\t\t\t" + c.equals(d));

        // The lookup() method extracts a CUE value from a struct.
        var s = ctx.compile("""
            A: {
                val: 1
                B: {
                    val: 1
                }
            }
        """);
        var sAval  = s.lookup("A").lookup("val");
        var sABval = s.lookup("A.B.val");
        System.out.println("A.val equals A.B.val:\t" + sAval.equals(sABval));
    }
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

## Compile the program

{{< step stepNumber="7" >}}
Compile the Java program:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YWMgR2V0U3RhcnRlZC5qYXZh" }
$ javac GetStarted.java
```

The Java compiler automatically uses the value of the `CLASSPATH` environment
variable to locate the JAR file containing `cue-api-java`.
{{< /step >}}

## Run the program

{{< step stepNumber="8" >}}
Run the Java program:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YSAtLWVuYWJsZS1uYXRpdmUtYWNjZXNzPUFMTC1VTk5BTUVEIC1jcCAuOiRDTEFTU1BBVEggR2V0U3RhcnRlZA==" }
$ java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH GetStarted
a1 equals a2:			false
b1 equals b2:			true
c equals d:				true
A.val equals A.B.val:	true
```

The Java runtime must be told about a slightly different classpath from the
compiler, through the `-cp` flag, because it needs to locate both the
`cue-api-java` JAR *and* your compiled code. The `--enable-native-access` flag
avoids a runtime warning that the
[Foreign Function & Memory API](https://openjdk.org/jeps/454) is being used by
`cue-api-java`.
{{< /step >}}

## Related content

- {{<linkto/related/howto "build-cue-api-java-jar" >}}
- {{<linkto/related/tutorial "get-started-cue-java">}}
- {{<linkto/related/tutorial "convert-values-java-cue">}}
- {{<linkto/related/tutorial "handle-errors-java-api">}}
- {{<linkto/related/tutorial "validate-data-schema-java">}}
