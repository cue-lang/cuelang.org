package site
{
	content: {
		docs: {
			concept: {
				faq: {
					"removing-list-arithmetic-operators-v0.11": {
						page: {
							cache: {
								upload: {
									"removed behaviour":  "NyfFI1WeUxZKK4dZqorCEcxydRpu9SWntUp+eTFomng="
									"existing behaviour": "2gi8XBiobY0f6L+LkggBwMtCPFamg296pRYhmnOFV/c="
									"cue vet error":      "EL3MinbvU7NEPnlo4FXCcQyl/GirBGcRUa4wooQPMtc="
									"cue fix":            "Li+e1q5WjG30PqTPtD41YiuXbIGI9oS5AEFDL5q1ASY="
									references:           "pn3t7QM2aAgWpg/PniNVvugVBaRYjv7suno66gDzVW0="
								}
								code: {
									replacements: "uvmUs/Dw7PATeKDTPEQUOBr4B4u7yCtjTD2etmWccB4="
								}
								multi_step: {
									hash:       "SBG160NV6I8F2IDHERGINTEJ3E65E1GMT1L2DU8P7H0N8V13DGS0===="
									scriptHash: "5QGEO72E8GHG1MTI63M2ML2BVL6N00FGJ0GA6QEFANSF0QN6SD0G===="
									steps: [{
										doc:      ""
										cmd:      "export PATH=/cues/v0.11.0-0.dev.0.20240902110846-1440b9eae7fa:$PATH"
										exitCode: 0
										output:   ""
									}, {
										doc:      "#ellipsis 1"
										cmd:      "cue version"
										exitCode: 0
										output: """
												cue version v0.11.0-0.dev.0.20240902110846-1440b9eae7fa
												...

												"""
									}, {
										doc: """
												#FIXME: this will start failing when the site's
												#CUE tip is upgraded past
												#https://review.gerrithub.io/c/cue-lang/cue/+/1200221
												"""
										cmd:      "cue eval list-arithmetic.cue"
										exitCode: 0
										output: """
												A: [1, 2, 3, 1, 2, 3]
												B: [1, 2, 3, 4, 5, 6]

												"""
									}, {
										doc:      ""
										cmd:      "cue eval numbers-strings.cue"
										exitCode: 0
										output: """
												C: 7
												D: "X.X.O..O..O.."

												"""
									}, {
										doc:      "#FIXME: error after https://review.gerrithub.io/c/cue-lang/cue/+/1200221."
										cmd:      "cue vet list-arithmetic.cue | false"
										exitCode: 1
										output:   ""
									}, {
										doc: """
												#FIXME: error after https://review.gerrithub.io/c/cue-lang/cue/+/1200221.
												# The file shown above contains invalid CUE:
												"""
										cmd:      "cue vet list-arithmetic.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# \"cue fix\" is silent when it succeeds:"
										cmd:      "cue fix list-arithmetic.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# The file has been updated to use current CUE syntax:"
										cmd:      "cat list-arithmetic.cue"
										exitCode: 0
										output: """
												import "list"

												A: list.Repeat([1, 2, 3], 2)
												B: list.Concat([[1, 2, 3], [4, 5, 6]])

												"""
									}, {
										doc:      "# The CUE now evaluates correctly:"
										cmd:      "cue eval list-arithmetic.cue"
										exitCode: 0
										output: """
												A: [1, 2, 3, 1, 2, 3]
												B: [1, 2, 3, 4, 5, 6]

												"""
									}, {
										doc:      "# \"cue vet\" correctly flags the file as needing an update:"
										cmd:      "cue vet references.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# \"cue fix\" runs successfully ..."
										cmd:      "cue fix references.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      "# ... but \"cue fix\" didn't perform the updates:"
										cmd:      "cat references.cue"
										exitCode: 0
										output: """
												x: [1, 2, 3]
												y: [4, 5, 6]

												// Unsupported list arithmetic operators:
												A: x * 2 // Invalid CUE!
												B: x + y // Invalid CUE!

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
}
