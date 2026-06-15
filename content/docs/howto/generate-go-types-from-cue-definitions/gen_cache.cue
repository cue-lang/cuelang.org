package site
{
	content: {
		docs: {
			howto: {
				"generate-go-types-from-cue-definitions": {
					page: {
						cache: {
							upload: {
								"example 1":              "dlPMcdAFT7OcXbgOf0AQ+jBRIMP2G+HsCLlHKpstILM="
								"cue_types_gen.go 1":     "8kviXfFuwDZzhNdNjzPymTHCwPfYg3k8ERP7F3mOQik="
								"example 2":              "MwK2NtQscN/P9H6VhbfpsnuOI94zNGaoXxmL90hVEpc="
								"cue_types_pet_gen.go 2": "42NmWdJ5jhUy65rCmYQ1D70OWhGofsfBFw3TYz2FV1g="
							}
							multi_step: {
								hash:       "0210RU1MVLO7R887034K4HA054LKS7Q1SVT4NGSVRK07OUSF8M3G===="
								scriptHash: "ENTKF17DD7DNV7030J6UPAS40QU1DIO156V282TQ7OB9E272PPE0===="
								steps: [{
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue exp gengotypes ."
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c # Check we've not encoded anything odd in our CUE."
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
