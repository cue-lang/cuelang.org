package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "nD6cn6PQsj83+6ZhUAtY1r05Hzj9heZJ9K/63nX1C+E="
								"data: bryn (broken)":           "2XJzEBXivooGaACR5cCe92v88upRxwemMbRTCVJxk5k="
								"data: charlie":                 "xFedUQmbX2F6RibxP5PQv3h2u9DYc9INdzCYrPcyHpg="
								"schema: CUE":                   "ZeSOGjsFK6DOYOpPJ8VLB4BpvBKeQ7bggS8Yopg8kss="
								"data: bryn (fixed)":            "yhsiLHfCR5hqeh1vSkt9CVRusCOKloFaqemRK9zuw6o="
								"data: alex (reminder)":         "1Acfkai/QbhYsO3J2tl+51jGel2RZP/sPrWAoWVnS7U="
								"data: bryn (reminder)":         "R6NdjlIDFnas+GR+sO0jjQ+tP+PN5lTmiGgNcCLMZL4="
								"data: charlie (reminder)":      "bL6BC75E17XHcdB9BK/I+Kt74tPuEliif7Gs2ah7858="
								"schema: CUE (reminder)":        "BFopMOeamjkbYQUYwDNp9uxujNypOAvQuHrqKd3eZKM="
								"policy: CUE (too restrictive)": "IM895XYUuLEXhFX0dY5P7i/GuI5dWNKu/ncGsuKfAdg="
								"policy: CUE (correct)":         "V4twUUPgdpFBr53eMqwGvB9XohMZPWmG9r0PDVgOdTw="
								"schema.proto":                  "JkzsVBi+Stjpgt5Gqve1Qmeyo5COqCrgn+UZm/AsDbk="
								"schema.json":                   "y3DukaoqoQPsKaduTaaBECKqpyxGGAMeBt82dY+jm9c="
								"policy.cue":                    "po/XFDYLdOJvq05uzUmnNTFgCvTA1mBZhBW6dnOmHsw="
								"data.yml (broken)":             "knxYy4JWPmnxN5l6K9nE4aoTDz/si8R+pkNjRF/nXeY="
								"data.yml (fixed)":              "+4gHaEASiVDy1OdI6TI/N+XmxGM7OxJkiztVAo8ft7I="
							}
							code: {
								constraints: "Jpthhs7WAceWH/t59d9Sw/P2W+ak5vOWXDD2lCsq49c="
								definition:  "PtmF/O6Jply4stFqydVd427LcHJgJ32c3m51c6Ve0Kw="
							}
							multi_step: {
								hash:       "I013UTKPML1K3Q7SQRDPMRMGHG6TDPN8HVG31L1TQKHEHD9HQ620===="
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
											anInt: incompatible integer bounds >99.0 and <100:
											    ./policy.cue:9:10
											    ./schema.json:14:21
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
