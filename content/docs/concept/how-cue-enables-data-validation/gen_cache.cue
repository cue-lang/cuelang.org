package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "+H+WbvahaO5PI3Llx2EksCpBL5TlUVA+kcj255QH4To="
								"data: bryn (broken)":           "WHfzQ6a94V8pXPkNOT3KdjtF7xIWUnxSPM49JKKHiuE="
								"data: charlie":                 "oPCV4EGZRsq5sWmEk/Ei03id+vJJW1x5Uz1nE9GPDYQ="
								"schema: CUE":                   "d99uAJOUfamOHBjvc5cawM6zk7w+sH+sCIoluXzH5rw="
								"data: bryn (fixed)":            "FqOLhjkT/kw+WYFbYOtVq8cdqv+9lQlwC+6nmU04aU0="
								"data: alex (reminder)":         "oxwtn7/toJEXledTUPGSAKrphEieJSiCrZmMinsKNpE="
								"data: bryn (reminder)":         "tSDew6rrV5mmQY8HOfPGNj39Kea3Lr05kz1CC4v2FTk="
								"data: charlie (reminder)":      "1qX52Kg9zI6cUe8m/cRPSfc+Y5yiBgHz8zhEupQzaLI="
								"schema: CUE (reminder)":        "p8LIPL6IP0X6XoXStUlXnK5nEE+NjICeNVg3e1zRHlA="
								"policy: CUE (too restrictive)": "4WKAvzfZnl8cgrA7cB+CDiF9MewLPQciTlsBoXligPs="
								"policy: CUE (correct)":         "Nl5pKMPZYgLTSANWHAV07eHJkz0xqZiBJTbrz3WgnsY="
								"schema.proto":                  "YmlVcV3XnTEMhAaTfTE+NvvbKE5naeavmc4THQgSlvc="
								"schema.json":                   "aRc1fy4Dgi/yDI+CK4Jk/FHiVFFfNJbgI2ZND1QQYdE="
								"policy.cue":                    "iFwculloBmXSjwLCXXvZeJxxjRA/ilPPtUYQ+9AnrHE="
								"data.yml (broken)":             "xcRMYj20fMzZPUyKEz0r8MobfLg/hnv2uRtQpxYKniA="
								"data.yml (fixed)":              "f2xx2z/0866JRvFdrZTwsXRoi1B+bei906f0Rl7XaOM="
							}
							code: {
								constraints: "Z+yEiE6DZ34/8SQ04pNuqwvkmop4bw+puM58f/7ni98="
								definition:  "snZsHsVW4MwmTs3I1ucZO+WDe85GY/sxRZ0GyLrRTlc="
							}
							multi_step: {
								hash:       "MA31CKJPKQ1SBRAECQ71S6TELP897S8SSGFD7BQ7U437OI1PBFH0===="
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
