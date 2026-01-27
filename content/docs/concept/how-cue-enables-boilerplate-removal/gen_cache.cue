package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "A5J2lBfBqTYeSRSKhXJx3T9ffmAyfnkK2d/zooecvK4="
							}
							upload: {
								"baseline input":   "nIM/S1EPd1xmdAVsVIjyD0ZFeV0L8Zwv7VZqIU+yFHA="
								"baseline output":  "zoAbv+1LtS5s8poIDBWWS6HRFbyWhgOxC5HflAPh08o="
								schema:             "t3ddON75E4KVyDLBomy9oPhl5SNrvu1H5GZAg5R5Xmo="
								"schema reupload":  "Hd05Z0rrOLqmb6xWAN/o0HPZYAno5efDVeSBEzD1Y64="
								"schema output":    "e5F/zsRdEuNrjeKtiERA4H2ErEwmVTKT/q3DQrEfI8U="
								defaults:           "OXlXgS8E08vM73agLEfQjSH5Us8icioCjDu8bF9V2Pw="
								"defaults output":  "+MC9zo/enrbXC/jkAfcZv/1lNQSgqBZUugtfU1iU/+Y="
								name:               "9amgy51l+vRxgqNERU/1tdpag9oIA5XLyHhA6pZheLg="
								"name output":      "w4MYhfDIuxwtmJg7mv/k2xf2Jf8rsKd6Ixvx9QXRs30="
								"extra app":        "7SnaQrldb0hnjLOnGSYrehtsshBa5+mepI8G2TqLIzE="
								"extra app output": "/1DcruljA7Q7t2fypRxkPO/zI0osEdLo77Evs1vxV9A="
								"pre-trim source":  "lFNlndiBPKtwVIQ1ujeO944f0DeFjNMLYaliWtrqGTE="
								"post-trim alpha":  "7FzJP5cBLLnkb8uVnfBib9ecObvGrboxPUsUJjIBdnI="
								"post-trim beta":   "zbWBF+SvBGLgiBBBjecS5zdhc5p+CFB2QuwA6aK8Obg="
								"post-trim gamma":  "tIfMkXvOn4JjseOaE8pOsAe3z1ofN7T8ZZBdWWLyMdQ="
								"post-trim output": "ITVKQHJ+NQz1eRHf5xvHP/b7OVFQDvEh0w6C/4ZCNqg="
							}
							multi_step: {
								hash:       "8U1CU0S901TGKL139S0T5AA6SNJ39QI4N0DSHI1MEG0BC3HOQEIG===="
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
