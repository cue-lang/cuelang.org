package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "6khSCeVsm8KO2ObhsNVCAoZ+IbDtEPEgdA7lfhIHQjc="
								"2": "hjtJYgt4iC/+BAd0ppvt4gRhmtRjsS/hYS3nxLHWZZQ="
								"3": "A0ajhvxl0HlbufPJGsk9W6ulzgtX8m0UdtOUG4i8DRI="
								"4": "ojBL+IFSySjGBOhDfdGd8nAH6jpkFU531LenlUa6ZmI="
								"5": "DGS1JR9ZMgeRZ9LuK0GBewQFySI0pNYkcF4dsb7GYfk="
								"6": "/NeyevoBmV0OGigJ5jBSKeZF8C5ElE5MvcR45bhcD9I="
							}
							multi_step: {
								hash:       "JNQ516UO9USVG4UFV3AKF71UF1CQ1FLB9K7DD3ILS115VE3Q8BG0===="
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
