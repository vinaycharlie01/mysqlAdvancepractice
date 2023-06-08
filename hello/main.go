package main

import "fmt"

func minLength(s string) int {
	b := []byte(s)
	var a bool
	for i := 0; i < len(b)-1; i++ {
		if b[i] == 'A' && b[i+1] == 'B' || b[i] == 'C' && b[i+1] == 'D' {
			a = true
			b = append(b[:i], b[i+2:]...)
		}
	}
	if a == true {
		return minLength(string(b))
	} else {
		return len(b)
	}
}

func main() {
	fmt.Println(minLength("BJKDKABJ"))

}
