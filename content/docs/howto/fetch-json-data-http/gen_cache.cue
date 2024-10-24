package site
{
	content: {
		docs: {
			howto: {
				"fetch-json-data-http": {
					page: {
						cache: {
							upload: {
								"HIDDEN: server.go": "BbY7IHDKWd/AT0WZEWZZu13cMsTP1P0+hiR45KtpYoM="
								cc:                  "2bpn9bt4rbiyFMixOjhoDg0jr6Rsf7c2Fpwp9g85sQU="
							}
							multi_step: {
								hash:       "UPNDDGDE7K057C92RRUJPIC5F6A1R39E8AGC94OUBSJ3C779UUUG===="
								scriptHash: "HFFNH43U957JTQV8V6FJPCNFU0132TPRFDVKPL6ILOUIJKE4S4HG===="
								steps: [{
									doc:      ""
									cmd:      "export GOMODCACHE=/caches/gomodcache"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "export GOCACHE=/caches/gobuild"
									exitCode: 0
									output:   ""
								}, {
									doc: """
											# TODO: This is technically racey, but we adopt the same posture as
											# https://cuelang.org/cl/1176732: let's wait for it to actually become a
											# problem before we worry about it. That said, we do build the executable
											# before running it (instead of "go run server.go") to try and /help/ avoid an
											# HTTP connection being attempted before the server is listening.
											"""
									cmd:      "go build server.go"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "nohup ./server >/tmp/howto-fetch-json-data-http.log 2>&1 &"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "sleep 1"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "rm server"
									exitCode: 0
									output:   ""
								}, {
									doc:      ""
									cmd:      "cue cmd info"
									exitCode: 0
									output: """
											CUE version v0.8.2 was released with commit hash 596c99191ad1eb7c39d547e59bc7085751d7952b

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
