package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "93Ga3LihXQPiSJXbpNA3Nv4zHNFEHVDP0eW7jZ7ZYYo="
							}
							upload: {
								"baseline input":   "r6HVrRpf3ZAuXMYl5WfTV2xjsYLZtRalUF8A6TuZRBY="
								"baseline output":  "zjH9Azt6jzOUdk7O/b5fP8ynxTazkqOnU204pntPmxA="
								schema:             "G8Dv95v4RIgphI+iO7h3laJ6kxLI14mAjHJm5DGBG2Q="
								"schema reupload":  "OighZ3S6ddtZ//JW08KqLt4M0eQYAar4BZXc+lW5Wms="
								"schema output":    "dh0XgUGqN0qynxYxDqxgEugOYJLAFzYNzNH8dhk/aPw="
								defaults:           "B7VlDCrjLEI0iMOETj4cE+v7rniv0VCxFfJedOOFtCU="
								"defaults output":  "82eNaoKU9E/MfFjT2IGuCNWxdaX7OBSum9MfXSU6H74="
								name:               "EupVkkBAU9nU3xVjcqePARRyGRvhT/iFh0DN9E8Rf+A="
								"name output":      "SzvkuGpw0WMIX1iXZ9q1sUw54AZNVnuWpcfF+FNKhXQ="
								"extra app":        "8UAaMsiyiuaTAylfqrLVvqhhtoUzVFwthPjSuIVJ2hc="
								"extra app output": "SPENXOlYOtIw/EZNo/vAmnW54AkgNrQqoXWhJ567WJY="
								"pre-trim source":  "sS3XIcATlMXh+UeHJVO8OdlqkFVt82CFO9uMw9/Qnzc="
								"post-trim alpha":  "cSc8FyMsqi/0AGAiC2kvl1vpOtKWmo+WCdMfXMgflhA="
								"post-trim beta":   "paOdsniA5lg+sxaoC4g9icD3+JtvDZWOxKQysu8Kvt4="
								"post-trim gamma":  "07InWyVw8gEJfPE8ch4NwkZOC9hH1ZF+e4PY2vzcnOQ="
								"post-trim output": "Y9LJO2bM1H9HUKxgrExYYOUfHbMhBZuhN6awT04q3Cw="
							}
							multi_step: {
								hash:       "2I47QQ5B7QTETLCB1LDSCIFDL8H5JIEGRPJALIFEJC32BFIHEIK0===="
								scriptHash: "KOHOSQ50PPFAKGQVSRD4I3Q7TU957F05QL50M7RAI9OC7ASE4J9G===="
								steps: [{
									doc:      ""
									cmd:      "cue export -o configuration.yml"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 1
									output: """
											app.alpha.port: conflicting values "8080" and int (mismatched types string and int):
											    ./a.cue:3:13
											    ./a.cue:6:12
											    ./schema.cue:6:13

											"""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue trim"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export -o configuration.yml -f"
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
