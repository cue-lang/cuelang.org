package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "YvNHgXpRRJkqF0tPwmgZihovlWmX73Jo6hpHbSBhHmA="
								"app-2.cue":  "hj3JMOvz3T8iKu1qjNym3aX7Kc6rxFQYMztLNlGVhJw="
								"app-3.cue":  "3a7YsJcb1inT3lTtIwUCyNCTfpmNAqkF+9VJXyUQMqE="
								"policy.cue": "aRQsnACioqaluFS1hegADsD6f38JtISgR81rAre4VP4="
							}
							code: {
								"order-irrelevance": "NMyQZx90yG8y0YZngc68eWtL2GD37FMowZdYsmJBMyc="
								defaults:            "l0i352kzQvEZ8YMtIfM/ErFm5uPFl+q481fHb03QjiQ="
								templates:           "lGQ6RAidNU+GOpqLh9ydIhVfuYxDB8pE/zTulXgAbUk="
							}
							multi_step: {
								"875BV9Q64MVHB6U06CNQ66ULL91K75KT2LEI2QAGSLQFUDQ5EMLG====": [{
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
