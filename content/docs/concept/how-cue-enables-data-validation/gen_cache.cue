package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "kDd4ZyChxidcJ1e+jZ5BUTLodUlwQc3gb42pCN1npuU="
								"data: bryn (broken)":           "OcK3bIZAW/f4GdPtUgUu33wPBPQ4qTajoKH16OW91ro="
								"data: charlie":                 "v2DYcMbnNEy8+q2gpcDoZgSy4jlVQdGGAqLzEAYYI1I="
								"schema: CUE":                   "2lKKtuIH0mLyAsESxOB/qshRGAFZV7RXUHSN2GiNNx8="
								"data: bryn (fixed)":            "80QA0u5q66cABDomCWSeKwyNXOvsEXNAXtzf9ZuBug8="
								"data: alex (reminder)":         "QCtEfhONpWKmsle1QUum3VFs07WXYaSdG6k0vG61Nwc="
								"data: bryn (reminder)":         "OYJ41EcpvgqBKXfgLbU1J+GyjhBZwm6/rqVtGS/LjfU="
								"data: charlie (reminder)":      "UdmCgFotGPBsQujjuxJc3INtQgG+dGLq+uuKYbBmB/Y="
								"schema: CUE (reminder)":        "PQCkZgCOyil+SA5bt/MBoJiIa6R/MFiyiZNfHadjZyM="
								"policy: CUE (too restrictive)": "sPd5DbHqLV+qe4D2vHJXqYi2tfelpG9hCqj6vWLcCS0="
								"policy: CUE (correct)":         "unAhAnN+32pPcdeFh6HRfBqzoFprLj6EppZ+J3+Dqzg="
								"schema.proto":                  "R0YekJM7rkT4BWud7YZtgZxj9vOkqBpuFuOqeJnJyEQ="
								"schema.json":                   "3xNlH0fdW817Do27vFg+ce/RU4tvoUMmpkv2IfcHncY="
								"policy.cue":                    "8MeyC8rucVbHLqZOSdb2jj9dwprxZQv+Um+3tT0EAgA="
								"data.yml (broken)":             "tdBjhyAsak5gR8khp2EppNVGTvQOGtU+YDKxSKEcpWM="
								"data.yml (fixed)":              "F3vuoAf5lXxDtL2LuyDASoGp40S3qP9M7tOf5fg4niw="
							}
							code: {
								constraints: "rhdkxG0ufzceRvj3Y+iTKBQOb0yIhcEpTC/GaSA+3iA="
								definition:  "Zd3pthsaaY6FlddXh/ej8m9cWAl49x2+/+TL++jJ5h0="
							}
							multi_step: {
								hash:       "NHLNJBAOUI9NT62HCPI9KBB3MSUTRL044KRSGPG7K6EHV5RJNHC0===="
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
