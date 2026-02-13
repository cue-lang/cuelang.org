package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "fYNLjTQLuF+0Joswu+9HGrGzXzze/aPwkberMRea80c="
								"initial x.cue":  "KqiJ/dKuaiLOBn4NN30o6LiwDa+wbPjksi4fEYOho/w="
								"another person": "7WYSyves1lWAH7rx5gn6TCzFOAHnG+mm3HFXM8cX8QE="
								"fixed yaml":     "w+3/0bUQeqHO5ROs7RvELpjuOzHW5KVXIcqY8AXY4z0="
							}
							multi_step: {
								hash:       "IB37BPLR0COQP0R9L265K7KMNDIOQO4EG05KH8QJ4GPTNECRLHTG===="
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
