package sort

import (
	"sync"
	"time"
)

func sleepSort(arr []int) []int {
	var sortArr = make([]int, 0, len(arr))

	var wg sync.WaitGroup
	for _, v := range arr {
		wg.Add(1)
		go func(v int) {
			time.Sleep(time.Duration(v) * time.Second)
			sortArr = append(sortArr, v)
			wg.Done()
		}(v)
	}
	wg.Wait()
	return sortArr
}
