provider "google" {
  project     = "secure-proxy-308710"
}

# Bucket to store website
resource "google_storage_bucket" "website" {
  provider = google
  name     = "amit894-website"
  location = "US"
}

# Make new objects public
resource "google_storage_default_object_access_control" "website_read" {
  bucket = google_storage_bucket.website.name
  role   = "READER"
  entity = "allUsers"
}
