package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "EKrr0V2Z4SJllVh2jVBdHT1ZGwUF/JwMuR6vzoOKJpA="
								"initial x.cue":  "X5j3xq8PO+IHd8yHnnBTm178qKJKLNV6NNFXaXYSU2k="
								"another person": "nBX707qv4KWpV7zt4fM+LRWjl6jA/Ua4bEeAF6HqTDo="
								"fixed yaml":     "43qtaAS7E3PYnjjkfCWxFVEwbe4B36BszfXt4XybE+Y="
							}
							multi_step: {
								hash:       "8VGLQFT18IRJFIOGP5HNO9GNTLOBGOFTH113O136GA4G1UOR7TCG===="
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
