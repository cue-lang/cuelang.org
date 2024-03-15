package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "909wkvuYQ6Wpi8UovM1AyrMl5PAakDAcsVQhbpj8NiY="
								"app-2.cue":  "9nwAnNKeAEcgivdDFNDdPUB9W4tcMAOWlxKlRonyLzQ="
								"app-3.cue":  "pGNwdD5ziswAZxhzAhhsSCf0Kv91COmvn0k5XQtvarE="
								"policy.cue": "1AFORKreZnn9dBCW1M+RslPUu3HC14rc5sFa6AzKCU0="
							}
							code: {
								"order-irrelevance": "T8JPai+nDYN1CsZQxeQRZs/ePebFkyw0XQaUA9J0iPw="
								defaults:            "cvokGtL5j1axD9YjAc1mvd7R9+y68El394EAYTucgcM="
								templates:           "wsUFHNaZ0B8C8yCQIR1jjXk0Wz5Y5MfNNyJjte+0a6s="
							}
							multi_step: {
								"HM2TFIBSSOS2QI846PC0DB8S5M6R96KG2RT9VD1KKAU52JF4OTK0====": [{
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
