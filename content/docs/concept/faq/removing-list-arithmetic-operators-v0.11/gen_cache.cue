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
									references:           "ZnhV9LFkR6McnvVAE8puEQTjpFGf26JpDn0RIzcJALk="
								}
								code: {
									replacements: "uvmUs/Dw7PATeKDTPEQUOBr4B4u7yCtjTD2etmWccB4="
								}
								multi_step: {
									hash:       "1EOOUBM897R574V91B9S1B5EGQ1UVU8422RGI6P8TGLC4ODQJVTG===="
									scriptHash: "KJBEVVUPS5M0GAIB0LSR0GGULUUFO9FL0P75JLOCRVULNHECT63G===="
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
										cmd:      "cue eval missing.file.cue list-arithmetic.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/missing.file.cue: stat: stat /home/runner/missing.file.cue: no such file or directory

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
										cmd:      "cue vet missing.file.cue list-arithmetic.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/missing.file.cue: stat: stat /home/runner/missing.file.cue: no such file or directory

												"""
									}, {
										doc: """
												#FIXME: error after https://review.gerrithub.io/c/cue-lang/cue/+/1200221.
												# The file shown above contains invalid CUE:
												"""
										cmd:      "cue vet missing.file.cue list-arithmetic.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/missing.file.cue: stat: stat /home/runner/missing.file.cue: no such file or directory

												"""
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
										cmd:      "cue vet missing.file.cue references.cue"
										exitCode: 1
										output: """
												could not find file /home/runner/missing.file.cue: stat: stat /home/runner/missing.file.cue: no such file or directory

												"""
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
