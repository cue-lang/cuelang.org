package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "rYm/G86IHbu93QNY05euKa2mFr45SQ1YFGvkBBdEzPk="
								"data: bryn (broken)":           "lc4r0PQwHxQRpZxb+rteMipzb4MawpIAGYiZDBiEbbU="
								"data: charlie":                 "hn0YBWbn1GP+mpRpwnRqwSmGnEIjUeKRiWIireycHdI="
								"schema: CUE":                   "iax5Me/mZDh7u8MX94Ae85FvgwqRfzfSlovrUzs1+xs="
								"data: bryn (fixed)":            "QaCMZutkeGZssfdNqdTPeshTbKH0eGgad1YH8QGuOng="
								"data: alex (reminder)":         "6MbDmbgNY4KMke3M6yQprjwhyvlYQ5neXEiDU1w36G8="
								"data: bryn (reminder)":         "wI+v/VMxaK3+8NPHfndNYkHsLhjF6ZW/QaeDIl0o/AU="
								"data: charlie (reminder)":      "jmSzBGnbQyEHwtoSrMIvRd7ikKupIUyLe5WSL2b8bcQ="
								"schema: CUE (reminder)":        "ocARHOVHKbkPqWGJbE6VvELNTI/b9e6fKoDboRIeTIE="
								"policy: CUE (too restrictive)": "sUtz1zkLbsxI93t5S4mujjTRDMc7dXczI87Gx57sMwA="
								"policy: CUE (correct)":         "MNFDuP+piNruko7yZeM6brI1XcIz7tjcdqJ1X0cgkRo="
								"schema.proto":                  "JFWsuvpob1cjtHVI9kJVmE6xdXAJfwfHNBhWWGtSQrs="
								"schema.json":                   "eV4fjaStvkeuRWaIF0MDSu6fNqj6XvLv7aPK3jKctqY="
								"policy.cue":                    "6/OHAW4bV/PoYWwJKhT4qFg0CWNsi/YErFsmm0a616U="
								"data.yml (broken)":             "ODKPa0vb5qIm6G2deVDM/JDatAqYQa3Cc9hFclnEgfw="
								"data.yml (fixed)":              "oBrBiXBSzn1Yiijd+wokBUwpqsHtxX7FsddKvfoT0w8="
							}
							code: {
								constraints: "B3VMJfhWQJWZ3Cn79SrBxcqEKy0SYd4a6oS/sJGkuQk="
								definition:  "xZpa0W+kxmCp2lQQjZnh66VE9EB0/TaFEp+Wfvj6vk8="
							}
							multi_step: {
								hash:       "UFAABGCEM5JBSTH5Q0RSA9HJN4H9C60PSC44289C9P0P14BKDL70===="
								scriptHash: "5IRU0HUMAKN4O1TE41F2439MMECK8AS890TU89R3REV16HVJRUN0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 1
									output: """
											height: conflicting values "2" and int (mismatched types string and int):
											    ./bryn.json:4:15
											    ./schema.cue:5:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
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
									cmd:      "cue vet . alex.json bryn.json charlie.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm -f *.cue *.yml *.yaml *.json"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
											anInt: invalid value 5 (out of bound >99.0):
											    ./policy.cue:9:10
											    ./data.yml:2:8
											aString: invalid value "Doesn't start with 'Multiplication', and doesn't contain the square of anInt" (out of bound =~"^Multiplication"):
											    ./schema.json:9:21
											    ./data.yml:1:10
											    ./policy.cue:6:12
											    ./schema.proto:2:3

											"""
								}, {
									doc:      ""
									cmd:      "cue vet policy.cue schema.proto schema.json data.yml -d '#ExampleType'"
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
