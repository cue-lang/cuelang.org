package site
{
	content: {
		docs: {
			howto: {
				"build-cue-api-java-jar": {
					page: {
						cache: {
							multi_step: {
								hash:       "94CD5KM98J3KPJ56BRLKL11VCO8FU7U9QV0AJI19OJ5L3VJROGF0===="
								scriptHash: "EFSG917DMLO7L9E8QIJKSCDKTKUKAINTRII98POFDIBIHQE6PEF0===="
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
									doc:      "#ellipsis 1"
									cmd:      "mvn --version"
									exitCode: 0
									output: """
											\u001b[0m\u001b[0mApache Maven 3.9.8 (36645f6c9b5079805ea5009217e36f2cffd34256)
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
									doc:      "# ellipsis 0"
									cmd:      "mvn package"
									exitCode: 0
									output: """
											\u001b[0m\u001b[0m[INFO] Scanning for projects...
											[WARNING] 
											[WARNING] Some problems were encountered while building the effective model for org.cuelang:CUE:jar:0.0-devel
											[WARNING] 'dependencies.dependency.version' for org.jetbrains:annotations:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 25, column 22
											[WARNING] 'dependencies.dependency.version' for org.junit.jupiter:junit-jupiter:jar is either LATEST or RELEASE (both of them are being deprecated) @ line 31, column 22
											[WARNING] 
											[WARNING] It is highly recommended to fix these problems because they threaten the stability of your build.
											[WARNING] 
											[WARNING] For this reason, future Maven versions might no longer support building such malformed projects.
											[WARNING] 
											[INFO] 
											[INFO] --------------------------< org.cuelang:CUE >---------------------------
											[INFO] Building CUE 0.0-devel
											[INFO]   from pom.xml
											[INFO] --------------------------------[ jar ]---------------------------------
											[INFO] 
											[INFO] --- resources:3.3.1:resources (default-resources) @ CUE ---
											[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
											[INFO] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/main/resources
											[INFO] 
											[INFO] --- compiler:3.10.1:compile (default-compile) @ CUE ---
											[INFO] Changes detected - recompiling the module!
											[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
											[INFO] Compiling 14 source files to /home/runner/cue-api-java-source/target/classes
											[INFO] 
											[INFO] --- resources:3.3.1:testResources (default-testResources) @ CUE ---
											[WARNING] Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!
											[INFO] skip non existing resourceDirectory /home/runner/cue-api-java-source/src/test/resources
											[INFO] 
											[INFO] --- compiler:3.10.1:testCompile (default-testCompile) @ CUE ---
											[INFO] Changes detected - recompiling the module!
											[WARNING] File encoding has not been set, using platform encoding UTF-8, i.e. build is platform dependent!
											[INFO] Compiling 3 source files to /home/runner/cue-api-java-source/target/test-classes
											[INFO] 
											[INFO] --- surefire:3.0.0-M5:test (default-test) @ CUE ---
											[INFO] 
											[INFO] -------------------------------------------------------
											[INFO]  T E S T S
											[INFO] -------------------------------------------------------
											[INFO] Running org.cuelang.cue.CueContextTest
											[INFO] Tests run: 17, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.679 s - in org.cuelang.cue.CueContextTest
											[INFO] Running org.cuelang.cue.ValueTest
											[INFO] Tests run: 32, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.318 s - in org.cuelang.cue.ValueTest
											[INFO] Running org.cuelang.cue.AttributeTest
											[INFO] Tests run: 6, Failures: 0, Errors: 0, Skipped: 0, Time elapsed: 0.063 s - in org.cuelang.cue.AttributeTest
											[INFO] 
											[INFO] Results:
											[INFO] 
											[INFO] Tests run: 55, Failures: 0, Errors: 0, Skipped: 0
											[INFO] 
											[INFO] 
											[INFO] --- jar:3.4.1:jar (default-jar) @ CUE ---
											[INFO] Building jar: /home/runner/cue-api-java-source/target/CUE-0.0-devel.jar
											[INFO] ------------------------------------------------------------------------
											[INFO] BUILD SUCCESS
											[INFO] ------------------------------------------------------------------------
											[INFO] Total time:  9.121 s
											[INFO] Finished at: 2024-08-02T17:27:38Z
											[INFO] ------------------------------------------------------------------------
											\u001b[0m\u001b[0m
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
