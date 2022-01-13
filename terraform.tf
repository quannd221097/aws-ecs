terraform {
    backend "s3" {
        bucket = "terraformdemonquan2210"
        key    = "state.tfstate"
    }
}