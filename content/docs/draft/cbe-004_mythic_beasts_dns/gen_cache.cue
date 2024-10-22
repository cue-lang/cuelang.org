package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "/HaY9yPpPf6D44wYNkqnhFJq+6W/qF0MBI0PFgwyryQ="
								"2": "T4KajwjjcbAJ2MuxnDvKcWBBZ9EOzqh+9ttHEWNFyN8="
								"3": "ZNxb4DkvJER7RgjM9JSvPjOcm0vGOUJ7n1j9r/zVrc4="
								"4": "2jEjicaLl5WydlJz8sxQsmMQqhWhDY8xAaOhcBDY5X0="
								"5": "1bFoPHK8XfuL/rgS3h/5Hpx2V7nglRmoaEoc0KI68s8="
								"6": "pi9VLqHRj9YgE7Pw1oKgqnnvRUD6bTM1utvcxfDiG3Y="
							}
							multi_step: {
								hash:       "M1FUS1PVS46405D6OPB69OEG17H5L3I7TJMPNJDRLE6IOOFALT4G===="
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
