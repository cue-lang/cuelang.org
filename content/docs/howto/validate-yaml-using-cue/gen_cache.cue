package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "bmnRZlpKt6BWlTvRk+EKsTMMlLO7c8jTUoMVH5l8W3A="
								"initial x.cue":  "8noqv8jAEtjmLnd8bz3YxXJDP6OLd3+tQ68YHNzXqqo="
								"another person": "3RDU/v2L/8Ap8eX9h0JxKfpptSb2/zzwS4E3N8NOwv8="
								"fixed yaml":     "USWjym8LKArqYtk8of4G8CCy/k+aMWjv1XKAikGwhTc="
							}
							multi_step: {
								hash:       "UHFV12OUPTNKILT6B34OPVOAMC4F5JC2OHHPIIFL2SCETN3791O0===="
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
