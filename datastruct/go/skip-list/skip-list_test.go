package skipList

import "testing"

const sampleTotal = 100000

func BenchmarkSkipList(b *testing.B) {
	sl := CreateSkipList()
	for i := 0; i <= sampleTotal; i++ {
		sl.Insert(int32(i), i+111)
	}
	b.ResetTimer()
	for i := 0; i <= b.N; i++ {
		for i := 0; i <= sampleTotal; i++ {
			sl.Find(int32(i))
		}
	}
}
