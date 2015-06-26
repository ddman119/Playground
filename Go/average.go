package main

import (
	"fmt"
)

func main() {
	xs := []float64{98, 93, 77, 82, 83}
	fmt.Println("Average:", average(xs))
}

func average(xs []float64) float64 {
	total := 0.0

	for _, value := range xs {
		total += value
	}

	return total / float64(len(xs))
}
