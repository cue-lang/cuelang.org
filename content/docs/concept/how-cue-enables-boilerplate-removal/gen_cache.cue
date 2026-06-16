package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "cgvCx8Bj7lWhvCJ8wyRyqu6nWWl+4Njscv1GL/Uyn/0="
							}
							upload: {
								"baseline input":   "fgiHJ8Kf6RvTTXyk4yg7yI7DofD+yKQWFNmw5Fo81Kc="
								"baseline output":  "Cj+edsVfoiPmapYusCf+6uzEO2FcN8Y+pyYuBgJPMy8="
								schema:             "JYCb+DRZ9L5kFP+5bmUIukpktcr0dfHW7ZXd3SwcDTo="
								"schema reupload":  "Y9xg/JtFs0cF0QuKd3of6yiFQKgL/mt3se10ALXBWGY="
								"schema output":    "tnZLCrM5cqGhoIbtsu8Ysd4XjPLHFDUHdqqG4BggB/M="
								defaults:           "9jnEBwPotEW5V8KaGEiyz6h4OvgUxL2bG4ZvAayRaow="
								"defaults output":  "hIHMuJeBT3/c5QhYVzNrhKpv4Umzzd4Kqxk0oBQ+H8E="
								name:               "7BvW7vG/CpG3G+zncEg3V/lR4uRWfIHgRD4gURYA0eE="
								"name output":      "qQi+q3ovNgCHKK895W07MY08X3ugoRPO2Ve8KjhxdrY="
								"extra app":        "pX2t+5vopOPco/6X2w+ECybPUVqDgoIvs7Lu3cat9oc="
								"extra app output": "E5YajeYodUtRPryfPmrBIxTPxE8lJF097BJTD3PZII8="
								"pre-trim source":  "5VwXXKNkVxyG7KvLaWCoU5ZrBsYWTfOhwzbkW0uZp7g="
								"post-trim alpha":  "JpkpwZ68HasgX6GvxdjC+Nvp92x9zIJIz6Zi3bQfmTk="
								"post-trim beta":   "dpCdFFnVay4rfPpOK1/+IUqu+8aDvqGrWqJXpfwdxlE="
								"post-trim gamma":  "z+6LrKd6GVTU8V02EL69ddvjMp8GQlbrzGGfMh+plsc="
								"post-trim output": "GRLwMg6s1XciPmlUfztvIwfpb0jbAzxP9Ul2sUTMrqI="
							}
							multi_step: {
								hash:       "N2LGFN3DV9G9ECOLAEM9VD8IAQJIN9HDBJO1B5E088NM1G6UJJBG===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}]
							}
						}
					}
				}
			}
		}
	}
}
