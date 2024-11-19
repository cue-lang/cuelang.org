package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "LqInrrwLFd5n6cWhnyOFy2Jv/1Lf1k9pvllnw0CDqHU="
								"2": "dmpsWTPY7+GYa7ly3Z2JF+EuX7lSgKAyyMEB1uzRlg0="
								"3": "2uNgSzrIq1c49r7sJyBj1fhF5mGApbGckUKbrkZoOVs="
								"4": "qemQVQ6TQewxWTQlD+hYLcM9HSSU1nRw4ImUrSYGdG0="
								"5": "AX1Ykv2cRSKaWQWGcYehmiRMZrO4TBiEVm/DS6DnHi0="
								"6": "c7UcGWocsXa30ccYOYDwzlLPw4maBXNXlSSKfS4zjo0="
							}
							multi_step: {
								hash:       "LEFSAQM39QA8M13SN9SAK2F26IQHNSCPPIKFESH7VEUI6U0K1HBG===="
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
