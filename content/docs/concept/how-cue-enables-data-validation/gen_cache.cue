package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "81V9PAucDFRZfrp6I6PmbBNTgFZFOvOrwDJisJx0U2c="
								"data: bryn (broken)":           "uWwKW0fOnx0MBzPK0fmT+gmRvY2y+ZhRAb6MB+YHD0E="
								"data: charlie":                 "s/BH1TI4iTToPDEza/gUxBa8Oc7JNZYAMKanV8gTs38="
								"schema: CUE":                   "7wwRf2NMLuvi4sWDnh4i3VQ/lpbFiwlqSP5NTR0hE90="
								"data: bryn (fixed)":            "wIinnZjGfCV3EFx+oocnlXeSf6cMikqVp/86NTbo9rA="
								"data: alex (reminder)":         "VLmHQULCiDDjJX0W+vwZIwpPMzV614emjaak5hIQpII="
								"data: bryn (reminder)":         "eMy4w1Mbe6kDTbXNegfh9AlQhZ5rup+oQb722AMnEXc="
								"data: charlie (reminder)":      "zWbmXXaki/zP0JyStWPpwM8RBnkNYIDd2TVDD1j6Ja0="
								"schema: CUE (reminder)":        "NUHIQW86z+aJWZhKdnnErETfqwQWw1JHe4qvp127u4A="
								"policy: CUE (too restrictive)": "dIeI7kromZqh567YFwlIUM/gdoW3bXyNWs8g8AFY8jU="
								"policy: CUE (correct)":         "T+8ldpRq3irKbdiyIuzwDPu0R2gWzGpX56EE8wFBoZI="
								"schema.proto":                  "B1IIc/skbj8kh0RNmhOlCo1MMYJ3ltQLC+8PV58/K/M="
								"schema.json":                   "JoKoNFSeBvwQdMvPmKMWIpM15NFxOrpR8a5IqklOXa4="
								"policy.cue":                    "mu2LJIP0+EpTav1mhfqqoXYm1GvIBjn9b6Fbj5+XRL0="
								"data.yml (broken)":             "FyGFPSWriZr6h0WjwPshPDxZACL5URZjVJfT+W+UnZw="
								"data.yml (fixed)":              "/VCv+oNIeDsOwSyNpov9m3dCVWLgFkIUSgWmseJh/Hg="
							}
							code: {
								constraints: "2eNSOv2Zp9fMQzDnHrsVqgBjv7UscCb4lYPD/xt533I="
								definition:  "bmKCi/gfZqw3cri92nsmPwZlHfjG+/GR6XxSguTJwCw="
							}
							multi_step: {
								hash:       "T01UDGK6QK3U4PP1J54FSJRHJTP4T0S9S4I7BJSOOKE8R2QFQLU0===="
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
