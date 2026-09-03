package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "Mo6DPAoga0W0qRcN+Kud2/qJ68LHh/fRUXlQczYgAoA="
								"data: bryn (broken)":           "D4yFTlEqMwFqahdlm7gJbxcbJajKfd6b4ZT68IJild0="
								"data: charlie":                 "S9BrOrkcVgSwe62AhZ/HoGQKozl2WnoSocGBf5kMG5M="
								"schema: CUE":                   "DK1iWGawlJoZK2vwweWPvK9Hsr1kZiKipbZY9/JYCgU="
								"data: bryn (fixed)":            "/FUaR8mFdfc+Ft4CyZKpWk9gn18XviSDqTC0/Tv6OdA="
								"data: alex (reminder)":         "I8xLWtUCLz7exD+7hvtmAWY1xFTu102M8+sIMhoDXNU="
								"data: bryn (reminder)":         "bvZPG2n/qYs2lrwrVZgO5ABEbdAaf5mFk6oy/JRAV4g="
								"data: charlie (reminder)":      "56lYrx0OP7SK3YsFJzN9lde9GTpDrJ+0dDBypD/Bi4k="
								"schema: CUE (reminder)":        "GV5SNvX+lUXfLxmmyOjOX1fuydNej7hAsGX1l9jNy1U="
								"policy: CUE (too restrictive)": "IGJWeodpxzeRMPkRhYylJJhIu2VsxH1r2zikupyQNqE="
								"policy: CUE (correct)":         "YO/e/0ktXqvbxBoSRHCDIiZRPqsABz0dY/c/pZpfAqM="
								"schema.proto":                  "XUwUTqTiJo6AQpzZBvvZLmxVeX5bfODtY6GzE83rN/w="
								"schema.json":                   "QVHwayYh2ItNwRA+koxMFGhl/mr/bk3y2zprPvCC7yg="
								"policy.cue":                    "txBgklHd7nEbp7OY0DmuGbFw79iVl1xztrB8MS659dY="
								"data.yml (broken)":             "wBbCujLQJXfmf+zjFFvfQsm3JBNPvDN+oTv8ieNAUqE="
								"data.yml (fixed)":              "RJ7NvdofKNDEVymyGHijeTNxLFXkj4fOJ1MhRRdOw7s="
							}
							code: {
								constraints: "xQc7Kz6VVyKn5ew5/bXT9mHGFdb5/dUA8jf5zyJmNyI="
								definition:  "6wJAqk7ZM+ocxFGx7Z7ylQPjeTKvINUZZJKaFKJc4oI="
							}
							multi_step: {
								hash:       "OBP74ERAF7FJ22FEI185K2I21I667J7QIRTS3T8HTENCDQF2A510===="
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
