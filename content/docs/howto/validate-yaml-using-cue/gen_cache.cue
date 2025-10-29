package site
{
	content: {
		docs: {
			howto: {
				"validate-yaml-using-cue": {
					page: {
						cache: {
							upload: {
								"initial x.yaml": "xVk54BxLDPYBhiqkLbZMQZZMuVdTpTfeqUuOTPwoAoo="
								"initial x.cue":  "m2ZlYJhoHpe3SmZUHv9eUt7R8CMqMyYAgHsNNToUv2c="
								"another person": "iAWtuDju6Qtwk2gYsMmIEfCFs+fGtb+zbN0iZdK29+A="
								"fixed yaml":     "H4CuMSq+35erLEfQQI9YOrkFemKQnJ6TkPQOXaCpEsY="
							}
							multi_step: {
								hash:       "LI6PRI87FC1MCKT7LAETEA33Q7RC4FIUOOA6112A7EF9FP1P8BQG===="
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
