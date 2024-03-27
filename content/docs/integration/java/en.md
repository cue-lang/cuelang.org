---
title: "Java"
description: "How CUE integrates with the Java Programming Language"
weight: 30
toc_hide: false
---
We are adding support for using CUE from the Java programming language.

{{< info >}}
### Warning
This is an *experimental* API,
consider it a technology preview.
The technical details described below
are subject to change without notice.
{{< /info >}}

We are currently exposing a subset
of the high-level [CUE API](https://pkg.go.dev/cuelang.org/go/cue).
The exposed API surface will be expanded with time.

## Prerequistes

The Java CUE API makes use of the [Foreign Function & Memory API](https://openjdk.org/jeps/454)
which only became available in Java 22,
so you will need [JDK 22](https://openjdk.org/projects/jdk/22/)
or newer.

Additionally you need [Apache Maven](https://maven.apache.org).
Version 3.9.6 was tested, other versions may work.

You will also need to have [Go 1.21 or later](https://go.dev/doc/install)
and a working C compiler
(clang or gcc).

## Installation

Java loads CUE as a shared library (`libcue`),
which must be available to your Java program at runtime,
so let's install `libcue` first.

### Build and install `libcue`

Chose a directory where to put `libcue`
and clone the repository:

    git clone https://github.com/cue-lang/libcue.git

Then from within that repository run
one of the following commands,
depending your system:

    go build -o libcue.so -buildmode=c-shared      # on Linux, BSD, etc
    go build -o libcue.dylib -buildmode=c-shared   # on macOS
    go build -o cue.dll -buildmode=c-shared        # on Windows

{{< info >}}
Eventually you will be able to do
	go install -o libcue.so -buildmode=c-shared cuelang.org/c/cue@latest
but we are not there yet.
{{< /info >}}

Put the generated shared object in a place
where the dynamic loader will find it,
for example on Linux such a place might be
`/usr/local/lib`.

Consult your operating system documentation
for information about how it finds shared libraries
and ways to control the search
(such as `LD_LIBRARY_PATH`).

### Build the CUE Java API

Chose a directory where to put `cue-api-java`
and clone the repository:

	git clone https://github.com/cue-lang/cue-api-java.git

Then from within that repository run maven.

	mvn package

Maven will run the tests
which need runtime access to `libcue` to run
therefore you might need to set `LD_LIBRARY_PATH`
(or your system's equivalent),
or alternatively set `-Djava.library.path` in `MAVEN_OPTS`
(see [Configuring Apache Maven](https://maven.apache.org/configure.html)).

From now on we will assume
you have managed to configure your system
or Java to find `libcue`.

Maven will generate a JAR file in the `target` directory,
such as `target/CUE-0.0-devel.jar`.

## Usage

The Java API roughly mirrors the [Go API](https://pkg.go.dev/cuelang.org/go/cue) for CUE,
but with Java idioms and conventions.
The API uses Java naming conventions,
makes extensive use of function overloading,
and uses exceptions.
Additionally it makes use of sealed interface
to encode variant types.

We will assume you know how to use a JAR file in your Java project.

Below we give a taste of what is possible with the Java API.
More functionality is available, check the code itself.

### Load CUE into Java

All CUE values need to be created from a `CueContext`.

	var ctx = new CueContext();

{{< info >}
When combining multiple CUE values
make sure you use the same `CueContext`.
{{< /info >}}

CUE source code
(as a `String` or byte[]`)
can be compiled to a CUE value
by the `CueContext.compile` method.

	var x = ctx.compile("x: 1");
	var y = ctx.compile("y: hello");

`compile` can take optional build parameters,
such as:

	var z = ctx.compile("z: true", new BuildOption.FileName("empty.cue"))

### Load Java values into CUE

To convert Java values into CUE values,
use either the `CueContext.toValue` method,
or the `Value.Value` constructors.

	var aBool = ctx.toValue(false);
	var anInt = ctx.toValue(42);
	var aFloat = ctx.toValue(0.1);

	var aString = Value(ctx, "hello");
	var anotherString = ctx.toValue("world);

As Java doesn't have unsigned integers,
if you have a `long` that represents unsigned data,
use `CueContext.toValueAsUnsigned`
to convert it to CUE.

	var anUnsigned = ctx.toValueAsUnsigned(0xcafebabeL);

Currently Java `boolean`, `long`, 'double`, `String`, and `byte[]`
can be converted to CUE.

The Java to CUE convertion functions will always succed
because all Java values can be represented in CUE.

### Decode CUE values into Java types

To convert CUE values into regular Java values,
use the various "get" methods of `Value`,
such as `getString`, `getBoolean`,
and so on.

	var b = aBool.getBoolean();
	var n = anInt.getLong();
	var f = aFloat.getFloat();
	var s = aString.getString();
	var u = anUnsigned.getLongAsUnsigned();

There is an additional `Value.getJSON` method
which returns the JSON representation of a CUE value
as a Java `String`.

All these functions can fail,
if the CUE value can't be represented
by the corresponding Java type,
in which case they throw `CueError`;

### Work with CUE values

Merging two CUE values together is accomplished by `Value.unify`.

	var v1 = ctx.Compile("int");
	var v2 = ctx.toValue(42);
	var v = v1.unify(v2);

`Value.unify` never throws an error,
but the result may be bottom,
use `Value.error` to check.

To navigate a CUE struct use `Value.lookup`.

	var v = ctx.compile("{ a: 1, b: { c: true, d: \"hello\" } }");

	var a = v.lookup("a").getLong(); // a==1
	var c = v.lookup("b").lookup("c").getBoolean(); // c==true

`Value.lookup` throws `CueError` if the path doesn't exists.

To compare two CUE values for equality use `Value.equals`.

	var b = ctx.toValue(1).equals(v.lookup("a"));

Only concrete CUE values can be compared for equality.

To validate a value against a schema use `Value.checkSchema`
which throws `CueError` in case of failure.

	ctx.toValue(1).checkSchema(ctx.compile("int"));
	ctx.toValue(2).checkSchema(ctx.compile("int | string"));
	ctx.toValue("hi").checkSchema(ctx.compile("int | string"));
	ctx.toValue(3).checkSchema(ctx.compile("<128"));

	ctx.compile("a: b: 1").checkSchema(ctx.compile("a: b!: int"));
	ctx.compile("a: { b: int, c: 1 }").checkSchema(ctx.compile("a: b: int"));

	ctx.toValue(true).checkSchema(ctx.compile("string")) // throws CueError

To work with attributes,
use the `Attribute` class,
an instance of which is returned by `Value.attributes`.

	var v = ctx.compile("x: int @baz(1, foo, bar=baz)");

	var a = c.attributes()[0];   // first (only) attribute

	var attrName = a.name();     // attrName==baz
	var attrVal = a.value();     // attrVal=="1, foo, bar=baz"
	var argCount = a.argCount(); // argCount==3

	var a0 = a.arg(0);  // a0==Attribute.Arg.Value("1")
	var a1 = a.arg(1);  // a1==Attribute.Arg.Value("foo")
	var a2 = a.arg(2);  // a2==Attribute.Arg.KeyValue("bar", "baz")
