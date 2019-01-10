package sort

import (
	"sync"
	"time"
)

func sleepSort(arr []int) []int {
	var length = len(arr)
	var sortArr = make([]int, 0, length)

	var wg sync.WaitGroup
	for _, v := range arr {
		wg.Add(1)
		go func(v int) {
			time.Sleep(time.Duration(v * length))
			sortArr = append(sortArr, v)
			wg.Done()
		}(v)
	}
	wg.Wait()
	return sortArr
}
