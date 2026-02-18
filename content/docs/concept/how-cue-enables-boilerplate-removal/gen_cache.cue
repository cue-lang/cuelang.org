package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "T9yvSNUOD0wpN2IfMAY9upuepD+YopzdhHA05TB4q6U="
							}
							upload: {
								"baseline input":   "K3nK5SKbk0vz+ea00U42FjEux5QurOJAHv8BKp1IIr0="
								"baseline output":  "ORkgzZGoFSx8xZH+YHG3VIQREFc6TC1SrWhOHSTdWRg="
								schema:             "9vA+VDWYSAHTcLhLUTHV8M3hSXinqA9ZLA3RDK1bid0="
								"schema reupload":  "zBpjmDCpcOFjHE3qT6pJu9YvqIhu676J2haTSHwb5VM="
								"schema output":    "aQWyQPAD03UD4sS792RRzxFBwzUi6rt+NVTdNKa9HdQ="
								defaults:           "LvZwi9d/RGWh+QKR7q5cgiVdwdFZInqC99T0MPq5eKo="
								"defaults output":  "XnJkK1L20jMXFRJitTot3DBfXy3PbAnJFiDZYkaT6/I="
								name:               "z8q343gB2pu8rd5VVyLwXUMOtLGrPG18i8sk1x5fD/0="
								"name output":      "BA0D3iXdWjJnyxvCb61/LI6ZT3iPUd/MT+F9DwX/rAk="
								"extra app":        "hj6I2W+vhrMq0xivb72yN3yK7+q2rLNb4GFV48L3c7k="
								"extra app output": "CrfvCuXVDAaG43UJyNTsjOww9FnI0FvBrLyhjpX9xuE="
								"pre-trim source":  "LEvfVmd75mhdZ8LYoYMhXtElmUiTRqLABMIuRF8qphY="
								"post-trim alpha":  "tPnhCQ6/tGK/vbYImf4FT+EmSYC3ov7DCMR2KAzjLgE="
								"post-trim beta":   "gJOeJXt0Ta2DOZTrrsBX2Ni4rnOYSN5XEmInDeCGsuE="
								"post-trim gamma":  "0lmUdvCWKpqRrBHpu/O3Hj91k7YCSyHmbzuWHLVstS8="
								"post-trim output": "pgcmVos31Y/OZN2l/Yj3y13ufIx/9hRx1kxtXz8dlY8="
							}
							multi_step: {
								hash:       "2VDKNT4TDKKELTEU9UIGJOH7OHINSBGOJQUUNSHN4IVM06IRSC90===="
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
