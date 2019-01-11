package linkedList

import (
	"fmt"
	"testing"
)

func createNode(length uint64) *LinkedList {
	var l = &LinkedList{}
	var currentNode = &ListNode{}
	l.head = currentNode
	for i := range make([]struct{}, length) {
		var next = &ListNode{}
		currentNode.value, currentNode.next, currentNode = i, next, next
	}
	return l
}

func TestLinkedList(t *testing.T) {
	l := createNode(10)
	l.Rescursion(func(v interface{}) { fmt.Println(v) })
	l.RemoveN(0)
	l.RemoveN(5)
	l.RemoveN(10)
	l.Rescursion(func(v interface{}) { fmt.Println(v) })
	fmt.Printf("%+v", l.FindMiddleNode())
	fmt.Println(l.Remove(7))
	l.Rescursion(func(v interface{}) { fmt.Println(v) })
}
