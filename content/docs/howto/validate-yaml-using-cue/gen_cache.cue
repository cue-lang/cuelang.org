package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "5u/VCKEmpj8P4zpsBo8VOYZaO3z7oQThoNORAErroOE="
								"initial x.cue":  "h6R6srLmvTvHrkER0+SmozeA5MmKLGLvwZDqyE7aQtE="
								"another person": "2vvqMlgPz1SPtBWecB5Sx45LSnX9Wh3SP2o4VQty1uw="
								"fixed yaml":     "HhMTurDAjc5jUajdrNdE8EEs6LZ6MWwLQHy1ZY1xMTA="
							}
							multi_step: {
								hash:       "JOUQB4D98LSCABS418DDP6A9RKMF71JGQNS2LG58KAA1TVB1OOL0===="
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
