package site
{
	content: {
		docs: {
			howto: {
				"build-cue-api-java-jar": {
					page: {
						cache: {
							upload: {
								"HIDDEN: configure Maven download cache": "t4Yz0dMXCbVupdFBrZb7nVChiyYXPdRsMm28CtnZB6k="
							}
							multi_step: {
								hash:       "M992JT1MLB5FT5BFLPLLLTH2D7ON2IKCF1KOQ12LRHJIROJ7RCD0===="
								scriptHash: "O6C0QH2S63TC56QCO67JOURVGGIVEQSCQ8N1PIRC1B8TKPBLU5EG===="
								steps: [{
									doc:      ""
									cmd:      "javac --version"
									exitCode: 0
									output: """
											javac 22.0.2

											"""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "java --version"
									exitCode: 0
									output: """
											openjdk 22.0.2 2024-07-16
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn --version"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "git --version"
									exitCode: 0
									output: """
											git version 2.39.2

											"""
								}, {
									doc:      ""
									cmd:      "export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "git clone https://github.com/cue-lang/cue-api-java cue-api-java-source"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      ""
									cmd:      "cd cue-api-java-source"
									exitCode: 0
									output:   ""
								}, {
									doc:      "#ellipsis 1"
									cmd:      "git checkout 3c12bb9e9ea203d4de8308b4145e876e4b60207e"
									exitCode: 0
									output: """
											Note: switching to '3c12bb9e9ea203d4de8308b4145e876e4b60207e'.
											...

											"""
								}, {
									doc:      "#ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											...

											"""
								}, {
									doc:      "#ellipsis 5"
									cmd:      "jar --list --file target/CUE*.jar org/cuelang/libcue"
									exitCode: 0
									output: """
											org/cuelang/libcue/
											org/cuelang/libcue/cue_h$cue_newctx.class
											org/cuelang/libcue/cue_h$cue_error_string.class
											org/cuelang/libcue/cue_h$cue_compile_string.class
											org/cuelang/libcue/cue_h$cue_compile_bytes.class
											...

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
