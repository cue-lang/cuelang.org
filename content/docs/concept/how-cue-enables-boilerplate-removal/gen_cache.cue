package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "ZaiSYRh+0dK745tGZC1O1toR1FVahJQrHWNX889YBOk="
								"app-2.cue":  "9t+x/84EgJr2DchYFdweJRiDrr55X4MZDvrT1g8uio4="
								"app-3.cue":  "uIzJUZe+DQvWxcN3nVM2d9p+XvGg+kdRSqFvNxVJIkM="
								"policy.cue": "b4NDn+J5fmId1ffU6tyWcy/T+cVkOgo1WcckgB3QwCs="
							}
							code: {
								"order-irrelevance": "XYhUqtSlDG8lLo+8tHeV8vYufHHMSG3DMEh3zpQS0SA="
								defaults:            "6Om28W75IR3MVlKb6nNxGBx8ajICmpF96AoNOm6IvgA="
								templates:           "2HtUnrTmffcd747urjDwG/oDYxtBH85KSouceNNYxns="
							}
							multi_step: {
								"IQ0390KU081JJ535KI97IJ1P1SBMOLNTPKO8EP07B4UC9OGPN8QG====": [{
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
