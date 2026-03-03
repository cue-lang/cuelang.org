package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "Bk9WLK+Dtetko8j3EvsL8elfcQyOT7Tia7Dq2X2pepw="
							}
							upload: {
								"baseline input":   "YgpzBVN3HPB4LtsY0OcWJpnn1b0A//2eg0Xfkolw3uk="
								"baseline output":  "WoEh0blOxycB1dVzs8HrJCcbVNAn7L6eNK34oPZz40g="
								schema:             "VBcWmzLPaxllVKd37OWdbArDRv/R0GJikco9yvG5rts="
								"schema reupload":  "E7UUEb1wuUn8EvT/M8lzxOvV20uNil4mXD99LolVj7w="
								"schema output":    "uiisqZ4BM58s8WLkEttiWw3DeEXd2wxaNHcAXjF8Qjg="
								defaults:           "0IfM3ygkjF2ny2vpCLWeIUVVXpbiF9+HcNaGtYXc2tg="
								"defaults output":  "lxdm8Jl7rQUcncILmKz21i0ztKuqRnQmXGF/nZFNN4g="
								name:               "LFKpWCbHAjUuDEgZ2yzQG39Ea2Epe7j56jnFg4tir8s="
								"name output":      "fBIi1IUJV6SRVhDjZPo3cfZerWGHzTdO3w1tEaGd/Qw="
								"extra app":        "THqnVqqluFDE+wCvEYqiKjLb1PJQNnH7z1JW8mXuJsw="
								"extra app output": "fBdar+YEQteklr006n5UWd5x0d6ThD/iDh6RE3BQ1Ig="
								"pre-trim source":  "g/rMvPO48eX4NjGwN8nex51Vr8Sk0X03imOPomILZ8M="
								"post-trim alpha":  "VIuwLwJAdVMlRpyMBHPwh+mg/5/LaKDgqSkLeibvyU4="
								"post-trim beta":   "N+Lwp86xfkprIqB9H1cuwr72wX8VyHDKRRejODJht6g="
								"post-trim gamma":  "Lr1ysohHuDjkL/ycVakXYCHk6+3JTwzTwx4IYjvAuRc="
								"post-trim output": "KOu3UJIpEvf8vhnuaDybMT2PeQdoboivKOclNUpuQiI="
							}
							multi_step: {
								hash:       "SCDBJN3G8NENHOG4UKUT8TJBP4R9L8V2CU7SRNU0851LU4TEKKVG===="
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
