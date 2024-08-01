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

```text { title="TERMINAL" type="terminal" codeToCopy="Z2l0IGNsb25lIGh0dHBzOi8vZ2l0aHViLmNvbS9jdWUtbGFuZy9jdWUtYXBpLWphdmEuZ2l0CmNkIGN1ZS1hcGktamF2YQptdm4gLS1jb2xvcj1uZXZlciBwYWNrYWdlCjoKbHMgLWwgdGFyZ2V0LyouamFyIC91c3IvbG9jYWwvc2hhcmUvamF2YS8qLmphcgptZDVzdW0gdGFyZ2V0LyouamFyIC91c3IvbG9jYWwvc2hhcmUvamF2YS8qLmphcg==" }
$ git clone https://github.com/cue-lang/cue-api-java.git
Cloning into 'cue-api-java'...
...
$ cd cue-api-java
$ mvn --color=never package
[0m[0m[INFO] Scanning for projects...
[WARNING] 
[WARNING] Some problems were encountered while building the effective model for org.cuelang:CUE:jar:0.0-devel
[WARNING] 'dependencies.dependency.version' for org.jetbrains:annotations:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 25, column 22
[WARNING] 'dependencies.dependency.version' for org.junit.jupiter:junit-jupiter:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 31, column 22
[WARNING] 
[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
[WARNING] 
[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
[WARNING] 
[INFO] 
[INFO] --------------------------< org.cuelang:CUE >---------------------------
[INFO] Building CUE 0.0-devel
[INFO]   from pom.xml
[INFO] --------------------------------[ jar ]---------------------------------
[INFO] 
[INFO] --- resources:3.3.1:resources (default-resources) @ CUE ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /home/runner/cue-api-java/src/main/resources
[INFO] 
[INFO] --- compiler:3.10.1:compile (default-compile) @ CUE ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 14 source files to /home/runner/cue-api-java/target/classes
[INFO] 
[INFO] --- resources:3.3.1:testResources (default-testResources) @ CUE ---
[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
[INFO] skip non existing resourceDirectory /home/runner/cue-api-java/src/test/resources
[INFO] 
[INFO] --- compiler:3.10.1:testCompile (default-testCompile) @ CUE ---
[INFO] Changes detected - recompiling the module!
[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
[INFO] Compiling 3 source files to /home/runner/cue-api-java/target/test-classes
[INFO] 
[INFO] --- surefire:3.0.0-M5:test (default-test) @ CUE ---
[INFO] 
[INFO] -------------------------------------------------------
[INFO]  T E S T S
[INFO] -------------------------------------------------------
[INFO] Running org.cuelang.cue.AttributeTest
[INFO] Tests run: 6, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.478 s - in org.cuelang.cue.AttributeTest
[INFO] Running org.cuelang.cue.CueContextTest
[INFO] Tests run: 17, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.222 s - in org.cuelang.cue.CueContextTest
[INFO] Running org.cuelang.cue.ValueTest
[INFO] Tests run: 32, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.266 s - in org.cuelang.cue.ValueTest
[INFO] 
[INFO] Results:
[INFO] 
[INFO] Tests run: 55, Failures: 0, Errors: 0, Skipped: 0
[INFO] 
[INFO] 
[INFO] --- jar:3.4.1:jar (default-jar) @ CUE ---
[INFO] Building jar: /home/runner/cue-api-java/target/CUE-0.0-devel.jar
[INFO] ------------------------------------------------------------------------
[INFO] BUILD SUCCESS
[INFO] ------------------------------------------------------------------------
[INFO] Total time:  9.139 s
[INFO] Finished at: 2024-08-01T16:37:18Z
[INFO] ------------------------------------------------------------------------
[0m[0m$ :
$ ls -l target/*.jar /usr/local/share/java/*.jar
-rw-r--r-- 1 root root 97700 Aug  1 09:26 /usr/local/share/java/CUE.jar
-rw-rw-rw- 1 root root 97700 Aug  1 16:37 target/CUE-0.0-devel.jar
$ md5sum target/*.jar /usr/local/share/java/*.jar
b4d1c2fd54a0a6de4b52e7543b1f2be2  target/CUE-0.0-devel.jar
6f7a7422f1ef9274a419ef65ecfe1cc1  /usr/local/share/java/CUE.jar
```
