---
title: Handling errors in the Java API
authors: [jpluscplusm,4ad]
tags: [java api]
toc_hide: true
---

The library `cue-api-java` provides a way to use CUE from Java programs.
In certain situations the library might need to let you know that there's a
problem with some CUE that you asked it to handle, and it does this by throwing
a `CueError`. This tutorial helps you learn how to handle errors returned by
`cue-api-java`.

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
end with an asterisk: **make sure you see the trailing `*`**.

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
Place this Java program in the file `HandleErrors.java`:

{{< code-tabs >}}
{{< code-tab name="cue-java-api-tutorials/HandleErrors.java" language="java" area="top-left" >}}
import org.cuelang.cue.*;

public class HandleErrors {
    public static void main(String[] args) {
        var ctx = new CueContext();

        try {
            var v = ctx.compile("x: {"); // Syntax error.
        } catch (CueError e) {
            System.out.println("## Catch block #1");
            System.out.println(e.getMessage());
        }

        try {
            var v = ctx.compile("a: b: c: d: 1");
            var v1 = v.lookup("x"); // Invalid path.
        } catch (CueError e) {
            System.out.println("\n## Catch block #2");
            System.out.println(e.getMessage());
        }

        try {
            var v = ctx.compile("123");
            var s = v.getString(); // Not a string.
        } catch (CueError e) {
            System.out.println("\n## Catch block #3");
            System.out.println(e.getMessage());
        }

        try {
            var v = ctx.compile("{ x: bool, y: 42 }");
            var s = v.getJSON(); // x isn't a concrete value.
        } catch (CueError e) {
            System.out.println("\n## Catch block #4");
            System.out.println(e.getMessage());
        }

        try {
			// Unification of valid CUE never throws an error. The result is
			// always defined, with a value of _|_ (bottom) if unification failed.
            System.out.println("\n## Unification #1");
            var a  = ctx.compile("A: true");
            var b  = ctx.compile("A: true");
			var ab = a.unify(b);
			System.out.println("ab is: " + ab.getJSON());
			System.out.println("printError() reports: ");
            printError(ab);

            System.out.println("\n## Unification #2");
            var x  = ctx.compile("B: 1");
            var y  = ctx.compile("B: 2");
			var xy = x.unify(y);
			System.out.println("printError() reports: ");
            printError(xy);
        } catch (CueError e) {
            System.out.println("## Catch block #5");
		}
    }

    static void printError(Value v) {
        // To check if a unification resulted in an error use the error() method on Value.
		// error() returns a Result, which can be Ok (success) or Err (an error occurred).
        switch (v.error()) {
            case Result.Ok<Value, String> ok -> System.out.println("ok");
            case Result.Err<Value, String> err -> System.out.println(err.err());
        }
    }
}
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

## Compile the program

{{< step stepNumber="7" >}}
Compile the Java program:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YWMgSGFuZGxlRXJyb3JzLmphdmE=" }
$ javac HandleErrors.java
```

The Java compiler automatically uses the value of the `CLASSPATH` environment
variable to locate the JAR file containing `cue-api-java`.
{{< /step >}}

## Run the program

{{< step stepNumber="8" >}}
Run the Java program:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YSAtLWVuYWJsZS1uYXRpdmUtYWNjZXNzPUFMTC1VTk5BTUVEIC1jcCAuOiRDTEFTU1BBVEggSGFuZGxlRXJyb3Jz" }
$ java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH HandleErrors
## Catch block #1
expected '}', found 'EOF'

## Catch block #2
field not found: x

## Catch block #3
cannot use value 123 (type int) as string

## Catch block #4
cue: marshal error: x: cannot convert incomplete value "bool" to JSON

## Unification #1
ab is: {"A":true}
printError() reports: 
ok

## Unification #2
printError() reports: 
B: conflicting values 2 and 1
```

The Java runtime must be told about a slightly different classpath from the
compiler, through the `-cp` flag, because it needs to locate both the
`cue-api-java` JAR *and* your compiled code. The `--enable-native-access` flag
avoids a runtime warning that the
[Foreign Function & Memory API](https://openjdk.org/jeps/454) is being used by
`cue-api-java`.
{{< /step >}}

## Conclusion

Excellent work! You've successfully handled problems in Java related to invalid CUE
syntax, invalid paths, non-concrete value conversions to JSON, and other
runtime errors that can occur.

See *Related content*, below, for tutorials and guides that explain more about
using CUE in Java.

## Related content

- {{<linkto/related/howto "build-cue-api-java-jar" >}}
- {{<linkto/related/tutorial "get-started-cue-java">}}
- {{<linkto/related/tutorial "convert-values-java-cue">}}
- {{<linkto/related/tutorial "validate-data-schema-java">}}
- {{<tag "java api">}} -- all pages exploring the CUE Java API
