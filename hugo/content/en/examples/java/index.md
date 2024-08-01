---
title: An example page that demonstrates the site can run Java and Maven
---

## Java

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

Compile and run the Java code,
adding the prebuilt `libcue` JAR to the Java `CLASSPATH` via a wildcard.
Additionally, the JVM itself needs special permission to access native
libraries like `libcue`:

```text { title="TERMINAL" type="terminal" codeToCopy="Q1VFX0pBUj0vdXNyL2xvY2FsL3NoYXJlL2phdmEvKgpqYXZhYyAtY3AgIiRDVUVfSkFSIiBDb21waWxlLmphdmEKamF2YSAtY3AgIi46JENVRV9KQVIiIC0tZW5hYmxlLW5hdGl2ZS1hY2Nlc3M9QUxMLVVOTkFNRUQgQ29tcGlsZQ==" }
$ CUE_JAR=/usr/local/share/java/*
$ javac -cp "$CUE_JAR" Compile.java
$ java -cp ".:$CUE_JAR" --enable-native-access=ALL-UNNAMED Compile
x equals xx: false
y equals yy: true
v equals w: true
x.a equals x.b.a: true
```

## Maven

```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9jdWUtYXBpLWphdmEuZ2l0CmNkIGN1ZS1hcGktamF2YQptdm4gcGFja2FnZQ==" }
$ git clone https://github.com/cue-lang/cue-api-java.git
Cloning into 'cue-api-java'...
...
$ cd cue-api-java

# Some colourised Maven output appears to be unavoidable,
# even with -B, hence ellipsis=0
$ mvn package
...
```
