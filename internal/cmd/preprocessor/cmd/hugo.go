package cmd

// tabProps captures the inputs required to a code-tabs hugo output
type tabProps struct {
	Name     string
	Language string
	Type     string
}

type codeTabLocation string

const (
	codeTabTop    codeTabLocation = "top"
	codeTabBottom codeTabLocation = "bottom"
	codeTabLeft   codeTabLocation = "left"
	codeTabRight  codeTabLocation = "right"

	codeTabTopLeft     codeTabLocation = "top-left"
	codeTabTopRight    codeTabLocation = "top-right"
	codeTabBottomLeft  codeTabLocation = "bottom-left"
	codeTabBottomright codeTabLocation = "bottom-right"
)
