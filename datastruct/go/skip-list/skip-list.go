package skipList

import (
	"math"
	"math/rand"
	"time"
)

// MaxLevel define the max level of skip-list
const MaxLevel = 16

type skipListNode struct {
	value    interface{}
	key      int32
	forwards []*skipListNode // list of pointer point to next node in the same level
}

// SkipList define the skip-list
type SkipList struct {
	head *skipListNode // head of skip-list

	level int // the number of plies

	length int // the length of list
}

func init() { rand.Seed(time.Now().Unix()) }

func createNode(key int32, v interface{}, height int) *skipListNode {
	return &skipListNode{
		value:    v,
		key:      key,
		forwards: make([]*skipListNode, height, height),
	}
}

// CreateSkipList create skip list
func CreateSkipList() *SkipList {
	return &SkipList{
		head:   createNode(math.MinInt32, 0, MaxLevel),
		level:  1,
		length: 0,
	}
}

// Len return the len of skip-list
func (sl *SkipList) Len() int { return sl.length }

// Level return the level of skip-list
func (sl *SkipList) Level() int { return sl.level }

// Insert insert the v into skipList
func (sl *SkipList) Insert(key int32, v interface{}) int {
	if v == nil {
		return 1
	}

	// current head for skip list
	var cur = sl.head

	var update = [MaxLevel]*skipListNode{}

	// 从数组的尾部到头部,也就是跳表的高层到底层
	for i := MaxLevel - 1; i >= 0; i-- {
		// 下面的操作都是对应这一层来说的

		// 只要数组成员的对象的地址是存在的
		for ; ; cur = cur.forwards[i] {
			// 这一层已经进入尾声,进入下一层
			if cur.forwards[i] == nil || cur.forwards[i].key > key {
				update[i] = cur
				break
			}
		}
	}
	// 当前的节点最小是1
	height := 1
	for i := 1; i <= MaxLevel; i++ {
		if rand.Int31()%4 == 1 {
			height++
		}
	}

	newNode := createNode(key, v, height)

	for i := 0; i < height; i++ {
		// 更新每一层的节点
		// fmt.Println(update[i])
		// newNode.forwards[i] = update[i].forwards[i]
		// update[i].forwards[i] = newNode
		update[i].forwards[i], newNode.forwards[i] = newNode, update[i].forwards[i]
	}

	if height > sl.level {
		sl.level = height
	}

	sl.length++

	return 0
}

// Find Find value by given key
func (sl *SkipList) Find(key int32) interface{} {
	var cur = sl.head

	for i := MaxLevel - 1; i >= 0; i-- {
		for ; ; cur = cur.forwards[i] {
			if cur.forwards[i] == nil {
				break
			} else if cur.forwards[i].key == key {
				return cur.forwards[i].value
			} else if cur.forwards[i].key > key {
				break
			}
		}
	}

	return nil
}
