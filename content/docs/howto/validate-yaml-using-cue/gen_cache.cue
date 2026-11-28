package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "lgOy21nuWRLe3S/BKU5hHxfpA3eXC0PjHGHu+UIfaQw="
								"initial x.cue":  "AtDLijogyKVHqNRVX+yOu2fxf1BE9SKsI7c9sv67UC4="
								"another person": "O3FIIZqwk3ph+ZGgXU5VLmnnsacOqKn4f/Rt0dUnPPA="
								"fixed yaml":     "S/vMVm7VGVJftAHc8rZ2Y2zOO0Yr1jholDBMpmFCUxo="
							}
							multi_step: {
								hash:       "76DRT7NBSDF3KA0VL9UGU5N1BV3V4I8NKTJDD0P3PNA095KSP7IG===="
								scriptHash: "FCVR3RQM9KMC4K4253KBPI107J84GMJJJ8ULKG41E4AVUBFH6UUG===="
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
											    ./x.cue:7:25
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
