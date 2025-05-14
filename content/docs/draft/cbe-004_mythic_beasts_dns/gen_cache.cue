package site
{
	content: {
		docs: {
			draft: {
				"cbe-004_mythic_beasts_dns": {
					page: {
						cache: {
							upload: {
								"1": "JOeSmGj7v3FhQ1H/I3nKxBB4a5TXm2i7IEoL8oUTjlY="
								"2": "qjZmVahcQVExwzrLRnVvyIc9w2F0jogYS7k6adHmYgI="
								"3": "pVCBf+TdF9hNDFXzC/ZcT5Q4vh8KUtYR1sQuwjSoDUI="
								"4": "p1plhB65bw9W63FXA+XaKd5Yhr2GG3WWxVz2JQMhl2c="
								"5": "u0k0JhfU1ZB5YVGBhTd9QXd1Fmt9K4kCZDNKB/09Qjk="
								"6": "9UwxfJNQKDttF1Af1XKaIz2P7q+SsowuD4DTKBud4N4="
							}
							multi_step: {
								hash:       "TTIVMLN6OLJIVUUQE2ME64M7MS816CJIUJ6NJ9PE2VCC4B8A97EG===="
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
