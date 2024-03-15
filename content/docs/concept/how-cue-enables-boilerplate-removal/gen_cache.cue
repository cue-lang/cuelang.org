package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"1": "+LGHG8XYRBFL0uRz+9NYlYQNnZ4ycrXDN3mq2A9tzSY="
								"2": "kM14tqLl4DM/vbBGPg4UGZr6x8ZDtGQikWoDSEt2tgA="
								"3": "CstfPGaS6Xepp4GUrpsZ8qeaBykFx7s7iyPhaEipIes="
								"4": "Y/FAt1cd0HPsEwGPvnJrqPCbK63J3WSATk7Fc/NRXeA="
								"5": "4SSQfo74kmZvaY9wr7IdpdJuIHSisw7RHMrR7chIPeU="
								"6": "5gBHmg8Vd84KOHtDJrzonxxYPD0652ze4vR0VHFo7tA="
							}
							upload: {
								"pre-trim":  "HUnwex/cus5+Ob3vz3XaazolRTFIlAd8RB2g8dg0YIE="
								"post-trim": "CsmWrTS0ncgl/PbS/UYQnJZWSFCzXsofCP/I4eXEbLc="
							}
							multi_step: {
								hash:       "FOV4EJOKIDNF24MMGMALP78S83R0QQ6M9L0QT0MVCR2ED4MPL6O0===="
								scriptHash: "M70B1Q9J9KNOI8S7ET165972CFK0MVPQ7246TIGSN7CSG3BN11H0===="
								steps: [{
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export --out yaml"
									exitCode: 0
									output: """
											app:
											  alpha:
											    name: alpha
											    memory: 512
											    port: 8080
											    security: low
											  beta:
											    name: beta
											    memory: 1024
											    port: 8080
											    security: medium
											  gamma:
											    name: gamma
											    memory: 512
											    port: 80
											    security: high

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
