package sort

import (
	"fmt"
	"math/rand"
	"testing"
	"time"
)

func init() {
	rand.Seed(time.Now().UnixNano())
}

func makeShuffleArr(length int) []int {
	var arr = make([]int, 0, length)

	for range make([]struct{}, length) {
		arr = append(arr, rand.Intn(10))
	}
	return arr
}

func TestSleepSort(t *testing.T) {
	result := sleepSort((makeShuffleArr(100)))
	fmt.Println(result)
}
