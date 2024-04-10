---
title: Using CUE with Java
tags:
- java api
authors:
- 4ad
toc_hide: true
---

{{{with _script_ "en" "set caches to speed up re-running"}}}
export GOMODCACHE=/caches/gomodcache
export GOCACHE=/caches/gobuild
{{{end}}}

{{{with _script_ "en" "disable ANSI escape codes from commands"}}}
export MAVEN_ARGS="-B"
export TERM="dumb"
{{{end}}}

We are adding support for using CUE from the Java programming language.

This tutorial demonstrates
how to build and use
[CUE's Java API](https://github.com/cue-lang/cue-api-java),
allowing you to use CUE from the Java programming language.

{{< info >}}
### Warning
This is *experimental* software,
consider it a technology preview.
The technical details described in this document
are subject to change without notice.
{{< /info >}}

## Prerequisites

- **Java `>=22`**
  ([which JDK distribution should I use?](https://whichjdk.com),
  [installation details for Eclipse Temurin](https://adoptium.net/installation))
- **Maven `>=3.8.7`** ([manual installation details](https://maven.apache.org/install.html), or use your package manager)
- **Go `>=1.22`**
  ([installation details](https://go.dev/doc/install),
  [cgo must be enabled](https://pkg.go.dev/cmd/cgo))
- **GCC or Clang** (any version shipped with Linux or macOS will suffice)
- **Git** (any version should suffice)

{{< info >}}
### Warning
The Java CUE API makes use of the [Foreign Function & Memory API](https://openjdk.org/jeps/454)
which only became available in Java 22,
so you will need [JDK 22](https://openjdk.org/projects/jdk/22/)
or newer.
Many package managers default to installing a LTS Java version,
such as Java 21,
make sure to check which version of Java you have installed
before proceeding  further.
{{< /info >}}

First, make sure you have the necessary software prerequisites
installed and configured correctly:

{{{with script "en" "version"}}}
go version
go env CGO_ENABLED
#ellipsis 1
cc -v 2>&1 | sed -n '/ version /p'
#ellipsis 1
java --version
#ellipsis 1
mvn -v
git -v
{{{end}}}

## Installation

Java loads CUE as a shared library (`libcue`),
which must be available to your Java program at runtime,
so let's install `libcue` first.

### Build and install `libcue`

{{{with step}}}
Chose a directory where to put `libcue`
and clone the repository:

{{{with script "en" "clone libcue"}}}
#ellipsis 1
git clone https://github.com/cue-lang/libcue.git
{{{end}}}

{{< info >}}
`libcue` does not yet use stable release versions,
use the latest development version.
{{< /info >}}

{{{end}}}

{{{with step}}}
Then from within that repository run
`go build`:

{{{with script "en" "build libcue"}}}
cd libcue
#ellipsis 0
go build -o libcue.so -buildmode=c-shared
{{{end}}}

Use a target name appropiate for your operating system.
Above we used `libcue.so` which is appropiate for most Unix systems
(such as Linux)
on macOS use `libcue.dylib`,
and on Windows use `cue.dll`
(note the missing prefix).

{{{end}}}

{{{with step}}}
Place the compiled shared object file in a place
where the dynamic loader will find it,
for example on Linux such a place might be
`/usr/local/lib`.

{{{with _script_ "en" "set LD_LIBRARY_PATH"}}}
export LD_LIBRARY_PATH=$(readlink -f .)
{{{end}}}

{{{end}}}

{{< info >}}
Consult your operating system documentation
for information about how it finds shared libraries
and ways to control the search
(such as `LD_LIBRARY_PATH`).
{{< /info >}}

### Build the CUE Java API

{{{with step}}}
Chose a directory where to put `cue-api-java`
and clone the repository:

{{{with script "en" "clone cue-api-java"}}}
cd $HOME
#ellipsis 1
git clone https://github.com/cue-lang/cue-api-java.git
{{{end}}}

{{< info >}}
`cue-api-java` does not yet use stable release versions,
use the latest development version.
{{< /info >}}

{{{end}}}

{{{with step}}}
Then from within that repository run maven.

{{{with script "en" "run maven"}}}
cd cue-api-java
#ellipsis 0
mvn package
{{{end}}}

Maven will run the tests
and if all goes well,
it will generate a JAR file in the `target` directory:

{{{with script "en" "ls jar"}}}
ls target/*.jar
{{{end}}}

{{{end}}}

## Loading CUE from Java

To use CUE from Java you must import classes from `org.cuelang.cue`,
and arrange that the built JAR file is found by the JVM.

You must instantiate a `CueContext`,
which you then can create CUE values from
(of Java `Value` type).
All operations on multiple CUE values must use the same context.

{{{with step}}}
Make sure that you exit the `cue-api-java` directory:

{{{with script "en" "cd $HOME"}}}
cd $HOME
{{{end}}}

{{{end}}}

{{{with step}}}
Write a Java program that loads and manipulates some CUE:

{{{with upload "en" "compile CUE"}}}
-- Compile.java --
import org.cuelang.cue.*;

public class Compile {
    public static void main(String[] args) throws Exception {
        // Create a context before doing anything else.
        //
        // Every CUE value must come from a context, and every CUE operation
        // must use CUE values that come from the same context.
        var ctx = new CueContext();


        // Compile will load and evaluate the CUE code passed as a string.
        var x = ctx.compile("x: true");
        var y = ctx.compile("y: 42");
        var z = ctx.compile("z: { a: true }");

        // Concrete values can be checked for equality.
        var xx = ctx.compile("x: false");
        var yy = ctx.compile("y: 42");
        System.out.println("x equals xx: " + x.equals(xx));
        System.out.println("y equals yy: " + y.equals(yy));

        // CUE values can be unified (merged) to produce more specific
        // (more concrete) values.
        var v1 = ctx.compile("a: int");
        var v2 = ctx.compile("a: 5");
        var v3 = ctx.compile("b: true");
        var v = v1.unify(v2).unify(v3);

        var w = ctx.compile("{ a: 5, b: true }");
        System.out.println("v equals w: " + y.equals(yy));

        // To extract a CUE value from a struct, use the lookup method.
        var s = ctx.compile("x: { a: 1, b: { a: 1} }");
        var xa = s.lookup("x").lookup("a");
        var xba = s.lookup("x.b.a");
        System.out.println("x.a equals x.b.a: " + xa.equals(xba));
    }
}
{{{end}}}

{{{end}}}

{{{with step}}}
Compile and run the Java code,
adding the built CUE JAR file to the Java `CLASSPATH`.
Additionally,
the JVM itself needs special permission to access
native libraries like `libcue`:

{{{with script "en" "Java compile"}}}
CUE_JAR=`ls cue-api-java/target/CUE-*.jar`
javac -cp $CUE_JAR Compile.java
java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Compile
{{{end}}}

{{{end}}}

## Converting between Java and CUE values

Java values can be converted to CUE values.
Additionally,
concrete CUE values that can be represented as Java values
can be converted to one.
Note that not all CUE values can be represented in Java,
for example the CUE value `int & <5` is not representable in Java.

{{< info >}}
`cue-api-java` does not currently support converting between
CUE structs, lists, and Java values.
This feature will be added in the future.
{{< /info >}}

{{{with step}}}
Write a Java program that converts between Java and CUE values:

{{{with upload "en" "convert CUE/Java"}}}
-- Convert.java --
import java.util.Arrays;
import org.cuelang.cue.*;

public class Convert {
    public static void main(String[] args) throws Exception {
        var ctx = new CueContext();

        // You can convert a Java value to a CUE value either directly
        // from a context, or by constructing a Value.
        var n1 = ctx.toValue(42);
        var n2 = new Value(ctx, 42);
        System.out.println("n1 equals n2: " + n1.equals(n2));

        // Different Java types are supported.
        var aBool = ctx.toValue(false);
        var aLong = ctx.toValue(42);
        var aDouble = ctx.toValue(1.2345);
        var aString = ctx.toValue("hello");
        byte[] buf = {1, 2, 3, 4, 5};
        var aSlice = ctx.toValue(buf);

        // To convert an appropiate CUE value to a Java value,
        // use the get methods on Value.
        System.out.println("aBool is " + aBool.getBoolean());
        System.out.println("aLong is " + aLong.getLong());
        System.out.println("aDouble is " + aDouble.getDouble());
        System.out.println("aString is " + aString.getString());
        System.out.println("aSlice is " + Arrays.toString(aSlice.getBytes()));

        // Additionally, every concrete CUE value can be converted to
        // its JSON representation, as a Java String.
        var aStruct = ctx.compile("x: y: { a: true, b: 42}");
        System.out.println("aStruct is " + aStruct.getJSON());
    }
}
{{{end}}}

{{{end}}}

{{{with step}}}
Compile and run the Java code like before:

{{{with script "en" "Java convert"}}}
javac -cp $CUE_JAR Convert.java
java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Convert
{{{end}}}

{{{end}}}

## Dealing with CUE errors

Various CUE operations can fail,
in case of failure the CUE methods throw `CueError`.

{{{with step}}}
Write a Java programs that deals with CUE errors:

{{{with upload "en" "CUE errors"}}}
-- WithErrors.java --
import org.cuelang.cue.*;

public class WithErrors {
    public static void main(String[] args) {
        var ctx = new CueContext();

        try {
            var v = ctx.compile("x: {"); // a syntax error.
        } catch (CueError e) {
            System.err.println(e.getMessage());
        }

        try {
            var v = ctx.compile("a: b: c: d: 1");
            var v1 = v.lookup("x"); // invalid path.
        } catch (CueError e) {
            System.err.println(e.getMessage());
        }

        try {
            var v = ctx.compile("123");
            var s = v.getString(); // not a string.
        } catch (CueError e) {
            System.err.println(e.getMessage());
        }

        try {
            var v = ctx.compile("{ x: bool, y: 42 }");
            var s = v.getJSON(); // not concrete.
        } catch (CueError e) {
            System.err.println(e.getMessage());
        }

        try {
            // Unification doesn't throw an error.
            // the result is always defined, and it is CUE _|_.
            var a = ctx.compile("true");
            var b = ctx.compile("true");
            printError(a.unify(b));

            var x = ctx.compile("1");
            var y = ctx.compile("2");
            printError(x.unify(y));
        } catch (CueError e) {}
    }

    static void printError(Value v) {
        // To check whether unification resulted in an error,
        // use the error method on Value.
        //
        // error returns a Result, which can be Ok (in case of success),
        // or Err (in case of an error).
        switch (v.error()) {
            case Result.Ok<Value, String> ok -> System.out.println("ok");
            case Result.Err<Value, String> err -> System.out.println(err.err());
        }
    }
}
{{{end}}}

{{{end}}}

{{{with step}}}
Compile and run the Java code like before:

{{{with script "en" "Java errors"}}}
javac -cp $CUE_JAR WithErrors.java
java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED WithErrors
{{{end}}}

{{{end}}}

## Validating data against a schema

One of the most common use cases for CUE is validating data against a schema.
The `checkSchema` method on `Value` will throw `CueError`
if the CUE value is not an instance of the schema.

{{{with step}}}
Write a Java program that validates some data against a schema:

{{{with upload "en" "validate CUE"}}}
-- Validate.java --
import org.cuelang.cue.*;

public class Validate {
    public static void main(String[] args) throws Exception {
        var ctx = new CueContext();

        assertDoesNotThrow(() -> {
            ctx.toValue(true).checkSchema(ctx.compile("true"));
            ctx.toValue(true).checkSchema(ctx.compile("bool"));
        });
        assertThrows(CueError.class, () ->
                ctx.toValue(true).checkSchema(ctx.compile("int"))
        );

        assertDoesNotThrow(() -> {
            ctx.toValue(1).checkSchema(ctx.compile("1"));
            ctx.toValue(1).checkSchema(ctx.compile("<128"));
            ctx.toValue(1).checkSchema(ctx.compile("int"));
        });
        assertThrows(CueError.class, () ->
                ctx.toValue(1).checkSchema(ctx.compile(">128"))
        );
        assertThrows(CueError.class, () ->
                ctx.toValue(1).checkSchema(ctx.compile("string"))
        );

        assertDoesNotThrow(() -> {
            ctx.compile("a: b: 1").checkSchema(ctx.compile("a: b: 1"));
            ctx.compile("a: b: 1").checkSchema(ctx.compile("a: b: int"));
            ctx.compile("a: b: 1").checkSchema(ctx.compile("a: b!: int"));
            ctx.compile("a: { b: 1, c: 1 }").checkSchema(ctx.compile("a: b: int"));
            ctx.compile("a: { b: int, c: 1 }").checkSchema(ctx.compile("a: b: int"));
        });

        assertThrows(CueError.class, () ->
                ctx.compile("a: b: 1").checkSchema(ctx.compile("string"))
        );
        assertThrows(CueError.class, () ->
                ctx.compile("a: b: 1").checkSchema(ctx.compile("a: b: 2"))
        );
        assertThrows(CueError.class, () ->
                ctx.compile("a: b: 1").checkSchema(ctx.compile("a: { b: int, c: int }"))
        );
    }

    @FunctionalInterface
    interface ThrowingRunnable {
        void run() throws Exception;
    }

    // Asserts that the given runnable does not throw any exception.
    static void assertDoesNotThrow(ThrowingRunnable runnable) {
        try {
            runnable.run();
        } catch (Exception e) {
            throw new AssertionError(
                "Expected no exception to be thrown, but got: " + e
            );
        }
    }

    // Asserts that the given runnable throws the expected exception.
    static <T extends Throwable> void assertThrows(
        Class<T> expectedException, ThrowingRunnable runnable) {
        try {
            runnable.run();
            throw new AssertionError(
                "Expected exception: " +
                expectedException.getName() +
                " to be thrown, but nothing was thrown."
            );
        } catch (Throwable actualException) {
            if (!expectedException.isInstance(actualException)) {
                throw new AssertionError(
                    "Expected exception: " +
                    expectedException.getName() +
                    " but got: " +
                    actualException
                );
            }
        }
    }
}
{{{end}}}

{{{end}}}

{{{with step}}}
Compile and run the Java code like before:

{{{with script "en" "validate CUE"}}}
javac -cp $CUE_JAR Validate.java
java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Validate
{{{end}}}

In this case there is no output.

{{{end}}}

## Congratulations!

Well done -- now you know how to use CUE from Java.

## Related content

- [`cuelang.org/go` Go API docs](https://pkg.go.dev/cuelang.org/go)
