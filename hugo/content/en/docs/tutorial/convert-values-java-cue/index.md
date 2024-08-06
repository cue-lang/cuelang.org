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
Place this Java program in the file `ConvertValues.java`:

{{< code-tabs >}}
{{< code-tab name="cue-java-api-tutorials/ConvertValues.java" language="java" area="top-left" >}}
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
{{< /code-tab >}}{{< /code-tabs >}}
{{< /step >}}

## Compile the program

{{< step stepNumber="7" >}}
Compile the Java program:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YWMgQ29udmVydFZhbHVlcy5qYXZh" }
$ javac ConvertValues.java
```

The Java compiler automatically uses the value of the `CLASSPATH` environment
variable to locate the JAR file containing `cue-api-java`.
{{< /step >}}

## Run the program

{{< step stepNumber="8" >}}
Run the Java program:

```text { title="TERMINAL" type="terminal" codeToCopy="amF2YSAtLWVuYWJsZS1uYXRpdmUtYWNjZXNzPUFMTC1VTk5BTUVEIC1jcCAuOiRDTEFTU1BBVEggQ29udmVydFZhbHVlcw==" }
$ java --enable-native-access=ALL-UNNAMED -cp .:$CLASSPATH ConvertValues
v1 equals v2: true

aBool is: 	false
aLong is: 	42
aDouble is: 1.2345
aString is: Hello!
aSlice is: 	[1, 2, 3, 4, 5]

aStruct as JSON: 	{"x":{"y":{"a":true,"b":42}}}
aString as JSON: 	"Hello!"
aBool as JSON: 		false
```

The Java runtime must be told about a slightly different classpath from the
compiler, through the `-cp` flag, because it needs to locate both the
`cue-api-java` JAR *and* your compiled code. The `--enable-native-access` flag
avoids a runtime warning that the
[Foreign Function & Memory API](https://openjdk.org/jeps/454) is being used by
`cue-api-java`.
{{< /step >}}

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
