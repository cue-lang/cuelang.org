---
title: Templates
weight: 160
---

**Templating** is a highly effective way to reduce boilerplate
by specifying optional fields in bulk.
It allows the specification of constraints, or **templates**,
which are unified with the fields of a struct.

A template is introduced by a pattern, which is an expression in square
brackets that selects which fields may be augmented.
Each combination of the pattern and a constraint that it applies is called a
**pattern constraint**.
Currently, patterns must either be instances of `string`, or must be top (`_`).

Including an alias in the pattern's square brackets
makes the label of each matched field available
inside the scope of the template, via the alias.

{{< code-tabs >}}
{{< code-tab name="file.cue" language="cue" area="top-left" >}}
job: {
	nginx: replicas:  2
	manager: command: "monit -I"
	etcd:     _
	boltdb:   _
	postgres: _
}

job: [Name=_]: {
	name:     Name
	command:  string | *"exec \(Name)"
	replicas: uint | *1
}

// Databases are important, so increase the
// replica minimum and default.
job: [#DB]: replicas: >=3 | *3
#DB: =~"db$" | "etcd" | "postgres" | "mysql"
{{< /code-tab >}}
{{< code-tab name="TERMINAL" language="" area="top-right" type="terminal" codetocopy="Y3VlIGV4cG9ydCBmaWxlLmN1ZQ==" >}}
$ cue export file.cue
{
    "job": {
        "nginx": {
            "name": "nginx",
            "command": "exec nginx",
            "replicas": 2
        },
        "manager": {
            "name": "manager",
            "command": "monit -I",
            "replicas": 1
        },
        "etcd": {
            "name": "etcd",
            "command": "exec etcd",
            "replicas": 3
        },
        "boltdb": {
            "name": "boltdb",
            "command": "exec boltdb",
            "replicas": 3
        },
        "postgres": {
            "name": "postgres",
            "command": "exec postgres",
            "replicas": 3
        }
    }
}
{{< /code-tab >}}
{{< /code-tabs >}}
