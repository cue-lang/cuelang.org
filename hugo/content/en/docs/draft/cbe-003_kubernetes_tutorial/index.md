---
title: CUE By Example - Controlling Kubernetes with CUE
draft: true
---

{{<caution>}}
Source: https://github.com/cue-labs/cue-by-example/tree/main/003_kubernetes_tutorial
{{</caution>}}

In this tutorial we show how to convert Kubernetes configuration files
for a collection of microservices.

The configuration files are scrubbed and renamed versions of
real-life configuration files.
The files are organized in a directory hierarchy grouping related services
in subdirectories.
This is a common pattern.
The `cue` tooling has been optimized for this use case.

In this tutorial we will address the following topics:

1. convert the given YAML files to CUE
1. hoist common patterns to parent directories
1. use the tooling to rewrite CUE files to drop unnecessary fields
1. repeat from step 2 for different subdirectories
1. define commands to operate on the configuration
1. extract CUE templates directly from Kubernetes Go source
1. manually tailor the configuration
1. map a Kubernetes configuration to `docker-compose` (TODO)


## The given data set

The data set is based on a real-life case, using different names for the
services.
All the inconsistencies of the real setup are replicated in the files
to get a realistic impression of how a conversion to CUE would behave
in practice.

The given YAML files are ordered in following directory
(you can use `find` if you don't have tree):

```text { title="TERMINAL" type="terminal" codeToCopy="ZmluZCAuL29yaWdpbmFsIC10eXBlIGYgfCBzb3J0" }
$ find ./original -type f | sort
./original/services/frontend/bartender/kube.yaml
./original/services/frontend/breaddispatcher/kube.yaml
./original/services/frontend/host/kube.yaml
./original/services/frontend/maitred/kube.yaml
./original/services/frontend/valeter/kube.yaml
...
```

Each subdirectory contains related microservices that often share similar
characteristics and configurations.
The configurations include a large variety of Kubernetes objects, including
services, deployments, config maps,
a daemon set, a stateful set, and a cron job.

The result of the first tutorial is in the `quick`, for "quick and dirty"
directory.
A manually optimized configuration can be found int `manual`
directory.


## Importing existing configuration

We first make a copy of the data directory.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3AgLWEgb3JpZ2luYWwgdG1wCmNkIHRtcA==" }
$ cp -a original tmp
$ cd tmp
```

We initialize a module so that we can treat all our configuration files
in the subdirectories as part of one package.
We do that later by giving all the same package name.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIG1vZCBpbml0IGs4cy5leGFtcGxl" }
$ cue mod init k8s.example
```

Creating a module also allows our packages import external packages.

We initialize a Go module so that later we can resolve the
`k8s.io/api/apps/v1` Go package dependency:

```text { title="TERMINAL" type="terminal" codeToCopy="Z28gbW9kIGluaXQgazhzLmV4YW1wbGU=" }
$ go mod init k8s.example
go: creating new go.mod: module k8s.example
go: to add module requirements and sums:
	go mod tidy
```

Let's try to use the `cue import` command to convert the given YAML files
into CUE.

```text { title="TERMINAL" type="terminal" codeToCopy="Y2Qgc2VydmljZXM=" }
$ cd services
```

```
$ cd services
```

Since we have multiple packages and files, we need to specify the package to
which they should belong.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAuLy4uLiAtcCBrdWJl" }
$ cue import ./... -p kube
path, list, or files flag needed to handle multiple objects in file ./services/frontend/bartender/kube.yaml
```

Many of the files contain more than one Kubernetes object.
Moreover, we are creating a single configuration that contains all objects
from all files.
We need to organize all Kubernetes objects such that each is individually
identifiable within the single configuration.
We do so by defining a different struct for each type putting each object
in this respective struct keyed by its name.
This allows objects of different types to share the same name,
just as is allowed by Kubernetes.
To accomplish this, we tell `cue` to put each object in the configuration
tree at the path with the "kind" as first element and "name" as second.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAuLy4uLiAtcCBrdWJlIC1sICdzdHJpbmdzLlRvQ2FtZWwoa2luZCknIC1sIG1ldGFkYXRhLm5hbWUgLWY=" }
$ cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f
```

The added `-l` flag defines the labels for each object, based on values from
each object, using the usual CUE syntax for field labels.
In this case, we use a camelcase variant of the `kind` field of each object and
use the `name` field of the `metadata` section as the name for each object.
We also added the `-f` flag to overwrite the few files that succeeded before.

Let's see what happened:

```text { title="TERMINAL" type="terminal" codeToCopy="ZmluZCAuIC10eXBlIGYgfCBzb3J0" }
$ find . -type f | sort
./frontend/bartender/kube.cue
./frontend/bartender/kube.yaml
./frontend/breaddispatcher/kube.cue
./frontend/breaddispatcher/kube.yaml
./frontend/host/kube.cue
...
```

Each of the YAML files is converted to corresponding CUE files.
Comments of the YAML files are preserved.

The result is not fully pleasing, though.
Take a look at `mon/prometheus/configmap.cue`.

```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCBtb24vcHJvbWV0aGV1cy9jb25maWdtYXAuY3Vl" }
$ head mon/prometheus/configmap.cue
package kube

configMap: prometheus: {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: name: "prometheus"
	data: {
		"alert.rules": """
			groups:
			- name: rules.yaml
```

The configuration file still contains YAML embedded in a string value of one
of the fields.
The original YAML file might have looked like it was all structured data, but
the majority of it was a string containing, hopefully, valid YAML.

The `-R` option attempts to detect structured YAML or JSON strings embedded
in the configuration files and then converts these recursively.

<!-- TODO: update import label format -->

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGltcG9ydCAuLy4uLiAtcCBrdWJlIC1sICdzdHJpbmdzLlRvQ2FtZWwoa2luZCknIC1sIG1ldGFkYXRhLm5hbWUgLWYgLVI=" }
$ cue import ./... -p kube -l 'strings.ToCamel(kind)' -l metadata.name -f -R
```

Now the file looks like:

```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCBtb24vcHJvbWV0aGV1cy9jb25maWdtYXAuY3Vl" }
$ head mon/prometheus/configmap.cue
package kube

import "encoding/yaml"

configMap: prometheus: {
	apiVersion: "v1"
	kind:       "ConfigMap"
	metadata: name: "prometheus"
	data: {
		"alert.rules": yaml.Marshal(_cue_alert_rules)
```

That looks better!
The resulting configuration file replaces the original embedded string
with a call to `yaml.Marshal` converting a structured CUE source to
a string with an equivalent YAML file.
Fields starting with an underscore (`_`) are not included when emitting
a configuration file (they are when enclosed in double quotes).

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLi9tb24vcHJvbWV0aGV1cyAtZSBjb25maWdNYXAucHJvbWV0aGV1cw==" }
$ cue eval ./mon/prometheus -e configMap.prometheus
apiVersion: "v1"
kind:       "ConfigMap"
metadata: {
    name: "prometheus"
}
data: {
    "alert.rules": """
        groups:
          - name: rules.yaml
            rules:
...
```

Yay!


## Quick 'n Dirty Conversion

In this tutorial we show how to quickly eliminate boilerplate from a set
of configurations.
Manual tailoring will usually give better results, but takes considerably
more thought, while taking the quick and dirty approach gets you mostly there.
The result of such a quick conversion also forms a good basis for
a more thoughtful manual optimization.

### Create top-level template

Now we have imported the YAML files we can start the simplification process.

Before we start the restructuring, lets save a full evaluation so that we
can verify that simplifications yield the same results.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90" }
$ cue eval -c ./... >snapshot
```

The `-c` option tells `cue` that only concrete values, that is valid JSON,
are allowed.
We focus on the objects defined in the various `kube.cue` files.
A quick inspection reveals that many of the Deployments and Services share
common structure.

We copy one of the files containing both as a basis for creating our template
to the root of the directory tree.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3AgZnJvbnRlbmQvYnJlYWRkaXNwYXRjaGVyL2t1YmUuY3VlIC4=" }
$ cp frontend/breaddispatcher/kube.cue .
```

Modify this file as below.

{{< code-tabs >}}
{{< code-tab name="tmp/services/kube.cue" language="cue" area="top-left" >}}
package kube

service: [ID=_]: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name: ID
		labels: {
			app:       ID     // by convention
			domain:    "prod" // always the same in the given files
			component: string // varies per directory
		}
	}
	spec: {
		// Any port has the following properties.
		ports: [...{
			port:     int
			protocol: *"TCP" | "UDP" // from the Kubernetes definition
			name:     string | *"client"
		}]
		selector: metadata.labels // we want those to be the same
	}
}

deployment: [ID=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: name: ID
	spec: {
		// 1 is the default, but we allow any number
		replicas: *1 | int
		template: {
			metadata: labels: {
				app:       ID
				domain:    "prod"
				component: string
			}
			// we always have one namesake container
			spec: containers: [{name: ID}]
		}
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

By replacing the service and deployment name with `[ID=_]` we have changed the
definition into a template matching any field.
CUE binds the field name to `ID` as a result.
During importing we used `metadata.name` as a key for the object names,
so we can now set this field to `ID`.

Templates are applied to (are unified with) all entries in the struct in which
they are defined,
so we need to either strip fields specific to the `breaddispatcher` definition,
generalize them, or remove them.

One of the labels defined in the Kubernetes metadata seems to be always set
to parent directory name.
We enforce this by defining `component: string`, meaning that a field
of name `component` must be set to some string value, and then define this
later on.
Any underspecified field results in an error when converting to, for instance,
JSON.
So a deployment or service will only be valid if this label is defined.

<!-- TODO: once cycles in disjunctions are implemented
    port:       targetPort | int   // by default the same as targetPort
    targetPort: port | int         // by default the same as port

Note that ports definition for service contains a cycle.
Specifying one of the ports will break the cycle.
The meaning of cycles are well-defined in CUE.
In practice this means that a template writer does not have to make any
assumptions about which of the fields that can be mutually derived from each
other a user of the template will want to specify.
-->

Let's compare the result of merging our new template to our original snapshot.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90Mg==" }
$ cue eval -c ./... >snapshot2
// k8s.example/services/mon/alertmanager@v0:kube
deployment.alertmanager.spec.template.metadata.labels.component: incomplete value string:
    ./kube.cue:36:16
service.alertmanager.metadata.labels.component: incomplete value string:
    ./kube.cue:11:15
service.alertmanager.spec.selector.component: incomplete value string:
    ./kube.cue:11:15
// k8s.example/services/mon/nodeexporter@v0:kube
service."node-exporter".metadata.labels.component: incomplete value string:
    ./kube.cue:11:15
...
```

Oops.
The alert manager does not specify the `component` label.
This demonstrates how constraints can be used to catch inconsistencies
in your configurations.

As there are very few objects that do not specify this label, we will modify
the configurations to include them everywhere.
We do this by setting a newly defined top-level field in each directory
to the directory name and modify our master template file to use it.

<!--
```
$ cue add */kube.cue -p kube --list <<EOF
#Component: "{{.DisplayPath}}"
EOF
```
-->

```text { title="TERMINAL" type="terminal" codeToCopy="c2VkIC1pLmJhayAncy9jb21wb25lbnQ6LipzdHJpbmcvY29tcG9uZW50OiAjQ29tcG9uZW50Lycga3ViZS5jdWUKcm0ga3ViZS5jdWUuYmFrCmNhdCA8PEVPRiA+Pmt1YmUuY3VlCgojQ29tcG9uZW50OiBzdHJpbmcKRU9GCmxzIC1kICovIHwgc2VkICdzLy4kLy8nIHwgeGFyZ3MgLUkgRElSIHNoIC1jICdjZCBESVI7IGVjaG8gInBhY2thZ2Uga3ViZQoKI0NvbXBvbmVudDogXCJESVJcIgoiID4ga3ViZS5jdWU7IGNkIC4uJwpjdWUgZm10IGt1YmUuY3VlICova3ViZS5jdWU=" }
# set the component label to our new top-level field
$ sed -i.bak 's/component:.*string/component: #Component/' kube.cue
$ rm kube.cue.bak

# add the new top-level field to our previous template definitions
$ cat <<EOF >>kube.cue

#Component: string
EOF

# add a file with the component label to each directory
$ ls -d */ | sed 's/.$//' | xargs -I DIR sh -c 'cd DIR; echo "package kube

#Component: \"DIR\"
" > kube.cue; cd ..'

# format the files
$ cue fmt kube.cue */kube.cue
```

Let's try again to see if it is fixed:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpkaWZmIC13dSBzbmFwc2hvdCBzbmFwc2hvdDIgLS1sYWJlbCBzbmFwc2hvdCAtLWxhYmVsIHNuYXBzaG90Mg==" }
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2 --label snapshot --label snapshot2
--- snapshot
+++ snapshot2
@@ -1,3 +1,9 @@
+service: {}
+deployment: {}
+// ---
+service: {}
+deployment: {}
+// ---
 service: {
     bartender: {
         apiVersion: "v1"
@@ -208,6 +214,7 @@
             selector: {
                 app:    "maitred"
                 domain: "prod"
+                component: "frontend"
             }
         }
     }
...
```

Except for having more consistent labels and some reordering, nothing changed.
We are happy and save the result as the new baseline.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3Agc25hcHNob3QyIHNuYXBzaG90" }
$ cp snapshot2 snapshot
```

The corresponding boilerplate can now be removed with `cue trim`.


```text { title="TERMINAL" type="terminal" codeToCopy="ZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQpjdWUgdHJpbSAuLy4uLgpmaW5kIC4gfCBncmVwIGt1YmUuY3VlIHwgeGFyZ3Mgd2MgLWwgfCB0YWlsIC0x" }
$ find . | grep kube.cue | xargs wc -l | tail -1
 1833 total
$ cue trim ./...
$ find . | grep kube.cue | xargs wc -l | tail -1
 1266 total
```

`cue trim` removes configuration from files that is already generated
by templates or comprehensions.
In doing so it removed over 500 lines of configuration, or over 30%!

The following is proof that nothing changed semantically:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpkaWZmIC13dSBzbmFwc2hvdCBzbmFwc2hvdDIgfCB3YyAtbA==" }
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2 | wc -l
0
```

We can do better, though.
A first thing to note is that DaemonSets and StatefulSets share a similar
structure to Deployments.
We generalize the top-level template as follows:

{{< code-tabs >}}
{{< code-tab name="tmp/services/kube2.cue" language="cue" area="top-left" >}}
package kube

daemonSet: [ID=_]: _spec & {
	apiVersion: "apps/v1"
	kind:       "DaemonSet"
	_name:      ID
}

statefulSet: [ID=_]: _spec & {
	apiVersion: "apps/v1"
	kind:       "StatefulSet"
	_name:      ID
}

deployment: [ID=_]: _spec & {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	_name:      ID
	spec: replicas: *1 | int
}

configMap: [ID=_]: {
	metadata: name: ID
	metadata: labels: component: #Component
}

_spec: {
	_name: string

	metadata: name: _name
	metadata: labels: component: #Component
	spec: selector: {}
	spec: template: {
		metadata: labels: {
			app:       _name
			component: #Component
			domain:    "prod"
		}
		spec: containers: [{name: _name}]
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

The common configuration has been factored out into `_spec`.
We introduced `_name` to aid both specifying and referring
to the name of an object.
For completeness, we added `configMap` as a top-level entry.

Note that we have not yet removed the old definition of deployment.
This is fine.
As it is equivalent to the new one, unifying them will have no effect.
We leave its removal as an exercise to the reader.

Next we observe that all deployments, stateful sets and daemon sets have
an accompanying service which shares many of the same fields.
We add:

{{< code-tabs >}}
{{< code-tab name="tmp/services/kube3.cue" language="cue" area="top-left" >}}
package kube

// Define the _export option and set the default to true
// for all ports defined in all containers.
_spec: spec: template: spec: containers: [...{
	ports: [...{
		_export: *true | false // include the port in the service
	}]
}]

for x in [deployment, daemonSet, statefulSet] for k, v in x {
	service: "\(k)": {
		spec: selector: v.spec.template.metadata.labels

		spec: ports: [
			for c in v.spec.template.spec.containers
			for p in c.ports
			if p._export {
				let Port = p.containerPort // Port is an alias
				port:       *Port | int
				targetPort: *Port | int
			},
		]
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

This example introduces a few new concepts.
Open-ended lists are indicated with an ellipsis (`...`).
The value following an ellipsis is unified with any subsequent elements and
defines the "type", or template, for additional list elements.

The `Port` declaration is an alias.
Aliases are only visible in their lexical scope and are not part of the model.
They can be used to make shadowed fields visible within nested scopes or,
in this case, to reduce boilerplate without introducing new fields.

Finally, this example introduces list and field comprehensions.
List comprehensions are analogous to list comprehensions found in other
languages.
Field comprehensions allow inserting fields in structs.
In this case, the field comprehension adds a namesake service for any
deployment, daemonSet, and statefulSet.
Field comprehensions can also be used to add a field conditionally.


Specifying the `targetPort` is not necessary, but since many files define it,
defining it here will allow those definitions to be removed
using `cue trim`.
We add an option `_export` for ports defined in containers to specify whether
to include them in the service and explicitly set this to false
for the respective ports in `infra/events`, `infra/tasks`, and `infra/watcher`.

For the purpose of this tutorial, here are some quick patches:

```text { title="TERMINAL" type="terminal" codeToCopy="Y2F0IDw8RU9GID4+aW5mcmEvZXZlbnRzL2t1YmUuY3VlCgpkZXBsb3ltZW50OiBldmVudHM6IHNwZWM6IHRlbXBsYXRlOiBzcGVjOiBjb250YWluZXJzOiBbeyBwb3J0czogW3tfZXhwb3J0OiBmYWxzZX0sIF9dIH1dCkVPRgpjYXQgPDxFT0YgPj5pbmZyYS90YXNrcy9rdWJlLmN1ZQoKZGVwbG95bWVudDogdGFza3M6IHNwZWM6IHRlbXBsYXRlOiBzcGVjOiBjb250YWluZXJzOiBbeyBwb3J0czogW3tfZXhwb3J0OiBmYWxzZX0sIF9dIH1dCkVPRgpjYXQgPDxFT0YgPj5pbmZyYS93YXRjaGVyL2t1YmUuY3VlCgpkZXBsb3ltZW50OiB3YXRjaGVyOiBzcGVjOiB0ZW1wbGF0ZTogc3BlYzogY29udGFpbmVyczogW3sgcG9ydHM6IFt7X2V4cG9ydDogZmFsc2V9LCBfXSB9XQpFT0Y=" }
$ cat <<EOF >>infra/events/kube.cue

deployment: events: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
$ cat <<EOF >>infra/tasks/kube.cue

deployment: tasks: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
$ cat <<EOF >>infra/watcher/kube.cue

deployment: watcher: spec: template: spec: containers: [{ ports: [{_export: false}, _] }]
EOF
```

In practice it would be more proper form to add this field in the original
port declaration.

We verify that all changes are acceptable and store another snapshot.
Then we run trim to further reduce our configuration:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0gLi8uLi4KZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ cue trim ./...
$ find . | grep kube.cue | xargs wc -l | tail -1
 1131 total
```

This is after removing the rewritten and now redundant deployment definition.

We shaved off almost another 100 lines, even after adding the template.
You can verify that the service definitions are now gone in most of the files.
What remains is either some additional configuration, or inconsistencies that
should probably be cleaned up.

But we have another trick up our sleeve.
With the `-s` or `--simplify` option we can tell `trim` or `fmt` to collapse
structs with a single element onto a single line. For instance:

```text { title="TERMINAL" type="terminal" codeToCopy="aGVhZCBmcm9udGVuZC9icmVhZGRpc3BhdGNoZXIva3ViZS5jdWU=" }
$ head frontend/breaddispatcher/kube.cue
package kube

deployment: breaddispatcher: {
	spec: {
		template: {
			metadata: {
				annotations: {
					"prometheus.io.scrape": "true"
					"prometheus.io.port":   "7080"
				}
```

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0gLi8uLi4gLXMKaGVhZCBmcm9udGVuZC9icmVhZGRpc3BhdGNoZXIva3ViZS5jdWU=" }
$ cue trim ./... -s
$ head frontend/breaddispatcher/kube.cue
package kube

deployment: breaddispatcher: spec: template: {
	metadata: annotations: {
		"prometheus.io.scrape": "true"
		"prometheus.io.port":   "7080"
	}
	spec: containers: [{
		image: "gcr.io/myproj/breaddispatcher:v0.3.24"
		ports: [{containerPort: 7080}]
```

```text { title="TERMINAL" type="terminal" codeToCopy="ZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ find . | grep kube.cue | xargs wc -l | tail -1
  979 total
```

Another 150 lines lost!
Collapsing lines like this can improve the readability of a configuration
by removing considerable amounts of punctuation.

We save the result as the new baseline:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpjcCBzbmFwc2hvdDIgc25hcHNob3Q=" }
$ cue eval -c ./... >snapshot2
$ cp snapshot2 snapshot
```


### Repeat for several subdirectories

In the previous section we defined templates for services and deployments
in the root of our directory structure to capture the common traits of all
services and deployments.
In addition, we defined a directory-specific label.
In this section we will look into generalizing the objects per directory.


#### Directory `frontend`

We observe that all deployments in subdirectories of `frontend`
have a single container with one port,
which is usually `7080`, but sometimes `8080`.
Also, most have two prometheus-related annotations, while some have one.
We leave the inconsistencies in ports, but add both annotations
unconditionally.

{{< code-tabs >}}
{{< code-tab name="tmp/services/frontend/kube2.cue" language="cue" area="top-left" >}}
package kube

deployment: [string]: spec: template: {
	metadata: annotations: {
		"prometheus.io.scrape": "true"
		"prometheus.io.port":   "\(spec.containers[0].ports[0].containerPort)"
	}
	spec: containers: [{
		ports: [{containerPort: *7080 | int}] // 7080 is the default
	}]
}
{{< /code-tab >}}{{< /code-tabs >}}

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpkaWZmIC13dSBzbmFwc2hvdCBzbmFwc2hvdDIgLS1sYWJlbCBzbmFwc2hvdCAtLWxhYmVsIHNuYXBzaG90MgpjcCBzbmFwc2hvdDIgc25hcHNob3Q=" }
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2 --label snapshot --label snapshot2
--- snapshot
+++ snapshot2
@@ -190,6 +190,7 @@
                 metadata: {
                     annotations: {
                         "prometheus.io.scrape": "true"
+                        "prometheus.io.port":   "7080"
                     }
                     labels: {
                         app:       "host"
...
$ cp snapshot2 snapshot
```

Two lines with annotations added, improving consistency.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0gLi9mcm9udGVuZC8uLi4gLXMKZmluZCAuIHwgZ3JlcCBrdWJlLmN1ZSB8IHhhcmdzIHdjIC1sIHwgdGFpbCAtMQ==" }
$ cue trim ./frontend/... -s
$ find . | grep kube.cue | xargs wc -l | tail -1
  937 total
```

Another 40 odd lines removed.
We may have gotten used to larger reductions, but at this point there is just
not much left to remove: in some of the frontend files there are only 4 lines
of configuration left.

We save the result as the new baseline:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGV2YWwgLWMgLi8uLi4gPnNuYXBzaG90MgpjcCBzbmFwc2hvdDIgc25hcHNob3Q=" }
$ cue eval -c ./... >snapshot2
$ cp snapshot2 snapshot
```


#### Directory `kitchen`

In this directory we observe that all deployments have without exception
one container with port `8080`, all have the same liveness probe,
a single line of prometheus annotation, and most have
two or three disks with similar patterns.

Let's add everything but the disks for now:

{{< code-tabs >}}
{{< code-tab name="tmp/services/kitchen/kube2.cue" language="cue" area="top-left" >}}
package kube

deployment: [string]: spec: template: {
	metadata: annotations: "prometheus.io.scrape": "true"
	spec: containers: [{
		ports: [{
			containerPort: 8080
		}]
		livenessProbe: {
			httpGet: {
				path: "/debug/health"
				port: 8080
			}
			initialDelaySeconds: 40
			periodSeconds:       3
		}
	}]
}
{{< /code-tab >}}{{< /code-tabs >}}

A diff reveals that one prometheus annotation was added to a service.
We assume this to be an accidental omission and accept the differences

Disks need to be defined in both the template spec section as well as in
the container where they are used.
We prefer to keep these two definitions together.
We take the volumes definition from `expiditer` (the first config in that
directory with two disks), and generalize it:

{{< code-tabs >}}
{{< code-tab name="tmp/services/kitchen/kube3.cue" language="cue" area="top-left" >}}
package kube

deployment: [ID=_]: spec: template: spec: {
	_hasDisks: *true | bool

	// field comprehension using just "if"
	if _hasDisks {
		volumes: [{
			name: *"\(ID)-disk" | string
			gcePersistentDisk: pdName: *"\(ID)-disk" | string
			gcePersistentDisk: fsType: "ext4"
		}, {
			name: *"secret-\(ID)" | string
			secret: secretName: *"\(ID)-secrets" | string
		}, ...]

		containers: [{
			volumeMounts: [{
				name:      *"\(ID)-disk" | string
				mountPath: *"/logs" | string
			}, {
				mountPath: *"/etc/certs" | string
				name:      *"secret-\(ID)" | string
				readOnly:  true
			}, ...]
		}]
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

{{< code-tabs >}}
{{< code-tab name="tmp/services/kitchen/souschef/kube2.cue" language="cue" area="top-left" >}}
package kube

deployment: souschef: spec: template: spec: {
	_hasDisks: false
}
{{< /code-tab >}}{{< /code-tabs >}}

This template definition is not ideal: the definitions are positional, so if
configurations were to define the disks in a different order, there would be
no reuse or even conflicts.
Also note that in order to deal with this restriction, almost all field values
are just default values and can be overridden by instances.
A better way would be define a map of volumes,
similarly to how we organized the top-level Kubernetes objects,
and then generate these two sections from this map.
This requires some design, though, and does not belong in a
"quick-and-dirty" tutorial.
Later in this document we introduce a manually optimized configuration.

We add the two disk by default and define a `_hasDisks` option to opt out.
The `souschef` configuration is the only one that defines no disks.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIHRyaW0gLXMgLi9raXRjaGVuLy4uLgpjdWUgZXZhbCAtYyAuLy4uLiA+c25hcHNob3QyCmRpZmYgLXd1IHNuYXBzaG90IHNuYXBzaG90MiAtLWxhYmVsIHNuYXBzaG90IC0tbGFiZWwgc25hcHNob3QyCmNwIHNuYXBzaG90MiBzbmFwc2hvdApmaW5kIC4gfCBncmVwIGt1YmUuY3VlIHwgeGFyZ3Mgd2MgLWwgfCB0YWlsIC0x" }
$ cue trim -s ./kitchen/...

# check differences
$ cue eval -c ./... >snapshot2
$ diff -wu snapshot snapshot2 --label snapshot --label snapshot2
...
$ cp snapshot2 snapshot
$ find . | grep kube.cue | xargs wc -l | tail -1
  774 total
```

The diff shows that we added the `_hasDisks` option, but otherwise reveals no
differences.
We also reduced the configuration by a sizeable amount once more.

However, on closer inspection of the remaining files we see a lot of remaining
fields in the disk specifications as a result of inconsistent naming.
Reducing configurations like we did in this exercise exposes inconsistencies.
The inconsistencies can be removed by simply deleting the overrides in the
specific configuration.
Leaving them as is gives a clear signal that a configuration is inconsistent.


### Conclusion of Quick 'n Dirty tutorial

There is still some gain to be made with the other directories.
At nearly a 1000-line, or 55%, reduction, we leave the rest as an exercise to
the reader.

We have shown how CUE can be used to reduce boilerplate, enforce consistencies,
and detect inconsistencies.
Being able to deal with consistencies and inconsistencies is a consequence of
the constraint-based model and harder to do with inheritance-based languages.

We have indirectly also shown how CUE is well-suited for machine manipulation.
This is a factor of syntax and the order independence that follows from its
semantics.
The `trim` command is one of many possible automated refactor tools made
possible by this property.
Also this would be harder to do with inheritance-based configuration languages.


## Define commands

The `cue export` command can be used to convert the created configuration back
to JSON.
In our case, this requires a top-level "emit value"
to convert our mapped Kubernetes objects back to a list.
Typically, this output is piped to tools like `kubectl` or `etcdctl`.

In practice this means typing the same commands ad nauseam.
The next step is often to write wrapper tools.
But as there is often no one-size-fits-all solution, this lead to the
proliferation of marginally useful tools.
The `cue` tool provides an alternative by allowing the declaration of
frequently used commands in CUE itself.
Advantages:

- added domain knowledge that CUE may use for improved analysis,
- only one language to learn,
- easy discovery of commands,
- no further configuration required,
- enforce uniform CLI standards across commands,
- standardized commands across an organization.

Commands are defined in files ending with `_tool.cue` in the same package as
where the configuration files are defined on which the commands should operate.
Top-level values in the configuration are visible by the tool files
as long as they are not shadowed by top-level fields in the tool files.
Top-level fields in the tool files are not visible in the configuration files
and are not part of any model.

The tool definitions also have access to additional builtin packages.
A CUE configuration is fully hermetic, disallowing any outside influence.
This property enables automated analysis and manipulation
such as the `trim` command.
The tool definitions, however, have access to such things as command line flags
and environment variables, random generators, file listings, and so on.

We define the following tools for our example:

- ls: list the Kubernetes objects defined in our configuration
- dump: dump all selected objects as a YAML stream
- create: send all selected objects to `kubectl` for creation

### Preparations

To work with Kubernetes we need to convert our map of Kubernetes objects
back to a simple list.
We create the tool file to do just that.

{{< code-tabs >}}
{{< code-tab name="tmp/services/kube_tool.cue" language="cue" area="top-left" >}}
package kube

objects: [for v in objectSets for x in v {x}]

objectSets: [
	service,
	deployment,
	statefulSet,
	daemonSet,
	configMap,
]
{{< /code-tab >}}{{< /code-tabs >}}

### Listing objects

Commands are defined in the `command` section at the top-level of a tool file.
A `cue` command defines command line flags, environment variables, as well as
a set of tasks.
Examples tasks are load or write a file, dump something to the console,
download a web page, or execute a command.

We start by defining the `ls` command which dumps all our objects

{{< code-tabs >}}
{{< code-tab name="tmp/services/ls_tool.cue" language="cue" area="top-left" >}}
package kube

import (
	"text/tabwriter"
	"tool/cli"
	"tool/file"
)

command: ls: {
	task: print: cli.Print & {
		text: tabwriter.Write([
			for x in objects {
				"\(x.kind)  \t\(x.metadata.labels.component)  \t\(x.metadata.name)"
			},
		])
	}

	task: write: file.Create & {
		filename: "foo.txt"
		contents: task.print.text
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

<!-- TODO: use "let" once implemented-->

NOTE: THE API OF THE TASK DEFINITIONS WILL CHANGE.
Although we may keep supporting this form if needed.

The command is now available in the `cue` tool:

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCBscyAuL2Zyb250ZW5kL21haXRyZWQ=" }
$ cue cmd ls ./frontend/maitred
Service      frontend   maitred
Deployment   frontend   maitred

```

If more than one instance is selected the `cue` tool may either operate
on them one by one or merge them.
The default is to merge them.
Different instances of a package are typically not compatible:
different subdirectories may have different specializations.
A merge pre-expands templates of each instance and then merges their root
values.
The result may contain conflicts, such as our top-level `#Component` field,
but our per-type maps of Kubernetes objects should be free of conflict
(if there is, we have a problem with Kubernetes down the line).
A merge thus gives us a unified view of all objects.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCBscyAuLy4uLg==" }
$ cue cmd ls ./...
Service       frontend   bartender
Service       frontend   breaddispatcher
Service       frontend   host
Service       frontend   maitred
Service       frontend   valeter
Service       frontend   waiter
Service       frontend   waterdispatcher
Service       infra      download
Service       infra      etcd
Service       infra      events
...
```

### Dumping a YAML Stream

The following adds a command to dump the selected objects as a YAML stream.

<!--
TODO: add command line flags to filter object types.
-->

{{< code-tabs >}}
{{< code-tab name="tmp/services/dump_tool.cue" language="cue" area="top-left" >}}
package kube

import (
	"encoding/yaml"
	"tool/cli"
)

command: dump: {
	task: print: cli.Print & {
		text: yaml.MarshalStream(objects)
	}
}
{{< /code-tab >}}{{< /code-tabs >}}

<!--
TODO: with new API as well as conversions implemented
command dump task print: cli.Print(text: yaml.MarshalStream(objects))

or without conversions:
command dump task print: cli.Print & {text: yaml.MarshalStream(objects)}
-->

The `MarshalStream` command converts the list of objects to a '`---`'-separated
stream of YAML values.


### Creating Objects

The `create` command sends a list of objects to `kubectl create`.

{{< code-tabs >}}
{{< code-tab name="tmp/services/create_tool.cue" language="cue" area="top-left" >}}
package kube

import (
	"encoding/yaml"
	"tool/exec"
	"tool/cli"
)

command: create: {
	task: kube: exec.Run & {
		cmd:    "kubectl create --dry-run=client -f -"
		stdin:  yaml.MarshalStream(objects)
		stdout: string
	}

	task: display: cli.Print & {
		text: task.kube.stdout
	}
}
{{< /code-tab >}}{{< /code-tabs >}}
This command has two tasks, named `kube` and `display`.
The `display` task depends on the output of the `kube` task.
The `cue` tool does a static analysis of the dependencies and runs all
tasks which dependencies are satisfied in parallel while blocking tasks
for which an input is missing.

```text { title="TERMINAL" type="terminal" codeToCopy="Y3VlIGNtZCBjcmVhdGUgLi9mcm9udGVuZC8uLi4=" }
$ cue cmd create ./frontend/...
apiVersion: v1
kind: Service
metadata:
  name: bartender
  labels:
    app: bartender
    domain: prod
    component: frontend
spec:
  ports:
...
```

A production real-life version of this could should omit the `--dry-run=client` flag
of course.

### Extract CUE templates directly from Kubernetes Go source

In order for `cue get go` to generate the CUE templates from Go sources, you first need to have the sources locally:

```
$ go get k8s.io/api/apps/v1@v0.23.4
$ cue get go k8s.io/api/apps/v1

```

Now that we have the Kubernetes definitions in our module, we can import and use them:

```
$ cat <<EOF > k8s_defs.cue
package kube

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]:     v1.#Service
deployment: [string]:  apps_v1.#Deployment
daemonSet: [string]:   apps_v1.#DaemonSet
statefulSet: [string]: apps_v1.#StatefulSet
EOF
```

And, finally, we'll format again:

```
cue fmt
```

## Manually tailored configuration

In Section "Quick 'n Dirty" we showed how to quickly get going with CUE.
With a bit more deliberation, one can reduce configurations even further.
Also, we would like to define a configuration that is more generic and less tied
to Kubernetes.

We will rely heavily on CUEs order independence, which makes it easy to
combine two configurations of the same object in a well-defined way.
This makes it easy, for instance, to put frequently used fields in one file
and more esoteric one in another and then combine them without fear that one
will override the other.
We will take this approach in this section.

The end result of this tutorial is in the `manual` directory.
In the next sections we will show how to get there.


### Outline

The basic premise of our configuration is to maintain two configurations,
a simple and abstract one, and one compatible with Kubernetes.
The Kubernetes version is automatically generated from the simple configuration.
Each simplified object has a `kubernetes` section that get gets merged into
the Kubernetes object upon conversion.

We define one top-level file with our generic definitions.

```
// file cloud.cue
package cloud

service: [Name=_]: {
    name: *Name | string // the name of the service

    ...

    // Kubernetes-specific options that get mixed in when converting
    // to Kubernetes.
    kubernetes: {
    }
}

deployment: [Name=_]: {
    name: *Name | string
   ...
}
```

A Kubernetes-specific file then contains the definitions to
convert the generic objects to Kubernetes.

Overall, the code modeling our services and the code generating the kubernetes
code is separated, while still allowing to inject Kubernetes-specific
data into our general model.
At the same time, we can add additional information to our model without
it ending up in the Kubernetes definitions causing it to barf.


### Deployment Definition

For our design we assume that all Kubernetes Pod derivatives only define one
container.
This is clearly not the case in general, but often it does and it is good
practice.
Conveniently, it simplifies our model as well.

We base the model loosely on the master templates we derived in
Section "Quick 'n Dirty".
The first step we took is to eliminate `statefulSet` and `daemonSet` and
rather just have a `deployment` allowing different kinds.

```
deployment: [Name=_]: _base & {
    name:     *Name | string
    ...
```

The kind only needs to be specified if the deployment is a stateful set or
daemonset.
This also eliminates the need for `_spec`.

The next step is to pull common fields, such as `image` to the top level.

Arguments can be specified as a map.
```
    arg: [string]: string
    args: [for k, v in arg { "-\(k)=\(v)" }] | [...string]
```

If order matters, users could explicitly specify the list as well.

For ports we define two simple maps from name to port number:

```
    // expose port defines named ports that is exposed in the service
    expose: port: [string]: int

    // port defines a named port that is not exposed in the service.
    port: [string]: int
```
Both maps get defined in the container definition, but only `port` gets
included in the service definition.
This may not be the best model, and does not support all features,
but it shows how one can chose a different representation.

A similar story holds for environment variables.
In most cases mapping strings to string suffices.
The testdata uses other options though.
We define a simple `env` map and an `envSpec` for more elaborate cases:

```
    env: [string]: string

    envSpec: [string]: {}
    envSpec: {
        for k, v in env {
            "\(k)" value: v
        }
    }
```
The simple map automatically gets mapped into the more elaborate map
which then presents the full picture.

Finally, our assumption that there is one container per deployment allows us
to create a single definition for volumes, combining the information for
volume spec and volume mount.

```
    volume: [Name=_]: {
        name:       *Name | string
        mountPath:  string
        subPath:    null | string
        readOnly:   bool
        kubernetes: {}
    }
```

All other fields that we way want to define can go into a generic kubernetes
struct that gets merged in with all other generated kubernetes data.
This even allows us to augment generated data, such as adding additional
fields to the container.


### Service Definition

The service definition is straightforward.
As we eliminated stateful and daemon sets, the field comprehension to
automatically derive a service is now a bit simpler:

```
// define services implied by deployments
service: {
    for k, spec in deployment {
        "\(k)": {
            // Copy over all ports exposed from containers.
            for Name, Port in spec.expose.port {
                port: "\(Name)": {
                    port:       *Port | int
                    targetPort: *Port | int
                }
            }

            // Copy over the labels
            label: spec.label
        }
    }
}
```

The complete top-level model definitions can be found at
[doc/tutorial/kubernetes/manual/services/cloud.cue](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/refs/heads/master/doc/tutorial/kubernetes/manual/services/cloud.cue).

The tailorings for this specific project (the labels) are defined
[here](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/refs/heads/master/doc/tutorial/kubernetes/manual/services/kube.cue).


### Converting to Kubernetes

Converting services is fairly straightforward.

```
kubernetes: services: {
    for k, x in service {
        "\(k)": x.kubernetes & {
            apiVersion: "v1"
            kind:       "Service"

            metadata: name:   x.name
            metadata: labels: x.label
            spec: selector:   x.label

            spec: ports: [for p in x.port { p }]
        }
    }
}
```

We add the Kubernetes boilerplate, map the top-level fields and mix in
the raw `kubernetes` fields for each service.

Mapping deployments is a bit more involved, though analogous.
The complete definitions for Kubernetes conversions can be found at
[doc/tutorial/kubernetes/manual/services/k8s.cue](https://review.gerrithub.io/plugins/gitiles/cue-lang/cue/+/refs/heads/master/doc/tutorial/kubernetes/manual/services/k8s.cue).

Converting the top-level definitions to concrete Kubernetes code is the hardest
part of this exercise.
That said, most CUE users will never have to resort to this level of CUE
to write configurations.
For instance, none of the files in the subdirectories contain comprehensions,
not even the template files in these directories (such as `kitchen/kube.cue`).
Furthermore, none of the configuration files in any of the
leaf directories contain string interpolations.


### Metrics

The fully written out manual configuration can be found in the `manual`
subdirectory.
Running our usual count yields
```
$ find . | grep kube.cue | xargs wc | tail -1
     542    1190   11520 total
```
This does not count our conversion templates.
Assuming that the top-level templates are reusable, and if we don't count them
for both approaches, the manual approach shaves off about another 150 lines.
If we count the templates as well, the two approaches are roughly equal.


### Conclusions Manual Configuration

We have shown that we can further compact a configuration by manually
optimizing template files.
However, we have also shown that the manual optimization only gives
a marginal benefit with respect to the quick-and-dirty semi-automatic reduction.
The benefits for the manual definition largely lies in the organizational
flexibility one gets.

Manually tailoring your configurations allows creating an abstraction layer
between logical definitions and Kubernetes-specific definitions.
At the same time, CUE's order independence
makes it easy to mix in low-level Kubernetes configuration wherever it is
convenient and applicable.

Manual tailoring also allows us to add our own definitions without breaking
Kubernetes.
This is crucial in defining information relevant to definitions,
but unrelated to Kubernetes, where they belong.

Separating abstract from concrete configuration also allows us to create
difference adaptors for the same configuration.


<!-- TODO:
## Conversion to `docker-compose`
-->
