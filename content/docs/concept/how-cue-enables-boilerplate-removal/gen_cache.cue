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
								defaults:           "LqSXGdPOiLTKkGmQsbFO2Ri2f6GAbELOwTkboHrK+Ss="
								"defaults output":  "RiFYKbnl3ueljVoTs+T20sBTI5NPK9yZBHa2oaW0nrw="
								name:               "wivTAVlKbq5dLlyuFQhOU75h/azyfb7OF5NoI38/OE0="
								"name output":      "XFoAhIwCo8VD2DnS6ijOWZxgTsIkEROESjDgUiNkXKU="
								"extra app":        "/wro6KXTDRXDqW4qqrfIEjev5rPKQH6+uGINJMHvBdk="
								"extra app output": "CSGOsmCu+0u7B/NWscHsomA18i4dlKFGKzmO0oXml/E="
								"pre-trim source":  "QYm2of0/1vjsZpnz5BZf8Kx0E+oLEe2NomAASBIhld4="
								"post-trim alpha":  "hJIE6IFMH/mUEKu26bNfs0p8eSDHI5I9ubryVvwcodA="
								"post-trim beta":   "cjN+0IB5vDLBMSNixaCuVWnXRShxAfbT5MLWIvtmcIw="
								"post-trim gamma":  "BLRt/23pIt1ZvaYsMzxLbv0MIDSU0h6yO5SyfK+PkeM="
								"post-trim output": "+4YUr4FyK3vp/mK0WNIFWEziQhHqGnj7B3C8Vwg41cE="
							}
							multi_step: {
								hash:       "6TT6HJ8CKK46ABUIUKE81KRJ9VP586UB3N3UF3CJMLD32AN7N65G===="
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
