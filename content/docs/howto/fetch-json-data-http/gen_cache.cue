package site
{
	content: {
		docs: {
			howto: {
				"fetch-json-data-http": {
					page: {
						cache: {
							upload: {
								"HIDDEN: server.go": "vIj5/U+FJ+0aX/Ja7CyDImQqC5wgRJOv3VhyPM2ddMY="
								cc:                  "PU/jQ69m4V2QWEPrKWbW7Ox+M1FOkzQF/VkF6fCtJDE="
							}
							multi_step: {
								hash:       "1U1435DK5K5QHRQ5PQM5V5V26OQUO2O1F517F9ISEDTOKPNMG5K0===="
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
