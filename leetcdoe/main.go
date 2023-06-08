package main

import (
	"fmt"
	"strconv"
)

func countSeniors(details []string) {
	var count int
	for _, v := range details {
		val, _ := strconv.Atoi(v[11:13])
		if val > 60 {
			count++
		}
	}
	fmt.Println(count)
}

func minimizedStringLength(s string) int {
	hash := make(map[rune]struct{})
	for _, v := range s {
		hash[v] = struct{}{}
	}
	return len(hash)

}

func main() {
	// details := []string{"1313579440F2036", "2921522980M5644"}
	// countSeniors(details)
	minimizedStringLength("aaabc")
}
