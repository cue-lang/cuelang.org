---
title: Validating data against a schema in Java
authors: [4ad,jpluscplusm]
tags: [java api]
toc_hide: true
---

The library `cue-api-java` provides a way to use CUE from Java programs.
A common use for CUE is validating data against a schema, and this tutorial
shows you how to use the the `checkSchema()` method to check a `Value` against
a schema. The method throws `CueError` if the CUE value is *not* an instance of
the schema.

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

{{{with step}}}
Create a directory to hold some files, and change into it:

{{{with script "en" "mkdir chdir"}}}
mkdir -p cue-java-api-tutorials
cd cue-java-api-tutorials
{{{end}}}
{{{end}}}

## Create a Java program

{{{with step}}}
Place this Java program in the file `CheckSchema.java`:

{{{with upload "en" "code"}}}
-- cue-java-api-tutorials/CheckSchema.java --
import org.cuelang.cue.*;

public class CheckSchema {
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

## Compile the program

{{{with step}}}
Compile the Java program:

{{{with script "en" "javac"}}}
javac CheckSchema.java
{{{end}}}

The Java compiler automatically uses the value of the `CLASSPATH` environment
variable to locate the JAR file containing `cue-api-java`.
{{{end}}}

## Run the program

{{{with step}}}
Run the Java program:

{{{with script "en" "java"}}}
java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH CheckSchema
{{{end}}}

This program doesn't produce any output, demonstrating that all its positive
and negative assertions succeed, as expected.

The Java runtime must be told about a slightly different classpath from the
compiler, through the `-cp` flag, because it needs to locate both the
`cue-api-java` JAR *and* your compiled code. The `--enable-native-access` flag
avoids a runtime warning that the
[Foreign Function & Memory API](https://openjdk.org/jeps/454) is being used by
`cue-api-java`.
{{{end}}}

## Conclusion

Great job! You've managed to run some Java that demonstrates CUE being used to
validate data against schemas.

See *Related content*, below, for tutorials and guides that explain more about
using CUE in Java.

## Related content

- {{<linkto/related/howto "build-cue-api-java-jar" >}}
- {{<linkto/related/tutorial "get-started-cue-java">}}
- {{<linkto/related/tutorial "convert-values-java-cue">}}
- {{<linkto/related/tutorial "handle-errors-java-api">}}
- {{<tag "java api">}} -- all pages exploring the CUE Java API
