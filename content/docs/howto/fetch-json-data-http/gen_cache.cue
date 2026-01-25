package site
{
	content: {
		docs: {
			howto: {
				"fetch-json-data-http": {
					page: {
						cache: {
							upload: {
								"HIDDEN: server.go": "M1rsEitNhOQwgcpcV5KItLvdsTVxbPoQJV/35u7Swuw="
								cc:                  "b7R0Q86Nhsa1u7ZmhOCSp8J7FleCha/PlOIDBa1gKjI="
							}
							multi_step: {
								hash:       "HDMHDQIU167U5L4PF9SARB13HRRHF48GU6J9S2SA7EA8L2QVJ4V0===="
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
