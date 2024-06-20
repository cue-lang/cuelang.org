// Welcome to CUE!
//
// Play around with CUE by typing directly into this window,
// or use the Examples menu to load some CUE.
//
// There are many examples of how to use the language on the CUE
// documentation site, https://cuelang.org/docs/, with the language
// tour being a great place to start: https://cuelang.org/docs/tour/.
//
// You can safely delete the text in this editor window - simply
// reload the page to see this message again. Happy CUEing!

// This is a comment
_greeting: "Welcome" // Hidden fields start with "_"
#project:  "CUE"     // Definitions start with "#"

message: "\(_greeting) to \(#project)!" // Regular fields are exported
