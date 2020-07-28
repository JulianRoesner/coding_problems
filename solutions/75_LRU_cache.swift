//Implement an LRU cache
class LRUCache {
	var capacity : Int
	var cache : [Int : Int]
	var keyStack : [Int]
    init(_ capacity: Int) {
    	self.capacity = capacity 
    	self.cache = [Int : Int]()
    	self.keyStack = Array()
    }
    
    func get(_ key: Int) -> Int {
        if let found = cache[key] {
        	if let keyStackIndex = keyStack.firstIndex(of: key){
        		keyStack.remove(at: keyStackIndex)
        		keyStack.append(key)
        	}
        	return found
        }else{
        	return -1
        }
    }
    
    func put(_ key: Int, _ value: Int) {
        if cache.count >= capacity{
        	cache.removeValue(forKey: keyStack.removeFirst())
        }

        cache[key] = value
        keyStack.append(key)
    }
}

//TESTS
var cache = LRUCache( 2 /* capacity */ );

cache.put(1, 1);
cache.put(2, 2);

var result = cache.get(1)
assert( result == 1, "Found wrong key (\(result), instead of 1")

cache.put(3, 3);    // evicts key 2

result = cache.get(2)
assert(result == -1, "Found a key, although should not have found any")      

cache.put(4, 4);    // evicts key 1

result = cache.get(1)
assert(result == -1, "Found a key, although should not have found any")   

result = cache.get(3)
assert(result == 3, "Found wrong key (\(result), instead of 3")

result = cache.get(4);      
assert(result == 4, "Found wrong key (\(result), instead of 4")
