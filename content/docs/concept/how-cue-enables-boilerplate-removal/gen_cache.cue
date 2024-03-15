package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "2KKg4panJgU4c9fJQbyJ++wUfWPnmSYqfo6FN+iBDC0="
								"app-2.cue":  "gPEZYHnVhpbFa9S3lPO72XT7Jbj9rzI7K3QIIbU63CI="
								"app-3.cue":  "7HQ1Bfm+J+ktmxDOcCTAPBjUM+XS/2ylCkhYLL9I2QQ="
								"policy.cue": "hvuj8A6HSUBY6RMbz9P1cxpinihEdKIyoNfvzmmi98A="
							}
							code: {
								"order-irrelevance": "7+3tTYvkuRZG/9W6rrpyBrEtpB8zRi5vQ6IyQB5hBAw="
								defaults:            "iMNIl7Dfkb/NLWIRQuHyMxhftGvz60FYGvC/Q7nj1/Y="
								templates:           "m+eKJNfohv8XngpPF9sIXX7p4BdCNyBIGpZdbNam5hI="
							}
							multi_step: {
								hash:       "MHVMLCTEN44QL5TRABMGPJDPOVEVH6K1LIT09JC7C9OCLOP7J9H0===="
								scriptHash: "4FPE8BSQJH0OSR84J87Q8M5BKM5OJ9HUODPN1GVKA462C8L5Q2DG===="
								steps: [{
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

											app: foo: _

											==> app-2.cue <==
											package config

											app: bar: {
											\tport: 5555
											}

											==> app-3.cue <==
											package config

											app: baz: _

											"""
								}, {
									doc:      "# Verify that exporting the new files gives the right result:"
									cmd:      "cue export -e output --out yaml"
									exitCode: 0
									output: """
											deployments:
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
											  foo:
											    name: foo
											    port: 7777
											    id: foo.example
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
