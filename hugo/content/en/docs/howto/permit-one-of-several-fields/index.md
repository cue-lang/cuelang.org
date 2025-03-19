---
title: Permitting one of several fields FIXME -- not just "one" of?
authors: [jpluscplusm, mvdan]
toc_hide: true
---

Use the built-in function `matchN` to ... FIXME

keywords: "mutually exclusive", "combination", "embedding".
Choose prose to capture the searches of folks looking for exactly this content, and distinguish this guide from https://cuelang.org/docs/howto/use-the-built-in-function-matchn/ (which also talks about "one of", etc)

## Exactly-one-of

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

#Schema: {
	A?: string
	B?: string
	C?: string
	matchN(1, [{A!: _}, {B!: _}, {C!: _}])
}

x: #Schema & {A: "foo"}
y: #Schema & {B: "bar"}
z: #Schema & {A: "foo", B: "bar"}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
z: invalid value {A:"foo",B:"bar",C?:string} (does not satisfy matchN): 2 matched, expected 1:
    ./file.cue:7:2
    ./file.cue:7:9
    ./file.cue:12:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Exactly-two-of

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

#Schema: {
	A?: string
	B?: string
	C?: string
	matchN(2, [{A!: _}, {B!: _}, {C!: _}])
}

x: #Schema & {A: "foo", B: "bar"}
y: #Schema & {B: "bar", C: "baz"}
z: #Schema & {A: "foo", B: "bar", C: "baz"}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
z: invalid value {A:"foo",B:"bar",C:"baz"} (does not satisfy matchN): 3 matched, expected 2:
    ./file.cue:7:2
    ./file.cue:7:9
    ./file.cue:12:4
{{< /code-tab >}}
{{< /code-tabs >}}

## At-least-one-of

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top" >}}
package example

#Schema: {
	A?: string
	B?: string
	C?: string
	matchN(>=1, [{A!: _}, {B!: _}, {C!: _}])
}

x: #Schema & {A: "foo"}
y: #Schema & {B: "bar", C: "baz"}
z: #Schema & {}
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="bottom" type="terminal" codetocopy="Y3VlIHZldCAtYw==" >}}
$ cue vet -c
z: invalid value {A?:string,B?:string,C?:string} (does not satisfy matchN): 0 matched, expected >=1:
    ./file.cue:7:2
    ./file.cue:7:9
    ./file.cue:12:4
{{< /code-tab >}}
{{< /code-tabs >}}

## Related content
- https://cuelang.org/docs/howto/use-the-built-in-function-matchn/
