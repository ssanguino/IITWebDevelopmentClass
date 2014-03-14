package LCM562

class Report {

    String name
    Date publicationDate
    static belongsTo = [primaryLocation : Location]
    String filename
    
    static constraints = {
    }
    
    String toString() {
        "$name"
    } 
}
