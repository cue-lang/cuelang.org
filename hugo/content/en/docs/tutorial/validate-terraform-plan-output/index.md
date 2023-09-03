---
title: Validating Terraform plan output
---

## Setup / prereqs

For both scenarios in this tutorial:
- install Terraform
- get some AWS creds
- same as <https://www.openpolicyagent.org/docs/latest/terraform/#prerequisites>, s/OPA/CUE/

## Scenario 1: A plan that doesn't use Terraform modules

### Steps

&gg;
Create a Terraform input file.:
(text mirrors https://www.openpolicyagent.org/docs/latest/terraform/#1-create-and-save-a-terraform-plan)

```hcl {title="main.tf"}
provider "aws" {
    region = "us-west-1"
}
resource "aws_instance" "web" {
  instance_type = "t2.micro"
  ami = "ami-09b4b74c"
}
resource "aws_autoscaling_group" "my_asg" {
  availability_zones        = ["us-west-1a"]
  name                      = "my_asg"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 4
  force_delete              = true
  launch_configuration      = "my_web_config"
}
resource "aws_launch_configuration" "my_web_config" {
    name = "my_web_config"
    image_id = "ami-09b4b74c"
    instance_type = "t2.micro"
}
```

&gg;
Save a Terraform plan:

```console {title="TERMINAL"}
$ terraform init
[...]
$ terraform plan --out tfplan.binary
[...]
```

&gg;
Convert the Terraform plan into its JSON form, using `cue export` to format the
plan into a readable form: (text mirrors
https://www.openpolicyagent.org/docs/latest/terraform/#2-convert-the-terraform-plan-into-json)

```console {title="TERMINAL"}
$ terraform show -json tfplan.binary \
  | cue export - -o tfplan.json
```

Check that the JSON form looks similar to the following:

```json {title="tfplan.json"}
{
  "format_version": "0.1",
  "terraform_version": "0.12.6",
  "planned_values": {
    "root_module": {
      "resources": [
        {
          "address": "aws_autoscaling_group.my_asg",
          "mode": "managed",
          "type": "aws_autoscaling_group",
          "name": "my_asg",
          "provider_name": "aws",
          "schema_version": 0,
          "values": {
            "availability_zones": [
              "us-west-1a"
            ],
            "desired_capacity": 4,
            "enabled_metrics": null,
            "force_delete": true,
            "health_check_grace_period": 300,
            "health_check_type": "ELB",
            "initial_lifecycle_hook": [],
            "launch_configuration": "my_web_config",
            "launch_template": [],
            "max_size": 5,
            "metrics_granularity": "1Minute",
            "min_elb_capacity": null,
            "min_size": 1,
            "mixed_instances_policy": [],
            "name": "my_asg",
            "name_prefix": null,
            "placement_group": null,
            "protect_from_scale_in": false,
            "suspended_processes": null,
            "tag": [],
            "tags": null,
            "termination_policies": null,
            "timeouts": null,
            "wait_for_capacity_timeout": "10m",
            "wait_for_elb_capacity": null
          }
        },
        {
          "address": "aws_instance.web",
          "mode": "managed",
          "type": "aws_instance",
          "name": "web",
          "provider_name": "aws",
          "schema_version": 1,
          "values": {
            "ami": "ami-09b4b74c",
            "credit_specification": [],
            "disable_api_termination": null,
            "ebs_optimized": null,
            "get_password_data": false,
            "iam_instance_profile": null,
            "instance_initiated_shutdown_behavior": null,
            "instance_type": "t2.micro",
            "monitoring": null,
            "source_dest_check": true,
            "tags": null,
            "timeouts": null,
            "user_data": null,
            "user_data_base64": null
          }
        },
        {
          "address": "aws_launch_configuration.my_web_config",
          "mode": "managed",
          "type": "aws_launch_configuration",
          "name": "my_web_config",
          "provider_name": "aws",
          "schema_version": 0,
          "values": {
            "associate_public_ip_address": false,
            "enable_monitoring": true,
            "ephemeral_block_device": [],
            "iam_instance_profile": null,
            "image_id": "ami-09b4b74c",
            "instance_type": "t2.micro",
            "name": "my_web_config",
            "name_prefix": null,
            "placement_tenancy": null,
            "security_groups": null,
            "spot_price": null,
            "user_data": null,
            "user_data_base64": null,
            "vpc_classic_link_id": null,
            "vpc_classic_link_security_groups": null
          }
        }
      ]
    }
  },
  "resource_changes": [
    {
      "address": "aws_autoscaling_group.my_asg",
      "mode": "managed",
      "type": "aws_autoscaling_group",
      "name": "my_asg",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "availability_zones": [
            "us-west-1a"
          ],
          "desired_capacity": 4,
          "enabled_metrics": null,
          "force_delete": true,
          "health_check_grace_period": 300,
          "health_check_type": "ELB",
          "initial_lifecycle_hook": [],
          "launch_configuration": "my_web_config",
          "launch_template": [],
          "max_size": 5,
          "metrics_granularity": "1Minute",
          "min_elb_capacity": null,
          "min_size": 1,
          "mixed_instances_policy": [],
          "name": "my_asg",
          "name_prefix": null,
          "placement_group": null,
          "protect_from_scale_in": false,
          "suspended_processes": null,
          "tag": [],
          "tags": null,
          "termination_policies": null,
          "timeouts": null,
          "wait_for_capacity_timeout": "10m",
          "wait_for_elb_capacity": null
        },
        "after_unknown": {
          "arn": true,
          "availability_zones": [
            false
          ],
          "default_cooldown": true,
          "id": true,
          "initial_lifecycle_hook": [],
          "launch_template": [],
          "load_balancers": true,
          "mixed_instances_policy": [],
          "service_linked_role_arn": true,
          "tag": [],
          "target_group_arns": true,
          "vpc_zone_identifier": true
        }
      }
    },
    {
      "address": "aws_instance.web",
      "mode": "managed",
      "type": "aws_instance",
      "name": "web",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "ami": "ami-09b4b74c",
          "credit_specification": [],
          "disable_api_termination": null,
          "ebs_optimized": null,
          "get_password_data": false,
          "iam_instance_profile": null,
          "instance_initiated_shutdown_behavior": null,
          "instance_type": "t2.micro",
          "monitoring": null,
          "source_dest_check": true,
          "tags": null,
          "timeouts": null,
          "user_data": null,
          "user_data_base64": null
        },
        "after_unknown": {
          "arn": true,
          "associate_public_ip_address": true,
          "availability_zone": true,
          "cpu_core_count": true,
          "cpu_threads_per_core": true,
          "credit_specification": [],
          "ebs_block_device": true,
          "ephemeral_block_device": true,
          "host_id": true,
          "id": true,
          "instance_state": true,
          "ipv6_address_count": true,
          "ipv6_addresses": true,
          "key_name": true,
          "network_interface": true,
          "network_interface_id": true,
          "password_data": true,
          "placement_group": true,
          "primary_network_interface_id": true,
          "private_dns": true,
          "private_ip": true,
          "public_dns": true,
          "public_ip": true,
          "root_block_device": true,
          "security_groups": true,
          "subnet_id": true,
          "tenancy": true,
          "volume_tags": true,
          "vpc_security_group_ids": true
        }
      }
    },
    {
      "address": "aws_launch_configuration.my_web_config",
      "mode": "managed",
      "type": "aws_launch_configuration",
      "name": "my_web_config",
      "provider_name": "aws",
      "change": {
        "actions": [
          "create"
        ],
        "before": null,
        "after": {
          "associate_public_ip_address": false,
          "enable_monitoring": true,
          "ephemeral_block_device": [],
          "iam_instance_profile": null,
          "image_id": "ami-09b4b74c",
          "instance_type": "t2.micro",
          "name": "my_web_config",
          "name_prefix": null,
          "placement_tenancy": null,
          "security_groups": null,
          "spot_price": null,
          "user_data": null,
          "user_data_base64": null,
          "vpc_classic_link_id": null,
          "vpc_classic_link_security_groups": null
        },
        "after_unknown": {
          "ebs_block_device": true,
          "ebs_optimized": true,
          "ephemeral_block_device": [],
          "id": true,
          "key_name": true,
          "root_block_device": true
        }
      }
    }
  ],
  "configuration": {
    "provider_config": {
      "aws": {
        "name": "aws",
        "expressions": {
          "region": {
            "constant_value": "us-west-1"
          }
        }
      }
    },
    "root_module": {
      "resources": [
        {
          "address": "aws_autoscaling_group.my_asg",
          "mode": "managed",
          "type": "aws_autoscaling_group",
          "name": "my_asg",
          "provider_config_key": "aws",
          "expressions": {
            "availability_zones": {
              "constant_value": [
                "us-west-1a"
              ]
            },
            "desired_capacity": {
              "constant_value": 4
            },
            "force_delete": {
              "constant_value": true
            },
            "health_check_grace_period": {
              "constant_value": 300
            },
            "health_check_type": {
              "constant_value": "ELB"
            },
            "launch_configuration": {
              "constant_value": "my_web_config"
            },
            "max_size": {
              "constant_value": 5
            },
            "min_size": {
              "constant_value": 1
            },
            "name": {
              "constant_value": "my_asg"
            }
          },
          "schema_version": 0
        },
        {
          "address": "aws_instance.web",
          "mode": "managed",
          "type": "aws_instance",
          "name": "web",
          "provider_config_key": "aws",
          "expressions": {
            "ami": {
              "constant_value": "ami-09b4b74c"
            },
            "instance_type": {
              "constant_value": "t2.micro"
            }
          },
          "schema_version": 1
        },
        {
          "address": "aws_launch_configuration.my_web_config",
          "mode": "managed",
          "type": "aws_launch_configuration",
          "name": "my_web_config",
          "provider_config_key": "aws",
          "expressions": {
            "image_id": {
              "constant_value": "ami-09b4b74c"
            },
            "instance_type": {
              "constant_value": "t2.micro"
            },
            "name": {
              "constant_value": "my_web_config"
            }
          },
          "schema_version": 0
        }
      ]
    }
  }
}
```

&gg;
Create a CUE policy file (same goals/caveats/explanations/etc as
https://www.openpolicyagent.org/docs/latest/terraform/#3-write-the-opa-policy-to-check-the-plan)

```CUE {title="policy.cue"}
package policy

import "list"

// the teraform plan's json form,
// placed here via the `-l tfplan:` parameter
tfplan: _

// acceptable score for automated authorization,
// controllable via `-t blast_radius=`
blast_radius: {*30 | int} @tag(blast_radius,type=int)

// weights assigned for each operation on each resource-type
weights: aws_autoscaling_group: {
	"delete": 100
	"create": 10
	"modify": 1
}
weights: aws_instance: {
	"delete": 10
	"create": 1
	"modify": 1
}

// Consider only these resource types in score calculations
resource_types: [
	"aws_autoscaling_group",
	"aws_instance",
	"aws_iam",
	"aws_launch_configuration",
]

// authz: the final result of checking a plan against all policies
authz: bool
authz: ({for check, result in checks {result}} & true) != _|_

// checks: the boolean results of each individual policy
checks: [_]: bool
checks: {
	score_ok: score < blast_radius
	iam_ok:   no_iam_changes != _|_
}

// no_iam_changes attempts to unify the set of planned resource_changes with a
// policy that rejects all non-no-op aws_iam changes
no_iam_changes: tfplan.resource_changes
no_iam_changes: [...exclude_aws_iam]
exclude_aws_iam: {
	type: !="aws_iam"
} | {
	change: actions: ["no-op"]
}

// score embeds an integer representing the sum of all resource_changes in the
// plan, weighted by resource type and change type
score: {
	int & list.Sum(_by_resource)
	_by_resource: [
		for resource in tfplan.resource_changes
		if list.Contains(resource_types, resource.type)
		for action in resource.change.actions
		let resource_score = *weights[resource.type][action] | 0 {
			{resource_score}
		},
	]
}
```

&gg;
Evaluate the Terraform plan against the CUE policy: (mirrors
https://www.openpolicyagent.org/docs/latest/terraform/#4-evaluate-the-opa-policy-on-the-terraform-plan)

```console {title="TERMINAL"}
$ # evaluate policy with default blast_radius setting
$ cue eval .:policy -l tfplan: tfplan.json -e authz
true

$ # evaluate policy, with process exit code >0 on failure
$ cue eval .:policy -l tfplan: tfplan.json  -e 'authz & true'
$ echo $?
0

$ # evaluate policy against a more conservative blast_radius setting
$ cue eval .:policy -l tfplan: tfplan.json -e authz -t blast_radius=10
false

$ # evaluate policy against blast_radius=10, with process exit code >0 on failure
$ cue eval .:policy -l tfplan: tfplan.json -e 'authz & true' -t blast_radius=10
conflicting values true and false:
    --expression:1:1
    --expression:1:9
    ./policy.cue:35:8
$ echo $?
1

$ # show which checks caused the lower blast_radius setting's policy failure
$ cue eval .:policy -l tfplan: tfplan.json -e '{check: checks}' -t blast_radius=10
check: {
    score_ok: false
    iam_ok:   true
}
```

### Scenario summary

&gg;
Wrapup:
- congrats
- reminder of what they checked for
- warning that this is just one way to do this
- pointer to the TF docs on the JSON form

## Scenario 2: A plan that uses a Terraform module

Plans that come from configurations that use Terraform modules have a more
complex structure. It requires a bit more work to assert policies against their
contents.

(Input taken from (and policies are a mirror of)
https://www.openpolicyagent.org/docs/latest/terraform/#working-with-modules)

### Steps

&gg;
*Replace* the `main.tf` file you used above with the following configuration
that includes a security group and security group from a module. (This example
uses the module from
https://github.com/terraform-aws-modules/terraform-aws-security-group)

```hcl {title="main.tf"}
provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}

module "http_sg" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-security-group.git?ref=v3.10.0"

  name        = "http-sg"
  description = "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open"
  vpc_id      = data.aws_vpc.default.id

  ingress_cidr_blocks = ["0.0.0.0/0"]
}


resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}
```

&gg;
Save a Terraform plan:

```console {title="TERMINAL"}
$ terraform init
[...]
$ terraform plan --out tfplan.binary
[...]
```

&gg;
Convert the Terraform plan into its JSON form, using `cue export` to format the
plan into a readable form:
(text mirrors https://www.openpolicyagent.org/docs/latest/terraform/#2-convert-the-terraform-plan-into-json)

```console {title="TERMINAL"}
$ terraform show -json tfplan.binary \
  | cue export - -o tfplan.json
```

Check that the JSON file looks similar to the following **truncated** example:

```json {title="tfplan.json"}
{
    "format_version": "1.1",
    "terraform_version": "1.4.6",
    "planned_values": {
        "root_module": {
            "resources": [
                {
                    "address": "aws_security_group.allow_tls",
                    "mode": "managed",
                    "type": "aws_security_group",
                    "name": "allow_tls",
                    "provider_name": "registry.terraform.io/hashicorp/aws",
                    "schema_version": 1,
                    "values": {
                        "description": "Allow TLS inbound traffic",
                        "egress": [
                            {
                                "cidr_blocks": [
                                    "0.0.0.0/0"
                                ],
                                "description": "",
                                "from_port": 0,
                                "ipv6_cidr_blocks": [],
                                "prefix_list_ids": [],
                                "protocol": "-1",
                                "security_groups": [],
                                "self": false,
                                "to_port": 0
                            }
                        ],
                        "ingress": [
                            {
                                "cidr_blocks": [
                                    "10.0.0.0/8"
                                ],
                                "description": "TLS from VPC",
                                "from_port": 443,
                                "ipv6_cidr_blocks": [],
                                "prefix_list_ids": [],
                                "protocol": "tcp",
                                "security_groups": [],
                                "self": false,
                                "to_port": 443
                            }
                        ],
                        "name": "allow_tls",
                        "revoke_rules_on_delete": false,
                        "tags": {
                            "Name": "allow_tls"
                        },
                        "tags_all": {
                            "Name": "allow_tls"
                        },
                        "timeouts": null,
                        "vpc_id": "vpc-0148ae1236544e5d0"
                    },
                    "sensitive_values": {
                        "egress": [
                            {
                                "cidr_blocks": [
                                    false
                                ],
                                "ipv6_cidr_blocks": [],
                                "prefix_list_ids": [],
                                "security_groups": []
                            }
                        ],
                        "ingress": [
                            {
                                "cidr_blocks": [
                                    false
                                ],
                                "ipv6_cidr_blocks": [],
                                "prefix_list_ids": [],
                                "security_groups": []
                            }
                        ],
                        "tags": {},
                        "tags_all": {}
                    }
                }
            ],
            "child_modules": [
                {
                    "resources": [
                        {
                            "address": "module.http_sg.aws_security_group.this_name_prefix[0]",
                            "mode": "managed",
                            "type": "aws_security_group",
                            "name": "this_name_prefix",
                            "index": 0,
                            "provider_name": "registry.terraform.io/hashicorp/aws",
                            "schema_version": 1,
                            "values": {
                                "description": "Security group with HTTP ports open for everybody (IPv4 CIDR), egress ports are all world open",
                                "name_prefix": "http-sg-",
                                "revoke_rules_on_delete": false,
                                "tags": {
                                    "Name": "http-sg"
                                },
                                "tags_all": {
                                    "Name": "http-sg"
                                },
                                "timeouts": {
                                    "create": "10m",
                                    "delete": "15m"
                                },
                                "vpc_id": "vpc-0148ae1236544e5d0"
                            },
                            "sensitive_values": {
                                "egress": [],
                                "ingress": [],
                                "tags": {},
                                "tags_all": {},
                                "timeouts": {}
                            }
                        }
                    ],
                    "address": "module.http_sg"
                }
            ]
        }
    }
}
```

&gg;
Create a CUE policy file that FIXME: explain this /terrible/ example from the
original tutorial:

```CUE {title="policy.cue"}
package policy

import "strings"

// the teraform plan's json form,
// placed here via the `-l tfplan:` parameter
tfplan: _

// authz: the final result of checking a plan against all policies
authz: bool
authz: ({for check, result in checks {result}} & true) != _|_

// checks: the boolean results of each individual policy
checks: [_]: bool
checks: {
	// disallow_http_security_groups asserts that the
	// http_security_groups field is an empty list
	disallow_http_security_groups: (http_security_groups & []) != _|_
}

// http_security_groups is a list of all security groups that contain the word
// "HTTP" in their description.
http_security_groups: [...string]
http_security_groups: [
	for name, config in _flatten_root_module
	if strings.Contains(config.values.description, "HTTP") {
		name
	},
]

// Does this pair of functions need commenting?
// Whilst less policy-specific, they don't need to be *understood* to be used.
// They'll probably end up in a utility package, out of sight.
_flatten_root_module: {
	for r in tfplan.planned_values.root_module.resources {
		(r.address): r
	}
	if tfplan.planned_values.root_module.child_modules != _|_
	for m in tfplan.planned_values.root_module.child_modules {
		_flatten_child_module & {#m: m}
	}
}
_flatten_child_module: {
	#m: {resources!: [...{...}], child_modules?: [...], ...}
	for r in #m.resources {
		(r.address): r
	}
	if #m.child_modules != _|_
	for m in #m.child_modules {
		_flatten_child_module & {#m: m}
	}
}
```

&gg;
Evaluate the Terraform plan against the CUE policy:

```console {title="TERMINAL"}
$ cue eval .:policy -l tfplan: tfplan.json -e authz
false

$ # evaluate policy, with process exit code >0 on failure
$ cue eval .:policy -l tfplan: tfplan.json  -e 'authz & true'
conflicting values true and false:
    --expression:1:1
    --expression:1:9
    ./policy.cue:11:8
$ echo $?
1

$ # show which checks caused the policy failure
$ cue eval .:policy -l tfplan: tfplan.json -e '{check: checks}'
check: {
    disallow_http_security_groups: false
}

$ # show which security groups cause the policy failure
$ cue eval .:policy -l tfplan: tfplan.json -e http_security_groups
["module.http_sg.aws_security_group.this_name_prefix[0]"]
```

### Scenario summary

&gg;
Wrapup:
- congrats
- reminder of what they checked for
- warning that this is just one way to do this
- pointer to the TF docs on the JSON form
