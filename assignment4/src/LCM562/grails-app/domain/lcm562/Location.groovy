package lcm562

class Location {

    String name
    String address
    static belongsTo = [primaryCompany : Company]
    
    static constraints = {
    }
    
    String toString() {
        "$name. Owner:$belongsTo.name. Address:$address."
    }  
}
