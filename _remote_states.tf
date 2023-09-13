data "terraform_remote_state" "terraform_module_demo_public_modules" {
    backend = "remote"

    config = {
        hostname = "app.terraform.io"
        organization = "tarun_org"
        workspaces = {
          name = "terraform_module_demo_public_modules"
        }
    }
}
