package site
{
	content: {
		docs: {
			howto: {
				"try-aliasv2-experiment": {
					page: {
						cache: {
							upload: {
								"1 old": "T50cZM1aRN67n21zpa/1gI0nGZE1UUiLS0wCWfSwqDY="
								"1 new": "lY6xtkB8NgRUk4greCgDVq/zQUkukK54Ud3BlESI/cU="
							}
							code: {
								"2 new": "lIgXfov1bq3wEJwTDdeRf8xS3ukYTVvZCuhuEzvED5Q="
							}
							multi_step: {
								hash:       "S672NNOO8ER9I4MQE5GUCC37DLPA2LHKE7NL4PNMJAV5M3F9SG8G===="
								scriptHash: "SP5VFCRA85RJGQPIQ3CJ2G04FK8DISSGO0KCKNTO7MSP1BBRI6P0===="
								steps: [{
									doc:      ""
									cmd:      "export PATH=/cues/v0.18.0-alpha.2.0.20261002131943-93402de82790:$PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue mod init --language-version=v0.17.0 example.com"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cp current-syntax.cue experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue fix --exp=aliasv2 experimental-syntax.cue"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue export current-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

											"""
								}, {
									doc:      ""
									cmd:      "cue export experimental-syntax.cue --out yaml"
									exitCode: 0
									output: """
											-foo: 42
											b: 43
											c:
											  foo:
											    id: foo
											d:
											  e: 45
											  g: 44
											h:
											  foo:
											    i: 47
											    j: 46
											k:
											  foo:
											    m: 49
											    p: 48

											"""
								}]
							}
						}
					}
				}
			}
		}
	}
}
