---
title: Converting values between Java and CUE
authors: [jpluscplusm,4ad]
tags: [java api]
toc_hide: true
---

The library `cue-api-java` provides a way to use CUE from Java programs.
This tutorial helps you to use the library to convert Java values to CUE
values, and to convert *concrete* CUE values to Java values.

Not all CUE values can be represented in Java. For instance, the CUE constraint
`int & <5` doesn't have a direct equivalent in Java.

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
Place this Java program in the file `ConvertValues.java`:

{{{with upload "en" "code"}}}
-- cue-java-api-tutorials/ConvertValues.java --
import java.util.Arrays;
import org.cuelang.cue.*;

public class ConvertValues {
    public static void main(String[] args) throws Exception {
        var ctx = new CueContext();

        // The toValue() method converts a Java value to a CUE value.
        var v1 = ctx.toValue(42);
        // A Value can also be constructed, which achieves the same result.
        var v2 = new Value(ctx, 42);
        System.out.println("v1 equals v2: " + v1.equals(v2));
        System.out.println();

        // Various Java types can be converted using either mechanism.
        var aBool   = ctx.toValue(false);
        var aLong   = ctx.toValue(42);
        var aDouble = ctx.toValue(1.2345);
        var aString = new Value(ctx, "Hello!");
        byte[] buf  = {1, 2, 3, 4, 5};
        var aSlice  = ctx.toValue(buf);

        // The different getX() methods convert a concrete CUE value to a Java value.
        System.out.println("aBool is: \t" + aBool.getBoolean());
        System.out.println("aLong is: \t" + aLong.getLong());
        System.out.println("aDouble is: " + aDouble.getDouble());
        System.out.println("aString is: " + aString.getString());
        System.out.println("aSlice is: \t" + Arrays.toString(aSlice.getBytes()));
        System.out.println();

        // The getJSON() method converts a concrete CUE value to its JSON
        // representation as a Java String.
        var aStruct = ctx.compile("""
            x: {
                y: {
                    a: true
                    b: 42
                }
            }
        """);
        System.out.println("aStruct as JSON: \t" + aStruct.getJSON());
        System.out.println("aString as JSON: \t" + aString.getJSON());
        System.out.println("aBool as JSON: \t\t" + aBool.getJSON());
    }
}
{{{end}}}
{{{end}}}

## Compile the program

{{{with step}}}
Compile the Java program:

{{{with script "en" "javac"}}}
javac ConvertValues.java
{{{end}}}

The Java compiler automatically uses the value of the `CLASSPATH` environment
variable to locate the JAR file containing `cue-api-java`.
{{{end}}}

## Run the program

{{{with step}}}
Run the Java program:

{{{with script "en" "java"}}}
java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH ConvertValues
{{{end}}}

The Java runtime must be told about a slightly different classpath from the
compiler, through the `-cp` flag, because it needs to locate both the
`cue-api-java` JAR *and* your compiled code. The `--enable-native-access` flag
avoids a runtime warning that the
[Foreign Function & Memory API](https://openjdk.org/jeps/454) is being used by
`cue-api-java`.
{{{end}}}

## Conclusion

Well done - you've successfully converted values between CUE and Java!

See *Related content*, below, for tutorials and guides that explain more about
using CUE in Java.

## Related content

- {{<linkto/related/howto "build-cue-api-java-jar" >}}
- {{<linkto/related/tutorial "get-started-cue-java">}}
- {{<linkto/related/tutorial "handle-errors-java-api">}}
- {{<linkto/related/tutorial "validate-data-schema-java">}}
- {{<tag "java api">}} -- all pages exploring the CUE Java API
