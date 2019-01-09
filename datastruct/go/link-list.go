package structure

// ListNode means node of list
type ListNode struct {
	next  *ListNode
	value interface{}
}

// LinkedList 链表
type LinkedList struct {
	head   *ListNode
	length uint64
}

// Remove node from list
func (l *LinkedList) Remove(v interface{}) bool {
	head := l.head

	if head.value == v {
		l.head = head.next
		return true
	}

	currentHead := head
	for {
		// 下一个节点是nil了
		if currentHead.next.next == nil {
			if currentHead.next.value == v {
				// 下一个节点是v ;找到了
				currentHead.next = nil
				return true
			}
			// 没有找到
			return false
		}

		// 正常的节点
		if currentHead.next.value == v {
			currentHead.next = currentHead.next.next
			return true
		}

		currentHead = currentHead.next
	}
}

// RemoveN remove n in list
func (l *LinkedList) RemoveN(n uint64) {
	if n < 0 {
		return
	}

	if n == 0 {
		l.head = l.head.next
	}

	currentHead := l.head
	for i := n + 1; currentHead.next != nil; i-- {
		if i == 1 {
			if currentHead.next != nil {
				currentHead.next = currentHead.next.next
			}
			break
		}
	}
}

// FindMiddleNode for list
func (l *LinkedList) FindMiddleNode() *ListNode {
	if l.head == nil || l.head.next != nil {
		return l.head
	}

	if nil == l.head.next.next {
		return l.head.next
	}

	var slow, fast = l.head, l.head

	for fast.next != nil || fast.next.next != nil {
		fast, slow = fast.next.next, slow.next
	}
	return slow
}

// Rescursion resucrsion link-list with callback
func (l *LinkedList) Rescursion(callback func(interface{})) {
	var currentHead = l.head
	for ; ; currentHead = currentHead.next {
		callback(currentHead.value)

		if currentHead.next == nil {
			break
		}
	}
}
