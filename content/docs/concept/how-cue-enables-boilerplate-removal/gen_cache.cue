package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "RO2cNkm//RTGiQPiE9J9dE7cQmpsZI2iQeqwhgZgk4I="
							}
							upload: {
								"baseline input":   "SS5GOhmJe8H5trYFNVqSEFIFHnjQg+LpybecN8BCkIA="
								"baseline output":  "uGZJ78H8FMSKmUkJ6eTee925yyyGYWUbMhLscATrFg8="
								schema:             "m+3vA8o77ikB67Bdpii9wiT+XTtMcGxtPjAFuSbVnBI="
								"schema reupload":  "4T53Zq63DjxXju7mvOsSXgRsPRocMbaGXjDW5V4Dk3M="
								"schema output":    "7oGVwXbEo98lU79cB3toCSvOZUayNy11iHi86dXXLeA="
								defaults:           "PDBQAWaZxlZ3nYI6m6KLfMSliaIgiQjCJl/vNHRaVCk="
								"defaults output":  "RiFYKbnl3ueljVoTs+T20sBTI5NPK9yZBHa2oaW0nrw="
								name:               "VSBTqDFTdnoASB46lwRAL3hvpBw+4OROE+OXUQRXHuY="
								"name output":      "XFoAhIwCo8VD2DnS6ijOWZxgTsIkEROESjDgUiNkXKU="
								"extra app":        "GJF23rb6r8ryaJ5rJPa/1a4gMO5T2qW/Yr/kd0NRfRs="
								"extra app output": "CSGOsmCu+0u7B/NWscHsomA18i4dlKFGKzmO0oXml/E="
								"pre-trim source":  "ganTgIlkzDGJzMNV2r/ytfgmtZNII2mXo0qzAvdr7WE="
								"post-trim alpha":  "hJIE6IFMH/mUEKu26bNfs0p8eSDHI5I9ubryVvwcodA="
								"post-trim beta":   "cjN+0IB5vDLBMSNixaCuVWnXRShxAfbT5MLWIvtmcIw="
								"post-trim gamma":  "BLRt/23pIt1ZvaYsMzxLbv0MIDSU0h6yO5SyfK+PkeM="
								"post-trim output": "+4YUr4FyK3vp/mK0WNIFWEziQhHqGnj7B3C8Vwg41cE="
							}
							multi_step: {
								hash:       "VLE32SSHS4NLG2JDEH9SNST92VETUP6UHNOG69JHNDPA7MIFF3P0===="
								scriptHash: "Q32ICGMIJ6L2C9CU2PVTMLI77IF1AKQOIBELF2FFSIH4RLP6H3N0===="
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
