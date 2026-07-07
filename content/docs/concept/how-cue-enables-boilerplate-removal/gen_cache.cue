package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "m9p/SX1kHJ4P8uR7WhgSWpNPanHlh1ZZfaoGLO+wWkY="
							}
							upload: {
								"baseline input":   "SdaZTAGvX/lO4kFBObYYuYI/pe3rcT364X9n1vTMfck="
								"baseline output":  "C4hGuR37T+f8GKyCUIl4iiQvgA7dqYnsSgwqv0NsdSU="
								schema:             "SwZdInjQ6QgP64lAdxtmskhgO9bSailmDZvMLXSQLTM="
								"schema reupload":  "Mj+haXI1hTcRri+pWwnAgPy0ZVEXSMNArSF5O9gUWwk="
								"schema output":    "Adr7f8rc82ZLt8tiwrQX2ubSZWmNr58WaL4pd9x3ngM="
								defaults:           "m2nF2qhG3aQI9Kq6CaU2zbuj1GikwLuXwBd4SjhcP6I="
								"defaults output":  "SlCGeMuHtm/zmdFqT2hp9gtuwxDC6mqAKSgdnci9ais="
								name:               "EaopFf7U4dp/zhRN5zg8OUrYDrle2MnEGJVEdnyMXQI="
								"name output":      "lJTW0YlkR75ulOrBpSDsrxpqGpeee/Ik7hjWMcpCaBQ="
								"extra app":        "Dsu+2IAPcsm+P056uytam6DgC3p+fx98f7IDYkIn/VA="
								"extra app output": "zsBp0LRMploQL88f6upEvLWsHBxCdTZwGNyiG67A4V4="
								"pre-trim source":  "+PyBgxYQFppsu1aYP7x89Lb6muNoP+mc//wZpjQQCzM="
								"post-trim alpha":  "+JXOi88nZeD/knUX4MfddsmxoJLtqw+k/WQ7lfQWujE="
								"post-trim beta":   "FR4LTseanxt40OKTyZduRqyfJYYQxm0H2DeoB1orMZ8="
								"post-trim gamma":  "p6uwL1fnjvmp34RiIcXH+qUY/vWCyBuLBMpSpOtgUII="
								"post-trim output": "Y9fxIMrG08mlh76AjtoFUzhbUo2cypgpHmIVq7WWgn0="
							}
							multi_step: {
								hash:       "8NMP6DHTBKNK03L355IBLI2808B82TNALBIAIGNGOOMMAHEPBGH0===="
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
