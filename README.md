After pushing to the master branch of the repository that uses this Github Action contents of its directories will be syncronized with corresponding Google Cloud Storage buckets.

---

For example I am now updating my home page using it. If you want to do the same see the following steps. Note that if you don't want to have a public web page and just want to use it to "git push to the bucket" you don't have to neither make your repo public nor add the AllUsers user.

1. make a public static website bucket as explained in relevant [GCP docs](https://cloud.google.com/storage/docs/hosting-static-website)
2. create a Service account without any permissions and download its key file
3. add it in the bucket's permissions settings as Object Admin (finding it by its email)
4. make a Github repo and a directory in it with the same name as your bucket (designed to be able to update multiple buckets from a single repo)
5. in the Secrets tab of repo settings add a secret named "secrets" in the folllowing format: `<bucket1 name> <base64 of the key file> <bucket2 name> <base64 of the key file> ...`
6. add a Workflow to your repo like this: https://github.com/Nakilon/www-nakilon-pro/blob/master/.github/workflows/sync_with_gcs.yaml

---

**Warning:** files that are missing from the repo will be deleted from the bucket. They'll still remain in the git history so it's dangerous only when you use this thing the first time.
