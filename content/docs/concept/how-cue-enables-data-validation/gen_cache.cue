package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "/fdMbrx8QF3oHPiErIwzhNJOuvEVlF06olrL2Kb60H8="
								"data: bryn (broken)":           "Wk+CtGNjVXsHTlUZx5/5V3uUwgFNwnxOHwLaGGN/mJg="
								"data: charlie":                 "OlIAegoeCFaBmHJPkl6f3IMW6jF5AF19yDCXGtnQs+M="
								"schema: CUE":                   "oQq6kLsY+3pWf+UNdrUYELNCAuriTn/8qnEH0DSz7Dw="
								"data: bryn (fixed)":            "ET3CaZ3gZusrkspEdLhk/ChdMkeW2ixwhAqfcTe/uBw="
								"data: alex (reminder)":         "At4f3/gszjt2TqrVERCAGQAVQvXJpAs4SZhXAzJpSkE="
								"data: bryn (reminder)":         "oViHF5qDxNEq56oM0aLjuV+PVu9oZo8rsp1QdTnXbSk="
								"data: charlie (reminder)":      "6OdE5xOR4IcaBWE3GpMSFX7skz9Mn3gx6hOcyRv2T+Q="
								"schema: CUE (reminder)":        "h3pFERF2Af892nxOKTl3hPRDfxN8P8aV5QTZa6Chz3U="
								"policy: CUE (too restrictive)": "Xc7d61pyKzSKbEinE+yhTkdwSXzA8qCMjnz/Jv/ixLo="
								"policy: CUE (correct)":         "1XfzLOE+pf2MlaLxnkSsgNfEZ46xoyHDB8mTFRnOMzY="
								"schema.proto":                  "gnydacGeplrKgCP1x0dfyMeMIaIrE7glUXFkB2Om/r8="
								"schema.json":                   "HSNr3/Qpn0wiAsk7vHO3UJle1j/Il2AV2fOpD55RwTY="
								"policy.cue":                    "cTF7GxPWX/ds6re0T+LwXS+pRCOr2ltfoUd5hjP1OVM="
								"data.yml (broken)":             "8+tU6P9jVmIw1u7aApaeYbmQfSfKm8i67zKVAusERYU="
								"data.yml (fixed)":              "Y14ZeNpJ8IT/CdHUQlSbZDm6hMLMFpCyR7k6sHjUOIo="
							}
							code: {
								constraints: "2qJdU2NtCMi0PsdY8CjmmP5jG/noML5G+ZmTI6mFOuw="
								definition:  "9jbWXAEuZ+dJAqHWEXxcU/ebiBQM0DO1WT7GHHDRWw0="
							}
							multi_step: {
								hash:       "1C340GN3J2B36MIMPF35PBT51AG6RCL2RAJ3VNKHF345HM3IQK80===="
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
											    ./schema.json:9:22
											    ./schema.proto:2:3
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:22
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3
											anInt: incompatible integer bounds >99.0 and <100:
											    ./schema.json:14:22
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
