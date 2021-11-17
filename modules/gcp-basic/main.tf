provider "google" {
  project     = "secure-proxy-308710"
}

# Bucket to store website
resource "google_storage_bucket" "website" {
  provider = google
  name     = "${var.prefix}-894.com"
  location = "${var.region}"

  website {
   main_page_suffix = "index.html"
   not_found_page   = "404.html"
 }

}

resource "google_storage_bucket_object" "index" {
  name    = "index.html"
  content = "<h1>This is static content coming from the Terraform</h1>"
  bucket  = google_storage_bucket.website.name
}

resource "google_storage_bucket_object" "not_found" {
  name    = "404.html"
  content = "<h1>This is error page</h1>"
  bucket  = google_storage_bucket.website.name
}


# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = google_storage_bucket.website.name
  role   = "READER"
  entity = "allUsers"
}
