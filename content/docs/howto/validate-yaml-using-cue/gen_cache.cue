package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "coaI3xhq3WXPlgeeUNMPkQjORxBrJTbJRg1HTOLndt8="
								"initial x.cue":  "jacoBz3GVvUKx2Kw6KerudDxCB4h47N0QOP8WXSxm/s="
								"another person": "tnVi3935GiN30uVRNeAoYm+Z69QlK5C1+ceOXWhRxW8="
								"fixed yaml":     "5ewHNQm8Z/pA1d1vKQsdonSNpjtlVtD78/yTZpvh+4A="
							}
							multi_step: {
								hash:       "B7F6SRUL9NSOH3V1HFNQ8VORSAA3HCMI4690EUS8LPJ7CLA14HS0===="
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
