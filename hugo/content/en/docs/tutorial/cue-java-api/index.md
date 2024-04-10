---
title: Using CUE with Java
tags:
- java api
authors:
- 4ad
toc_hide: true
---

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

```text { title="TERMINAL" codeToCopy="Z28gdmVyc2lvbgpnbyBlbnYgQ0dPX0VOQUJMRUQKY2MgLXYgMj4mMSB8IHNlZCAtbiAnLyB2ZXJzaW9uIC9wJwpqYXZhIC0tdmVyc2lvbgptdm4gLXYKZ2l0IC12" }
$ go version
go version go1.22.3 linux/amd64
$ go env CGO_ENABLED
1
$ cc -v 2>&1 | sed -n '/ version /p'
gcc version 12.2.0 (Debian 12.2.0-14) 
...
$ java --version
openjdk 22.0.1 2024-04-16
...
$ mvn -v
[1mApache Maven 3.8.7[m
...
$ git -v
git version 2.39.2
```

## Installation

Java loads CUE as a shared library (`libcue`),
which must be available to your Java program at runtime,
so let's install `libcue` first.

### Build and install `libcue`

{{< step stepNumber="1" >}}
Chose a directory where to put `libcue`
and clone the repository:

```text { title="TERMINAL" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9saWJjdWUuZ2l0" }
$ git clone https://github.com/cue-lang/libcue.git
Cloning into 'libcue'...
...
```

{{< info >}}
`libcue` does not yet use stable release versions,
use the latest development version.
{{< /info >}}

{{< /step >}}

{{< step stepNumber="2" >}}
Then from within that repository run
`go build`:

```text { title="TERMINAL" codeToCopy="Y2QgbGliY3VlCmdvIGJ1aWxkIC1vIGxpYmN1ZS5zbyAtYnVpbGRtb2RlPWMtc2hhcmVk" }
$ cd libcue
$ go build -o libcue.so -buildmode=c-shared
...
```

Use a target name appropiate for your operating system.
Above we used `libcue.so` which is appropiate for most Unix systems
(such as Linux)
on macOS use `libcue.dylib`,
and on Windows use `cue.dll`
(note the missing prefix).

{{< /step >}}

{{< step stepNumber="3" >}}
Place the compiled shared object file in a place
where the dynamic loader will find it,
for example on Linux such a place might be
`/usr/local/lib`.
{{< /step >}}

{{< info >}}
Consult your operating system documentation
for information about how it finds shared libraries
and ways to control the search
(such as `LD_LIBRARY_PATH`).
{{< /info >}}

### Build the CUE Java API

{{< step stepNumber="4" >}}
Chose a directory where to put `cue-api-java`
and clone the repository:

```text { title="TERMINAL" codeToCopy="Y2QgJEhPTUUKZ2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9jdWUtYXBpLWphdmEuZ2l0" }
$ cd $HOME
$ git clone https://github.com/cue-lang/cue-api-java.git
Cloning into 'cue-api-java'...
...
```

{{< info >}}
`cue-api-java` does not yet use stable release versions,
use the latest development version.
{{< /info >}}

{{< /step >}}

{{< step stepNumber="5" >}}
Then from within that repository run maven.

```text { title="TERMINAL" codeToCopy="Y2QgY3VlLWFwaS1qYXZhCm12biBwYWNrYWdl" }
$ cd cue-api-java
$ mvn package
...
```

Maven will run the tests
and if all goes well,
it will generate a JAR file in the `target` directory:

```text { title="TERMINAL" codeToCopy="bHMgdGFyZ2V0LyouamFy" }
$ ls target/*.jar
target/CUE-0.0-devel.jar
```

{{< /step >}}

## Loading CUE from Java

To use CUE from Java you must import classes from `org.cuelang.cue`,
and arrange that the built JAR file is found by the JVM.

You must instantiate a `CueContext`,
which you then can create CUE values from
(of Java `Value` type).
All operations on multiple CUE values must use the same context.

{{< step stepNumber="6" >}}
Make sure that you exit the `cue-api-java` directory:

```text { title="TERMINAL" codeToCopy="Y2QgJEhPTUU=" }
$ cd $HOME
```

{{< /step >}}

{{< step stepNumber="7" >}}
Write a Java program that loads and manipulates some CUE:

{{< code-tabs >}}
{{< code-tab name="Compile.java" language="java" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="8" >}}
Compile and run the Java code,
adding the built CUE JAR file to the Java `CLASSPATH`.
Additionally,
the JVM itself needs special permission to access
native libraries like `libcue`:

