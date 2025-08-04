package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "oxcpmsTn/y2jbBxK04+88eMoQLvkO/EIz4YMzcLtn5U="
								"data: bryn (broken)":           "8ZNAmKHMa1/mt1684NuJ64aBq6F3EkLK4/kYrSSbLpw="
								"data: charlie":                 "likLn5NuU0+qFba0n/PuFhRH82M/UkOS3F40RqUjOY8="
								"schema: CUE":                   "zWFqagsS8h1ByEag5XZHzKPXUHTmOa8cpoUUQj0phhc="
								"data: bryn (fixed)":            "RjUDE/sB54rkI8JF7hC04WeNH36ECrjeIeJA+kL2k/8="
								"data: alex (reminder)":         "wZKElQUr40YKR0dHf9zPnzpG+IFxJwZjGQFS6apktlE="
								"data: bryn (reminder)":         "zwuzsM8N4zxzDFrae9j/ZXeEINM+1xZBn9vJF3xChH8="
								"data: charlie (reminder)":      "RYFtzBTVwVXl7MUa/LxN+lv5tAaqkIvu+yzp/S8W/V8="
								"schema: CUE (reminder)":        "wmdJIVevxctlw0TDN4S0PUTEn4Cbrl0VUKLH4Hw2sWQ="
								"policy: CUE (too restrictive)": "EpAK6qdYWaEwBN8ovxMeklJyKLo1kOnsP1Ft7yJ41LQ="
								"policy: CUE (correct)":         "PQs9ofTcm2FfRjuMpD3baCs0q2F6GTwT6yT0rYQNS9E="
								"schema.proto":                  "YOfusK55BcH6sA1V2ZTbg6ewBX7iixzDsW8gnJ/+4UU="
								"schema.json":                   "4bdBVEqLmzkiQ95qDFf3lXjfY4DumTJvX2Kx2bmwl5Y="
								"policy.cue":                    "sDjPdn4NirnMDJbRroJabXrAZ/3E+bkLXD+j0siSTxk="
								"data.yml (broken)":             "wRoKIC8JWnoPDQnsMR1JPQVUr7fozjU6ao8jb5k/Kpg="
								"data.yml (fixed)":              "fABjnGXKMFa61lICeyMZD/OX7qhZF6Z+497Sy6yNE/k="
							}
							code: {
								constraints: "sv2lHc+cvrdDqccGeh37AG/tGnp3S1BfxRv/Oj45zMg="
								definition:  "C87gbe9VkwLNoVuRiOElG8wItjA/8nwghE7v+1OgyHQ="
							}
							multi_step: {
								hash:       "33SEVKL0SCCV7VE140BAVV6F16NVCJ0RMN00TJQC165PS3T9E6MG===="
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
