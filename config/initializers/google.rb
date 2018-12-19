GOOGLE_APPLICATION_OPTIONS = {
  type: ENV["GOOGLE_APPLICATION_TYPE"],
  project_id: ENV["GOOGLE_APPLICATION_PROJECT_ID"],
  private_key_id: ENV["GOOGLE_APPLICATION_PRIVATE_KEY_ID"],
  private_key: ENV["GOOGLE_APPLICATION_PRIVATE_KEY"],
  client_email: ENV["GOOGLE_APPLICATION_CLIENT_EMAIL"],
  scope: ["https://www.googleapis.com/auth/cloud-platform", "https://www.googleapis.com/auth/cloud-vision"]
}

GOOGLE_APPLICATION_CREDENTIALS = Google::Auth::Credentials.new(GOOGLE_APPLICATION_OPTIONS)

