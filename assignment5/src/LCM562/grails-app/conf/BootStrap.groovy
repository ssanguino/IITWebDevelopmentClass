import LCM562.Role
import LCM562.User
import LCM562.Company
import LCM562.UserRole
import LCM562.Location
import LCM562.Report
import groovy.time.TimeCategory


class BootStrap {

    def init = { servletContext ->
        
        def LCM = new Company(name: 'LCM').save(flush: true)
        def testCompany = new Company(name: 'testCompany').save(flush: true)
        def companyNoReports = new Company(name: 'companyNoReports').save(flush: true)
        
        def location1 = new Location(name: 'IIT', address: '33th Street, Chicago', primaryCompany: LCM).save(flush: true)
        def location2 = new Location(name: 'Loop', address: 'Madison Avenue, Chicago', primaryCompany: testCompany).save(flush: true)
        def location3 = new Location(name: 'Wrigley Field', address: 'Addison Ave, Chicago', primaryCompany: LCM).save(flush: true)
        def location4 = new Location(name: 'New York', address: 'New York', primaryCompany: testCompany).save(flush: true)
        def location5 = new Location(name: 'Madrid', address: 'Madrid', primaryCompany: testCompany).save(flush: true)
        def twoYearsAgo
        def twoHoursAgo
        use (TimeCategory) {
            twoYearsAgo = 2.year.ago
            twoHoursAgo = 2.hour.ago
        }
        def report1 = new Report(name: 'report1', publicationDate: twoYearsAgo, primaryLocation: location1, filename: 'report1.pdf').save(flush: true)
        def report2 = new Report(name: 'report2', publicationDate: twoHoursAgo, primaryLocation: location2, filename: 'report2.pdf').save(flush: true)
        def report3 = new Report(name: 'report3', publicationDate: new Date(), primaryLocation: location3, filename: 'report3.pdf').save(flush: true)
        def report4 = new Report(name: 'report4', publicationDate: twoYearsAgo, primaryLocation: location3, filename: 'report4.pdf').save(flush: true)
        def report5 = new Report(name: 'report5', publicationDate: new Date(), primaryLocation: location2, filename: 'report5.pdf').save(flush: true)
        def report6 = new Report(name: 'report6', publicationDate: new Date(), primaryLocation: location4, filename: 'report6.pdf').save(flush: true)
        def report7 = new Report(name: 'report7', publicationDate: new Date(), primaryLocation: location5, filename: 'report7.pdf').save(flush: true)
        def report8 = new Report(name: 'report8', publicationDate: twoYearsAgo, primaryLocation: location5, filename: 'report8.pdf').save(flush: true)
        def report9 = new Report(name: 'report9', publicationDate: new Date(), primaryLocation: location2, filename: 'report9.pdf').save(flush: true)
        def report10 = new Report(name: 'report10', publicationDate: twoHoursAgo, primaryLocation: location2, filename: 'report10.pdf').save(flush: true)
        def report11 = new Report(name: 'report11', publicationDate: new Date(), primaryLocation: location2, filename: 'report11.pdf').save(flush: true)
        def report12 = new Report(name: 'report12', publicationDate: new Date(), primaryLocation: location4, filename: 'report12.pdf').save(flush: true)
        
        
        def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
        def userRole = new Role(authority: 'ROLE_USER').save(flush: true)

        def admin = new User(username: 'admin', password: 'secret', enabled:true, company: LCM)
        admin.save(flush: true)
        def sampleUser = new User(username: 'sampleUser', password: 'correcthorsebatterystaple', enabled:true, company: testCompany)
        sampleUser.save(flush: true)
        def sampleUser2 = new User(username: 'noreports', password: 'noreports', enabled:true, company: companyNoReports)
        sampleUser2.save(flush: true)


        UserRole.create admin, adminRole, true
        UserRole.create sampleUser, userRole, true
        UserRole.create sampleUser2, userRole, true
    }
    
    def destroy = {
    }
}
