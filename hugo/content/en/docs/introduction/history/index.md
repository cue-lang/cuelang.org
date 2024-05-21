---
title: The History of CUE
weight: 60
---

Although it is a very different language, the roots of CUE lie in GCL,
the dominant configuration language in use at Google as of this writing.
It was originally designed to configure Borg, the predecessor of Kubernetes.
In fact, the original idea was to use graph unification as used in CUE for GCL.
One of the authors of GCL had extensive experience with such systems and
experienced the benefit of being able to compute and reason with types for the
creation of powerful tooling.

The graph unification model CUE is based on
was in common use in computational linguistics at that time and was
successfully used to manage grammars and lexicons of over 100k lines of
declarative definitions.
These were effectively very large
configurations of something as irregular and complex as a human language.
A property of these systems were that the types, or constraints, one
defines validate the data while simultaneously reducing boilerplate.
Overall, this approach seemed to be extremely well-suited
for cloud configuration.

However, the early design of GCL went for something simpler that coincidentally
was also incompatible with the notion of graph unification.
This simpler approach proved insufficient, but it was already too late to
move to the earlier foreseen approach.
Instead, an inheritance-based override model was adopted.
Its complexity made the earlier foreseen tooling intractable
and they never materialized.
The same holds for the GCL offsprings that copied its model.

CUE goes back to the original idea of using a constraint-based approach and
also makes an effort to incorporate lessons learned from 15 years of GCL usage.
This also includes lessons learned from offsprings and different approaches to
configuration altogether.
