package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "/XwqJixLJ5b4v6T99+cesvxs+Dh+e9Lsz69IEGnbe80="
								"app-2.cue":  "QYgUhiEORD6zx9sof5WxxFReeQ3ZIfxQyQQ24SUNYu0="
								"app-3.cue":  "bu0KFvQf4ecnBauF+7+gsY1O6aTr3SfocN8s7EOOKso="
								"policy.cue": "VM7FwUUvfhbadiZ871KOCOL04pWgcE50PWC/fod0d+A="
							}
							code: {
								"order-irrelevance": "Sa/aYVH+jVYViJB4OP0Qp5ial5PXVglOQ0zWMdCdm8M="
								defaults:            "SSZY9YL9YYKSQC+NCuRAXc7dyNjp5QybQFPVHnzrqBQ="
								templates:           "1wGwoTwBtFDaABi/ivtbLffkI/xk1spwdilLWm7qx0g="
							}
							multi_step: {
								"OFJF4E0P1FJ1GDFJP4KKAE6I1J4S9GEIOKB7OU4F3MSCEJSEPBP0====": [{
									doc:      "# The original app-*.cue files:"
									cmd:      "tail -n99 app-*.cue"
									exitCode: 0
									output: """
											==> app-1.cue <==
											package config

											app: foo: {
											\tname:          "foo"
											\tport:          7777
											\tid:            "foo.example"
											\tsecurityLevel: "HIGH"
											}

											==> app-2.cue <==
											package config

											app: bar: {
											\tname:          "bar"
											\tport:          5555
											\tid:            "bar.example"
											\tsecurityLevel: "HIGH"
											}

											==> app-3.cue <==
											package config

											app: baz: {
											\tname:          "baz"
											\tport:          7777
											\tid:            "baz.example"
											\tsecurityLevel: "HIGH"
											}

											"""
								}, {
									doc:      "# # # # # # # CUE TRIM # # # # # # # #"
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      "# The modified app-*.cue files:"
									cmd:      "tail -n99 app-*.cue"
									exitCode: 0
									output: """
											==> app-1.cue <==
											package config

											app: foo: {
											}

											==> app-2.cue <==
											package config

											app: bar: {
											\tport: 5555
											}

											==> app-3.cue <==
											package config

											app: baz: {
											}

											"""
								}, {
									doc:      "# Verify that exporting the new files gives the right result:"
									cmd:      "cue export -e output --out yaml"
									exitCode: 0
									output: """
											deployments:
											  foo:
											    name: foo
											    port: 7777
											    id: foo.example
											    securityLevel: HIGH
											  bar:
											    name: bar
											    port: 5555
											    id: bar.example
											    securityLevel: HIGH
											  baz:
											    name: baz
											    port: 7777
											    id: baz.example
											    securityLevel: HIGH

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
