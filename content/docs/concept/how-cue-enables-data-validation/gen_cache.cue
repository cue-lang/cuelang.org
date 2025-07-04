package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "k2oIo6hKIfyscD4nRlkjKyrwMZQEeo0Zc2ESV7CQiB0="
								"data: bryn (broken)":           "HVbHrWh4wc3tScHJEViBHnop0YqVpPmx360Ii6K5DGE="
								"data: charlie":                 "Cj22DwCrgkA2ylCMuLA0hewS839hkvLEzsOo6JsaA6c="
								"schema: CUE":                   "7RFbr13ta6GSOP3prwhbtiOa1/V6l+2JmsiAz1WoMr4="
								"data: bryn (fixed)":            "oavlEe2/8RUtqCh3AzBOjR523XLXEsvVkG5pmAd2o04="
								"data: alex (reminder)":         "bORRKBLsldTlidYBvKiGDcksk4e8i15JjpPWX3w1A/M="
								"data: bryn (reminder)":         "jjCzCatvL9wcpxx059wXcQ1PNoT9SCxUVCf/YcLfKm8="
								"data: charlie (reminder)":      "+JwhhBsRXrMFSrphHND9JlvioOawHTdsTzdcG4Bdv+E="
								"schema: CUE (reminder)":        "DtD+Xdq1nMbaUYhsUkKqdAM9Fsg3gl1agXDn4vL1btU="
								"policy: CUE (too restrictive)": "2CdQ0P5rNXvKoLLk+MxqxfPyltjrksXviNzBXMF02cw="
								"policy: CUE (correct)":         "cgWP9jJKkwHrQfFe5hR4tRE28seDfC0QKpn6ei9qMBA="
								"schema.proto":                  "2//6jECD+jg40YE1UWXRX5W+srVST+SS8vDJpJDr4dc="
								"schema.json":                   "ubgEMpLxV1O2cnfNJt7TjXpM+QpTWeTriXX8RtbUeWY="
								"policy.cue":                    "cvLiKG3TGAoIBu7/lytiekncc6/Z35zbLwnOqXvRBL0="
								"data.yml (broken)":             "GWLnYMZmKqh5TTAGERfqXh6GB8/TQyShodLCAQ3mwh0="
								"data.yml (fixed)":              "BzFQ+0EE701a/9pW9CmBIiQNDKyEDBjCLOY42lKBHvc="
							}
							code: {
								constraints: "uqxWcAgvWD0FKsxSGy3pXyeMhknug4qq+4dDq1XoKrg="
								definition:  "AK1zkQ6YzYlvMAtQj9GiUe03tRF4EuhiubJp6ixjVuM="
							}
							multi_step: {
								hash:       "VG65MTPGVIE13GTEGLNEF5OGIF72BGBHMFCCLDFTU8LTPIFK40M0===="
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
