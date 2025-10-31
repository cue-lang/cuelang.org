package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "fzm5S0aCB3jZV9rTdTlCzTjq7HK7Rr399NWnkFbtshI="
								"initial x.cue":  "gTj9bbbZJpEnYOh7yLJdYGbJQZipr1ReLVI+IhpDzwg="
								"another person": "tUkRCR6doGW5Dzq5bOmypfg1ecnbwQhH5Baam5VUQ/Y="
								"fixed yaml":     "3vcMhj0mgGXGpfIs7defuNvgtYvjQ2B0KfG/S9dapAc="
							}
							multi_step: {
								hash:       "L26E9Q9K7AFI6QBP25L4C0SEGRAT05M0Q0DLV21MOVN1MJEQPH60===="
								scriptHash: "C4EFM89Q7KNVBA7IOJ3DV94IERP38E0P6JP82M64M56U8OD3P5B0===="
								steps: [{
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
									exitCode: 1
									output: """
											people.Rob.age: conflicting values 42.2 and int (mismatched types float and int):
											    ./x.cue:3:11
											    ./x.cue:7:21
											    ./x.yaml:12:10

											"""
								}, {
									doc:      ""
									cmd:      "cue vet -c x.cue x.yaml"
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
