provider "google" {
  project     = "secure-proxy-308710"
}

# Bucket to store website
resource "google_storage_bucket" "website" {
  provider = google
  name     = "amit894-website"
  location = "US"
}

resource "google_storage_bucket_object" "index" {
  name    = "index.html"
  content = "Hello, World!"
  bucket  = google_storage_bucket.website.name
}

resource "google_storage_bucket_object" "not_found" {
  name    = "404.html"
  content = "Uh oh"
  bucket  = google_storage_bucket.website.name
}


# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = google_storage_bucket.website.name
  role   = "READER"
  entity = "allUsers"
}
