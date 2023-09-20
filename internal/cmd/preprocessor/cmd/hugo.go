package cmd

// tabProps captures the inputs required to a code-tabs hugo output
type tabProps struct {
	Name          string
	Language      string
	Type          string
	ContentPrefix string
}

type codeTabLocation string

const (
	//lint:ignore U1000 we will use these later, documenting for completeness' sake now
	codeTabTop    codeTabLocation = "top"
	codeTabBottom codeTabLocation = "bottom"
	codeTabLeft   codeTabLocation = "left"
	codeTabRight  codeTabLocation = "right"

	codeTabTopLeft     codeTabLocation = "top-left"
	codeTabTopRight    codeTabLocation = "top-right"
	codeTabBottomLeft  codeTabLocation = "bottom-left"
	codeTabBottomRight codeTabLocation = "bottom-right"
)
