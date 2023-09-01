resource "civo_instance" "github-action" {
    hostname = "github-action.com"
    tags = ["test", "github-action"]
    notes = "this is a note for the server"
    initial_user = "root"
    size = "g2.xsmall"
}
