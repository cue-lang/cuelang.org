package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "Xb1eJXDzErVXMJlOi3pVul3g5ntjcJJ865uDhTsKV/E="
								"2": "vXEUQhB2NtIz4DF35YrPyz3u+mJA9vkxwKWCGhlw+Mw="
								"3": "0/D+n44MlubRZ41gSVP9815L8I0DjTeC4gCcqzB38o8="
								"4": "BV9KWtELJDmPkYzH+m1noP78RqvpMZt2KsmJ56qVBrk="
								"5": "xyl9IEp/KkOXWYcHn0YRcsgxOLFB4ARGBtikc3Ct6fQ="
								"6": "81WKrpW1INAk0UAVO44kqQ17wH8/oJ7z+fxqIhmHvTI="
							}
							multi_step: {
								hash:       "AQFAE7TNVSF0E40CV3NT122JLABE9GU9A6O82S24SHB70OIG5BV0===="
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
