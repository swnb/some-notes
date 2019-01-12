package skipList

import (
	"fmt"
	"testing"
)

func TestSkipList(t *testing.T) {
	sl := CreateSkipList()

	var i int32
	for i = 0; i <= 10; i++ {
		sl.Insert(i, i+100)
	}

	sl.Delete(3)
	sl.Delete(4)
	sl.Delete(7)
	sl.Delete(11)

	i = 0
	for i = 0; i <= 10; i++ {
		fmt.Println(sl.Find(i))
	}
}
