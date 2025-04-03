package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "D8tSs1t/R1EcNocVJzYecX4nAzjs+a/KLXcUfIvdxek="
								"2": "+2/3cjswodiAnJ6iAFif5sUmSt+Uker9OEpRnrrEN1A="
								"3": "O+2cYwWRLBSeLUhdJF/krCRx3TkL6kpCCGGT3nU7ORA="
								"4": "5OQR8aqvEmWjO89Skojw0FZalcQr4CuHCdKnxoIqPso="
								"5": "5UbVP2MmxiCRm/0ys2GfNX7Zbl2qDPX3wppo7WjiX7Y="
								"6": "cVFjQ8gcRrIyoWnff65uY0BDM832F/OqRxfly8fpGj4="
							}
							multi_step: {
								hash:       "O3TI330FJGKL5OQ5UCD70S0SK14GKMGMIPQ6MKPNPI6RNO73BK4G===="
								scriptHash: "8T5T0B0K6S3NGIIOLM9255HN4DPN78BO9MK4UGDNESVR2HJLV9MG===="
								steps: [{
									doc: """
											# Actual command in CUE-By-Example guide:
											# cue cmd dump
											"""
									cmd:      "cue cmd dump | head -20 >6.actual.txt"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "diff 6.expected.txt 6.actual.txt"
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
