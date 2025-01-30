---
title: Templates
weight: 160
---

**Templating** is a highly effective way to reduce boilerplate
by specifying optional fields in bulk.
It allows the specification of constraints, or **templates**,
which are unified with every field of a struct that matches a given pattern.

A template's pattern is an expression in square brackets that selects which
fields will be constrained.
Each combination of the pattern and a constraint that it applies is called a
[**pattern constraint**]({{< relref "docs/tour/basics/folding-structs" >}}).
Currently, patterns must either be instances of `string`, or must be `_`.

Including an alias in the pattern's square brackets makes the label of each
matched field available inside the template.

{{{with code "en" "tour"}}}
exec cue export file.cue
cmp stdout out
-- file.cue --
job: {
	nginx: replicas:  2
	manager: command: "monit -I"
	policyd: _
	boltdb: replicas:   3
	postgres: replicas: 5
}

job: [Name=_]: {
	name:     Name // Name is an alias.
	command:  string | *"exec \(Name)"
	replicas: uint | *1
}

// Databases are important, so increase the
// replica minimum.
job: [#DB]: replicas: >=3
#DB: "postgres" | "mysql" | =~"db$"
-- out --
{
    "job": {
        "nginx": {
            "replicas": 2,
            "name": "nginx",
            "command": "exec nginx"
        },
        "manager": {
            "command": "monit -I",
            "name": "manager",
            "replicas": 1
        },
        "policyd": {
            "name": "policyd",
            "command": "exec policyd",
            "replicas": 1
        },
        "boltdb": {
            "replicas": 3,
            "name": "boltdb",
            "command": "exec boltdb"
        },
        "postgres": {
            "replicas": 5,
            "name": "postgres",
            "command": "exec postgres"
        }
    }
}
{{{end}}}
