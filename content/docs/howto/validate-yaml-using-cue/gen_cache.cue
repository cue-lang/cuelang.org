package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "o65EWSjRY6SVrumYgDClwN5OdBswtQxRzYysArX1RI4="
								"initial x.cue":  "MexUFjREXecKV32uU43zJVZdQyF17cc8n9Z0Wcmdz20="
								"another person": "whoAOmZlkTiegpOuu7OfJVHDsR+3hpJ8c/8kv/i0X4k="
								"fixed yaml":     "fV2ZXHik1PwjXZpVMXbXAPPQelRs1OL454skljx6pVw="
							}
							multi_step: {
								hash:       "911P9P6IIJ8F21TN57K97DJ0AN38A06EMMB93ICJ4U7IE7MUQGLG===="
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
