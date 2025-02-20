package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "PmYZbeiLrodxipkl/YBs6hJJTU74YRiai8xxw4Uhz40="
								"2": "Gky2V0KLG2UhD/rrLRvqfWtnS4TfMKglblKJn3YnWfk="
								"3": "lFtbGIOg79SgLjp8dcDoMV313/mCARkqQAxulVOej7g="
								"4": "5zQ7yRhn2ylstjfAw2JMpjzmFmiK14IkfjMwbHDNblA="
								"5": "u2ZMbjmIYcQsfyRWnNQDxmhBOf295TcgVss7uqx+Cio="
								"6": "xHnmKDS0phgs1PFxNrQITKNh41Zr9jD89tk4N6jXkxc="
							}
							multi_step: {
								hash:       "87C21687TR2NRM91QRKGNJ6KTHM90FF41C9TMCHQ12982077KAH0===="
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
