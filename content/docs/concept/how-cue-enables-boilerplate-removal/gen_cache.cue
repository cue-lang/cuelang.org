package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "vEDarV6LZLsgavhw4OTFBlSbU2clOE/q1OAumqS9HLo="
							}
							upload: {
								"baseline input":   "8//GhCVMtHkHAW/HNrw17HPhVniXvLbmH1/nmdC9VVw="
								"baseline output":  "/8XivTGQVRkwlA3mOjPzOS2e14tCuLB/GM2dE3go5h8="
								schema:             "UV8ZqMes5eV9+2WLX1i7J8NN0/aA7LWNSCR3X8VTSoA="
								"schema reupload":  "ohOyMJU4PM6FEjFPCnQonz7yJsdwrbSSPha3+4QQ96k="
								"schema output":    "njJXIO8lWLUYy7I3e95AJ0MxHol+CaMXuLX7fQI7zug="
								defaults:           "mkmcF1B3oo8s3wUxhiGBhA78AS7a6hWsHtII7mh4HQs="
								"defaults output":  "oq1C00rf7IWvwfYNsDogJ9urpBB+WgcbEOBWS8r/dQM="
								name:               "HYwJ/G5PnO2T4k+8i1qlXwxehmTKt3pqjtdxBlf79Ro="
								"name output":      "jkopHTD+SEJfLgPYQDcMTQOhr+iEUtU+eJbmtnBLOM0="
								"extra app":        "2pmVxs5C/FMq4M1M/N6CS98MKb8Rpga57XWVSHQYGcA="
								"extra app output": "dzKuCrfRaz29iZpGP4hYCjfJvPLxf7+P0Ho9vCZXHO0="
								"pre-trim source":  "EB8eO8FadfKF4SjZuNugIbSr7biLp4BBpote8pZ/CMY="
								"post-trim alpha":  "md3RN7Tx2W74PxjOIbfhWb+tlc0PnhEIC/6Bt/2p46k="
								"post-trim beta":   "QGecvLDVq4wW76LxEE1rL7cdAUPexpajB9vDq5camlQ="
								"post-trim gamma":  "g85v8jdSoRHR629cuAHhla64+ExqqUl12YDCx7Rs9QM="
								"post-trim output": "X+k10B1gXsMdhbyOJTrudbF3hsdoHzs4zxOPaXUZk/E="
							}
							multi_step: {
								hash:       "PP292RV4NV2GJFTCLLKQ7VUFQQRG41JKIAELLSUQSBADGN9SS9AG===="
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
