---
title: "Templates"
weight: 160
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


{{{with code "en" "templates"}}}
#nofmt(templates.cue) https://github.com/cue-lang/cue/issues/722

exec cue eval templates.cue
cmp stdout result.txt
-- templates.cue --
// The following struct is unified with all
// elements in job. The name of each element is
// bound to Name and visible in the struct.
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
-- result.txt --
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
{{{end}}}
