package site
{
	content: {
		docs: {
			concept: {
				"how-cue-enables-boilerplate-removal": {
					page: {
						cache: {
							code: {
								"intro: references": "GDFVm+IAaANH7vy/eLzat2QeofFjJurVxg70jtWwl30="
							}
							upload: {
								"baseline input":   "wtXa+Bh7kLtUL2onAHIbaJqXHd5nIJzxGc0dO7L2IhY="
								"baseline output":  "9MQUybGGczm58WKojkwUoYaPr3S8/VeJFVyrhd1c3is="
								schema:             "HCwfbWNaLwUa2iku8oRaSNi72NpGRI7a7gLGrhwq19I="
								"schema reupload":  "lCclzhy+54ZuahSpa9k2+8wTPrXQByR12RWc3tq7F10="
								"schema output":    "M1RsIGh6EDWvrWBGWEQM4d1CF+YRDOjWB5Jd4yiPxTs="
								defaults:           "SnbNbNGi+1JAthtjbLZxjadoWPk41c88Byd7B0P6e40="
								"defaults output":  "LA+Sp0gg6GeP5clW4INFf+oo0xJF4eJBcPko6O21voA="
								name:               "+dcUtrnD6fSOcdnifdc4kfEDQKzaTSDqd/nQpuDIpBw="
								"name output":      "eofSqU3VzMDKGShjp/NeY4XZD0hiTF8xGrnkvDolJ/4="
								"extra app":        "dG86rRxiOLoAwoN68y9lj2iWuWF9OCpfEnhQQ3t3z6Q="
								"extra app output": "i16AEpI/SXOaaiDsLlkpmklXfhJFIKkLqkd+2Cg2j98="
								"pre-trim source":  "224xBSApnaSNgZbuw+RNb8uXezlCfCKKe2Olb1DrERI="
								"post-trim alpha":  "t7xOEq5ayrNRLxSsFLYjByj+wNC9ATw+4vJY0i4KTbI="
								"post-trim beta":   "tOIQp224rDmMVJD9iSvubnhxfVPRu6/1V7MN68GkjHA="
								"post-trim gamma":  "XA0Z0Eks70QYd3NeOOGM3LC2hpZyfRA/WwNPXaYup78="
								"post-trim output": "5vAjH9UE/upQovk0SaYW7k4i54cwXagi2/EiOkhDDco="
							}
							multi_step: {
								hash:       "M5QC3BN8FJ29LHO0FC24UDSDOF50J9L5H3DKCAUS7VFLDPVUDL7G===="
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
