require './node.rb'
class LinkedList

	attr_accessor :head, :tail, :size

	def append(node)
		if @head == nil
			@head = node
			@tail = node
		else
			@tail.next_node = node
			@tail = node
		end
	end

	def prepend(node)
		if @head == nil
			@head = node
			@tail = node
		else
			node.next_node = @head
			@head = node
		end
	end

	def size()
		if @head.nil? then return 0
		else
			node = @head
			total = 1
			until node.next_node == nil
				total += 1
				node = node.next_node
			end
			return total
		end
		
	end

	def at(index)
		i = 0
		node = @head
		until i == index
			node = node.next_node
			i += 1
		end

		return node
	end

	def pop()
		if size == 1
			@head = nil
			@tail = nil
		else
			@tail = at(size - 2)
			@tail.next_node = nil
		end
	end

	def contains?(data)
		return !find(data).nil?
	end

	def find(data)
		node = @head
		i = 0
		until node == nil
			if node.value.eql? data then return i end
			node = node.next_node
			i += 1
		end
		return nil
	end

	def to_s
		node = @head
		until node == nil
			print "(" + node.value + ") -> "
			node = node.next_node
		end
		print "nil"
	end

end

linked_list = LinkedList.new

linked_list.append(Node.new("N3"))
linked_list.prepend(Node.new("N2"))
linked_list.prepend(Node.new("N1"))

p "List size: #{linked_list.size}"
p "List head: #{linked_list.head.value}"
p "List tail: #{linked_list.tail.value}"
puts
p "At index 0: #{linked_list.at(0).value}"
p "At index 1: #{linked_list.at(1).value}"
p "At index 2: #{linked_list.at(2).value}"
puts

linked_list.pop
p "List tail: #{linked_list.tail.value}"

p "At index 0: #{linked_list.at(0).value}"
p "At index 1: #{linked_list.at(1).value}"

puts
linked_list.append(Node.new("N4"))
p "At index 2: #{linked_list.at(2).value}"

puts
puts "Does my linked list contain \"N4\"?"
p linked_list.contains?("N4")
puts "Data \"Node 4\" located at node#{}: #{linked_list.find("Node 4")}"

puts
linked_list.to_s
puts