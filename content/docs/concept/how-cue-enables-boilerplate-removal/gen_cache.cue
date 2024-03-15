package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "qac6u/7jT/u5JuunGfoYLm7BUrizh3CGggXO+E5CK64="
								"app-2.cue":  "fRBjhBQRVEweWxuTm77WwQo/65PgmHZVARiWnowKozY="
								"app-3.cue":  "eaXt8xsRrqke/uW2KEix/QV8fqpL/Ep1mGOznOEB6Xg="
								"policy.cue": "gVkk2WhYvBA8lu9QYP68fqWypI4GS10ZVB8wyLNag/k="
							}
							code: {
								"order-irrelevance": "c+nl4EnPRXf4IUZoKO5tDtpBoBJILUv6kkEyo3l1XjA="
								defaults:            "UX8XVyRVCsJfEJ8TJVR0XqUzn9A+SeQ7DXGz9+5WsvE="
								templates:           "HoPgPe5TsdWAGbJH294WzxiJQv/WMgMSyTQfYNCOb5M="
							}
							multi_step: {
								"R2D6IRL5578SE55DIJ481SBBLOQMLDG1O93NR54TKSOUVT1GQCL0====": [{
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
