package lcm562

class UploadController {

    def index() {
        redirect(action: "show", params: params)
    }
    
    def show() { 
    }
    
    def save() {
        redirect(controller: "report", action: "list")
    }
}
