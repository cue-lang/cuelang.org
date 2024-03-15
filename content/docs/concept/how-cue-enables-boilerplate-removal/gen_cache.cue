package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							upload: {
								"app-1.cue":  "MB9VcVQ2Q6FPBWFJj661hLrNVAw6E6Td0LqNz6bUhPA="
								"app-2.cue":  "Yaz6Kn9hJ95pF/mw+UXAsT0BfwjN6RFykionHI8RqvE="
								"app-3.cue":  "L2EhW4ByQuRyE/4Yywubsn/nNl9XisIbnRR2JwapuOg="
								"policy.cue": "xHL81WQE7bVbNjQHU5BhKGcC0wIhpvhe2akloyPML2k="
							}
							code: {
								"order-irrelevance": "MltrTWIqF16Do9pYqXACNOYsPSYVFu7FVs3RTpEhzg8="
								defaults:            "UlbIruCwT/1jL+vTv8l39J653y4QGqFTBQqMoNr60to="
								templates:           "29V7UsSfRM71N77r1SvyCiVcJ0hngMdYtcKHrUCprC0="
							}
							multi_step: {
								"KE8MEGLJISF7RLJO7MON5HEOLBQ5HRGCIFFHMMBDRVDM839E8JT0====": [{
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
