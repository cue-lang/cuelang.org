---
title: Constrain a sum of values
tags:
- constraints
---

Configuration values often have relationships to each other, with their
*individual* validity only being assessable in the context of some *collective*
characteristics.

In this FIXME:Howto Guide, you'll discover two different ways to use CUE to
constrain a set or list of numeric values, such that their sum must be less (or
greater) than some specified value.

## Choosing a method

The choice between the two different methods shown in this guide depends on how
your data is used and stored.

The first section covers some standard, simpler situations: 

- you want to include the sum as a defined field in your output data;
- you're using CUE to check the compliance of some data represented in a
  different format such as YAML or JSON.

The second section deals with the situation where your data is held in one CUE
package and is imported by another package.

## Standard situations

### A list of numbers

### A set of named fields

### All fields in a struct

## Package imports

### A list of numbers

### A set of named fields

### All fields in a struct
