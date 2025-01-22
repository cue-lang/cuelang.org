package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "LNJN+Rk1h/CGv4DNglLvVhWVcByL9FDPg44ohMFeorA="
								"2": "+u3u1oxl6UZ+r/qqGZWw60d2mPikIJut3f4iwRYlS7E="
								"3": "2dX9YTPld7kEu7pPMErv1/mhk2ku3fcu606Y5D500QY="
								"4": "KupxmhhNPza5EMxbdybBWqZfohn6279Lem4HsXVFsv4="
								"5": "a8Vt7miYXEt9qGhWtP2oTXXbjd2c8WWpiqYEGLRHpCE="
								"6": "0sT3QdFxILkiV+ay9wp9mOpaLXNMyaCkzwyqEMiOhz8="
							}
							multi_step: {
								hash:       "GO6FT710MPKCQ3VPEEITI3EO8SQQG361KKIHS5ENO7NC69AN15BG===="
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
