class HashTable
    attr_accessor :storage, :buckets, :size

    def initialize
      @storage = []
      @buckets = 8
      @size = 0
    end

    def hash(str)
      hash = 5381

      str.split("").each do |i|
          char = i
          hash = ((hash << 5) + hash) + char.ord
      end

      return hash % self.buckets
    end

    def insert(key, value)
      index = self.hash(key)

      if self.storage[index] == nil
        p "test"
        self.storage[index] = []
        self.storage[index].push([key, value])
        self.size += 1
      else
        bucket = self.storage[index]
        self.storage.map do |i|
          if i[0] == key
            i[1] = value
            return
          end
        end
        bucket.push([key, value])
        self.size += 1
      end
    end

    def delete(key)
      var index = self.hash(key)

      if self.storage[index] == nil
        puts "Key not found"
        return
      else
        bucket = self.storage[index]
        bucket.map do |i|
        if i[0] == key
            temp = i[1]
            bucket.delete(i)
            self.size -= 1
            return temp
        else
           puts "Key not found"
        end
      end
    end
  end
end


table = HashTable.new

table.insert('key', 6)
table.insert('value', 11)
table.insert('hat', 9)
table.insert('alligator', 12)
table.insert('crocodile', 30)

p table.storage
