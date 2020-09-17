require './item.rb'

class List
    attr_accessor :label
    def initialize(label)
        @label = label
        @items = []
    end

    def add_item(title, deadline, description="")
        return false if !Item.valid_date?(deadline)
        return true if @items << Item.new(title, deadline, description)
    end

    def size
        return @items.size
    end

    def valid_index?(index)
        return index >= 0 && index < self.size
    end
    
    def swap(index_1, index_2)
        return false if !self.valid_index?(index_1) || !self.valid_index?(index_2)
        @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
        return true
    end

    def [](index)
        return nil if !self.valid_index?(index)
        return @items[index]
    end

    def priority
        @items.first
    end

    def print
        puts "------------------------------------------"
        puts "                 GROCERIES"
        puts "------------------------------------------"
        puts "#{"Index".ljust(6)}| #{"Item".ljust(20)}| #{"Deadline".ljust(10)}| Done"
        puts "------------------------------------------"
        (0...self.size).each { |i| puts "#{i.to_s.ljust(6)}| #{self[i].title.ljust(20)}| #{self[i].deadline.ljust(10)}| [#{self[i].done}]"}
        puts "------------------------------------------"
    end
    
    def print_full_item(index)
        puts "------------------------------------------"
        item = self[index]
        puts "#{item.title.ljust(20)} #{item.deadline.ljust(15)} [#{item.done}]"
        puts "#{item.description}"
        puts "------------------------------------------"
    end

    def print_priority
        print_full_item(0)
    end

    def up(index, amount=1)
        return false if !self.valid_index?(index)
        tmp_ind = index
        amount.times do ||
            break if tmp_ind == 0
            self.swap(tmp_ind, tmp_ind - 1)
            tmp_ind -= 1
        end
        return true
    end

    def down(index, amount=1)
        return false if !self.valid_index?(index)
        tmp_ind = index
        amount.times do ||
            break if tmp_ind == self.size - 1
            self.swap(tmp_ind, tmp_ind + 1)
            tmp_ind += 1
        end
        return true
    end

    def sort_by_date!
        @items.sort_by!  { |item| item.deadline }
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        return false if !valid_index?(index)
        @items.delete_at(index)
        return true
    end

    def purge
        i = 0
        while i < self.size
            if @items[i].done == '✓'
                self.remove_item(i)
                next
            end
            i += 1
        end
    end
end