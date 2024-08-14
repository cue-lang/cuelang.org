package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-data-validation": {
					page: {
						cache: {
							upload: {
								"data: alex":                    "99Lgr9q1eJlRbbf4CLHJmjCSaZgUfp9O7UzrYYg5+JU="
								"data: bryn (broken)":           "VsKNJBLp4DLD/XYbGmUsdQPtB/JFTpp8IiuKykZVjLc="
								"data: charlie":                 "0VIY3MsvSeuocS+W8IbLGx5M91KQaK9yQ3rcyn+6uUs="
								"schema: CUE":                   "a/mhw6kliGyn3h09NMhlW0IJgL+oJ4HxBSjBSKHgfz8="
								"data: bryn (fixed)":            "M5q5Kke+i5NC9xKbXiZtXFNVzoapNQNIx+S6k0VPRjA="
								"data: alex (reminder)":         "Qhw/wGHpthxxAdXuu06gBUBMHsvU9Dkrv08M6HH+rp0="
								"data: bryn (reminder)":         "S1brTIBPwsDHTVTAEVYsfpOhUsIndFB8V63WvrnO57E="
								"data: charlie (reminder)":      "N3+QlBndv7oHcqV/X3arB98IRfDpipsOoMpg+ywRvbA="
								"schema: CUE (reminder)":        "NtrgnYG8CuA3bXrhKRW2RH3G47D1Q/SFmf9yoDGzaw0="
								"policy: CUE (too restrictive)": "4HnNAtNjpbiqWJbLVjEW7X5bv+H5orZuc/wmGFV6UqA="
								"policy: CUE (correct)":         "+YJS6NWhr1FKiEqYvkGAw3lWqlrB7NG3jB7TA2pg1oA="
								"schema.proto":                  "dAbJ3CismpA+J6HkrtjwUrsNLtsja4AunCtzn4bOct8="
								"schema.json":                   "70jx9aB1xjnLIXh2we84rCt9uTC/DOAF4kyEywJ7zmo="
								"policy.cue":                    "I4B4lWdEzk/YfobzWM6NRGrVG8IZZldx/rPV7+/agX4="
								"data.yml (broken)":             "l9e6tfr8eg7RiejqFrxI6VoJKUgreY4yKiHWv0jlr5U="
								"data.yml (fixed)":              "2WPYXmRorroPSmvZhhDeIQbYLxnaH+ohrgZOBGa/GtA="
							}
							code: {
								constraints: "FqVujvRa3oJ3NN0KFvbRZhV0Ts9nPl4qjhYp8s+fl3k="
								definition:  "TxUT4oqjrIUrgvqv/MvqeNClP5jwci40+RZ8IraPNc4="
							}
							multi_step: {
								hash:       "V6GDI67F693HBAKTELGN0I0SOKADLCOL5NEFI33LT6CRUDCDI0P0===="
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