```text { title="TERMINAL" codeToCopy="Q1VFX0pBUj0kKGxzIGN1ZS1hcGktamF2YS90YXJnZXQvQ1VFLSouamFyKQpqYXZhYyAtY3AgJENVRV9KQVIgQ29tcGlsZS5qYXZhCmphdmEgLWNwIC46JENVRV9KQVIgLS1lbmFibGUtbmF0aXZlLWFjY2Vzcz1BTEwtVU5OQU1FRCBDb21waWxl" }
$ CUE_JAR=$(ls cue-api-java/target/CUE-*.jar)
$ javac -cp $CUE_JAR Compile.java
$ java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Compile
x equals xx: false
y equals yy: true
v equals w: true
x.a equals x.b.a: true
```

{{< /step >}}

## Converting between Java and CUE values

Java values can be converted to CUE values.
Additionally,
concrete CUE values that can be represented as Java values
can be converted to one.
Note that not all CUE values can be represented in Java,
for example the CUE value `int && <5` is not representable in Java.

{{< info >}}
`cue-api-java` does not currently support converting between
CUE structs, lists, and Java values.
This feature will be added in the future.
{{< /info >}}

{{< step stepNumber="9" >}}
Write a Java program that converts between Java and CUE values:

{{< code-tabs >}}
{{< code-tab name="Convert.java" language="java" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="10" >}}
Compile and run the Java code like before:

```text { title="TERMINAL" codeToCopy="amF2YWMgLWNwICRDVUVfSkFSIENvbnZlcnQuamF2YQpqYXZhIC1jcCAuOiRDVUVfSkFSIC0tZW5hYmxlLW5hdGl2ZS1hY2Nlc3M9QUxMLVVOTkFNRUQgQ29udmVydA==" }
$ javac -cp $CUE_JAR Convert.java
$ java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Convert
n1 equals n2: true
aBool is false
aLong is 42
aDouble is 1.2345
aString is hello
aSlice is [1, 2, 3, 4, 5]
aStruct is {"x":{"y":{"a":true,"b":42}}}
```

{{< /step >}}

## Dealing with CUE errors

Various CUE operations can fail,
in case of failure the CUE methods throw `CueError`.

{{< step stepNumber="11" >}}
Write a Java programs that deals with CUE errors:

{{< code-tabs >}}
{{< code-tab name="WithErrors.java" language="java" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="12" >}}
Compile and run the Java code like before:

```text { title="TERMINAL" codeToCopy="amF2YWMgLWNwICRDVUVfSkFSIFdpdGhFcnJvcnMuamF2YQpqYXZhIC1jcCAuOiRDVUVfSkFSIC0tZW5hYmxlLW5hdGl2ZS1hY2Nlc3M9QUxMLVVOTkFNRUQgV2l0aEVycm9ycw==" }
$ javac -cp $CUE_JAR WithErrors.java
$ java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED WithErrors
expected '}', found 'EOF'
field not found: x
cannot use value 123 (type int) as string
cue: marshal error: x: cannot convert incomplete value "bool" to JSON
ok
conflicting values 2 and 1
```

{{< /step >}}

## Validating data against a schema

One of the most common use cases for CUE is validating data against a schema.
The `checkSchema` method on `Value` will throw `CueError`
if the CUE value is not an instance of the schema.

{{< step stepNumber="13" >}}
Write a Java program that validates some data against a schema:

{{< code-tabs >}}
{{< code-tab name="Validate.java" language="java" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}

{{< /step >}}

{{< step stepNumber="14" >}}
Compile and run the Java code like before:

```text { title="TERMINAL" codeToCopy="amF2YWMgLWNwICRDVUVfSkFSIFZhbGlkYXRlLmphdmEKamF2YSAtY3AgLjokQ1VFX0pBUiAtLWVuYWJsZS1uYXRpdmUtYWNjZXNzPUFMTC1VTk5BTUVEIFZhbGlkYXRl" }
$ javac -cp $CUE_JAR Validate.java
$ java -cp .:$CUE_JAR --enable-native-access=ALL-UNNAMED Validate
```

In this case there is no output.

{{< /step >}}

## Congratulations!

Well done -- now you know how to use CUE from Java.

## Related content

- [`cuelang.org/go` Go API docs](https://pkg.go.dev/cuelang.org/go)
