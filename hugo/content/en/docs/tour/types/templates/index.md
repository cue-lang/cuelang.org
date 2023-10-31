---
title: "Templates"
weight: 16
---
One of CUE's most powerful features is the ability
to specify optional fields in bulk.
This allows one to specify constraints,
or templates,
to be unified with each field of a struct.

An optional field set is an expression in square brackets
to specify to which fields to apply a constraint
(currently only `string`, or all fields is supported).
Using an alias in the square brackets binds the
label of the matched field to the given identifier,
which can then be used within the template.


{{< code-tabs >}}
{{< code-tab name="CUE" language="text"  area="top-left" >}}
// The following struct is unified with all elements in job.
// The name of each element is bound to Name and visible in the struct.
job: [Name=_]: {
    name:     Name
    replicas: uint | *1
    command:  string
}

job: list: command: "ls"

job: nginx: {
    command:  "nginx"
    replicas: 2
}
{{< /code-tab >}}
{{< code-tab name="CUE" language="text" type="terminal" area="top-right" >}}
job: {
    list: {
        name:     "list"
        replicas: 1
        command:  "ls"
    }
    nginx: {
        name:     "nginx"
        command:  "nginx"
        replicas: 2
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
