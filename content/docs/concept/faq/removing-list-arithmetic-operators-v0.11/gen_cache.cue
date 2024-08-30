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
									removed:                 "hVb+hFId97isxNNFm7eJZXOVbKr/ekj9HAUd4wreYcU="
									"cue vet":               "d3XMngpaPkyQfgkSC/b1R1N0VLqz2sfqrGyc1jJbOpY="
									"cue fix":               "6MrKtOG1JvskQZaLjNd8SifXdhTAnsc2mG18nVq8rCg="
									"cue fix: updated file": "4MnZawoR3KzKRPwsjDcMHAXpZeKvARAbROcLeei2caE="
									"references: broken":    "SmeV0nlOnS5Hj5b/VBVNf/V/XC65p/fSql290J7at1Q="
									"references: fixed":     "xI/y9+GYRE4GFJgAGxLXRJX6V6Dj+NvIoq6+pR5Wvog="
								}
								code: {
									replacements: "qxpkTZhAcFW9bt2OXZWi7S9tKIX1010arnxYgOpCN7k="
								}
								multi_step: {
									hash:       "UCVT2RP8QC65JMS0G280A033M2G5I4SGVBRIV3MD6P12S7AGV83G===="
									scriptHash: "GRJ1FCBP5280L38Q03DG0BVL8HMBV4Q7608BVUALMMDG61PO9UQ0===="
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
										doc:      ""
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
										doc:      ""
										cmd:      "cue fix list-arithmetic.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "mv list-arithmetic.cue .list-arithmetic.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "diff list-arithmetic.cue .list-arithmetic.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue vet list-arithmetic.cue"
										exitCode: 0
										output:   ""
									}, {
										doc:      ""
										cmd:      "cue eval list-arithmetic.cue"
										exitCode: 0
										output: """
												A: [1, 2, 3, 1, 2, 3]
												B: [1, 2, 3, 4, 5, 6]
												C: 7.6
												D: "O.O.X.X.X."

												"""
									}, {
										doc:      ""
										cmd:      "cue eval references.cue"
										exitCode: 0
										output: """
												x: [1, 2, 3]
												y: [4, 5, 6]
												A: [1, 2, 3, 1, 2, 3]
												B: [1, 2, 3, 4, 5, 6]

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
