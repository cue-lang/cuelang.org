package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "bXF4T68EzDH6jI7xO2d8zNN6+mNZsAUXDYKRFghxMJo="
								"data: bryn (broken)":           "IINHZVydaGw/v4Unwex7kzuCKyK1ogmWu6N+xQ400u4="
								"data: charlie":                 "DMOn1j/d+TcEyUMZmnPUAD723QtZLdbGvT9qdmmOI6g="
								"schema: CUE":                   "fnRhNHSsdvi98liimUcHylJw8C056r63dcRV4OMReUs="
								"data: bryn (fixed)":            "j7KuDUT9kEjuwmHo8PgJP2hC/ecnmcgyvgJIIn7Gfgo="
								"data: alex (reminder)":         "0ZxqsbBdKxA78NmP0RhEUHsbF8TrmFrOcGIelB/k4lc="
								"data: bryn (reminder)":         "D7ZT5oefCehmx0e+M9Q4+PUwMG3C57cYhQ79Xh3nn9c="
								"data: charlie (reminder)":      "sMa1Fw0jtX8v2l+6zvmiVkejHTu+u9WoTBiGlWW8J+0="
								"schema: CUE (reminder)":        "1NmeZPhOXk+rPtY1SGG2FWwZGg2/cGESRgX1Sy5rb3s="
								"policy: CUE (too restrictive)": "FiIt+vGIr94m6DMfg0U4MhoIC49ROl1ugV9Gzdsr6Tw="
								"policy: CUE (correct)":         "j4lttG75j/6gvbJbWE0IcO51f1xLLUS7ETu6pUK7KDI="
								"schema.proto":                  "ASKdWgla6iEmnsEvs8EpZFpnRQ6ybsQ4O1xD+hTromQ="
								"schema.json":                   "bKa2jxvgzDRwxUQBg0LtamT9pVP4SnHcVAbZnssv7TY="
								"policy.cue":                    "GuTJ8sb19YnqB3wSlFCjnUbXyA3uFbi0Mklgg9TusjI="
								"data.yml (broken)":             "zoRgddBqQG6po7YDc5SReLdKde+tEHZS2q/UmHkjq70="
								"data.yml (fixed)":              "lTeZ+yujVBOGL267rJw7jEFewTpjckNfye1SNhY3POw="
							}
							code: {
								constraints: "BTBVvVod/dQbvxVNAmsvQeTBdyaNSKJMxNPTudAV16g="
								definition:  "VQGwja6CN1+rTI/+6sNH0Vvl8PuYJHMpOYiwlXRI0yk="
							}
							multi_step: {
								hash:       "3EPSQO0GH3TQC16842O1JONUC9CGU1DUVPIUD60LE6J3B4PRHKOG===="
								scriptHash: "I810RVUS4KMU003KOBIBKJ0OSCMTLPSLOID2M86CFKAO5BUPA5GG===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											type: 2 errors in empty disjunction:
											type: conflicting values "cat" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:18
											type: conflicting values "dog" and "goldfish":
											    ./bryn.json:3:13
											    ./policy.cue:3:10
											height: invalid value 2 (out of bound >10):
											    ./policy.cue:4:10
											    ./bryn.json:4:15

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
									exitCode: 1
									output: """
											aBool: conflicting values "this is not a boolean value" and bool (mismatched types string and bool):
											    ./data.yml:4:8
											    ./schema.proto:5:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (does not satisfy strings.Contains("25")):
											    ./policy.cue:6:12
											    ./data.yml:1:10
											    ./policy.cue:6:29
											    ./schema.json:9:21
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:21
											    ./policy.cue:9:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
