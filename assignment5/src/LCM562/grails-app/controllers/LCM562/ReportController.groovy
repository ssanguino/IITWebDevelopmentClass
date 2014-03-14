package LCM562

import org.springframework.dao.DataIntegrityViolationException
import groovy.time.TimeCategory
import grails.plugins.springsecurity.Secured

class ReportController {
    def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(["ROLE_USER", "ROLE_ADMIN"])
    def index() {
        redirect(action: "list", params: params)
    }

    @Secured(["ROLE_USER", "ROLE_ADMIN"])
    def list() {
        def user = springSecurityService.currentUser
        def reports = []
        if (user.authorities.any { it.authority == "ROLE_ADMIN" }) {
            reports = Report.list(params)
        } else {
            def oneYearAgo
            use (TimeCategory) {
                oneYearAgo = 1.year.ago
            }
            def locations = Location.findAllByPrimaryCompany(user.company)
            
            locations.each{ it ->
                reports.addAll(0, Report.findAllByPrimaryLocation(it))
            }
            reports = reports.findAll{r -> r.publicationDate > oneYearAgo}
        }
        reports = reports.sort{it.publicationDate}.reverse()
        reports = reports.groupBy{it -> it.primaryLocation}
        [reportInstanceList: reports, reportInstanceTotal: reports.size]
    }
    
    @Secured(["ROLE_USER", "ROLE_ADMIN"])
    def userReports() {
        def user = springSecurityService.currentUser
        def reports = []
        if (user.authorities.any { it.authority == "ROLE_ADMIN" }) {
            reports = Report.list(params)
        } else {
            def oneYearAgo
            use (TimeCategory) {
                oneYearAgo = 1.year.ago
            }
            def locations = Location.findAllByPrimaryCompany(user.company)
            
            locations.each{ it ->
                reports.addAll(0, Report.findAllByPrimaryLocation(it))
            }
            reports = reports.findAll{r -> r.publicationDate > oneYearAgo}
        }
        reports = reports.sort{it.publicationDate}.reverse()
        reports = reports.groupBy{it -> it.primaryLocation}
        [reportInstanceList: reports, reportInstanceTotal: reports.size, name: user.username]
    }

    @Secured(['ROLE_ADMIN'])
    def create() {
        [reportInstance: new Report(params)]
    }

    @Secured(['ROLE_ADMIN'])
    def save() {   
        def webRootDir = servletContext.getRealPath("/")
        def uploadedFile = request.getFile('report')
        params.filename = uploadedFile.originalFilename
        params.publicationDate = new Date()
        def reportInstance = new Report(params)
        def locationDir = "/reports/"+reportInstance.primaryLocation.name
        def userDir = new File(webRootDir, locationDir)
        if( !userDir.exists() ) {
            userDir.mkdirs()
        }
        def newFile = new File( userDir, uploadedFile.originalFilename)
        if( !newFile.exists() ) {
            uploadedFile.transferTo( newFile )
        }
        
        if (!reportInstance.save(flush: true)) {
            render(view: "create", model: [reportInstance: reportInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'report.label', default: 'Report'), reportInstance.id])
        redirect(action: "show", id: reportInstance.id)
    }

    @Secured(["ROLE_ADMIN"])
    def show(Long id) {
        def reportInstance = Report.get(id)
        if (!reportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), id])
            redirect(action: "list")
            return
        }

        [reportInstance: reportInstance]
    }
    
    @Secured(['ROLE_ADMIN'])
    def delete(Long id) {
        def reportInstance = Report.get(id)
        if (!reportInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'report.label', default: 'Report'), id])
            redirect(action: "list")
            return
        }

        try {
            reportInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'report.label', default: 'Report'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'report.label', default: 'Report'), id])
            redirect(action: "show", id: id)
        }
    }
}
