package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "iAx8BOByLE10r7M7n+gTuMdjKUxbETn31A23fQvRz+I="
								"2": "uATiwexSfP/sZnjln1Z0ya22WJ3xZ+5UEBWdRiUWt4A="
								"3": "xRompYbL6Lkw/vZPnRYxUqXdblhXIKRltsTr53ksY7Y="
								"4": "Tx9iA4uBgvCf8mq98Vd9jF8tt6YHXoUCMYQlf/AIElc="
								"5": "yW9YwG9WF0klW1UWKjGHqfVRBxYWxlzrIMwObiuFqfw="
								"6": "CDzUYA6qA1NjVfPBCpK4n91OQOalfwA/efDj0uhMgfc="
							}
							multi_step: {
								hash:       "O37SA95OA27CQ3L5CJJ43RBPRI6CJAV8VH1UEVC6RT72DS4KBJ0G===="
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
