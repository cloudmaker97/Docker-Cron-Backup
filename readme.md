# Docker - Backup to S3

Most parts are copied from [this repository](https://github.com/peterrus/docker-s3-cron-backup) but needed some smaller modifications for my own purposes, so the use of other S3-Endpoints are full functional, so i can work with Wasabi.

### Environment Variables

- `AWS_ACCESS_KEY`
	- Get this one from your S3 Console
- `AWS_SECRET_ACCESS_KEY`
	- Get this one from your S3 Console
- `AWS_DEFAULT_REGION` 
	- e.g. `eu-central-2`
- `S3_BUCKET_URL` 
	- e.g. `s3://bucket-name/`
- `S3_ENDPOINT_URL`
	- Only when using a object storage which is not from Amazon, like Wasabi 
	- e.g. `s3.eu-central-2.wasabisys.com`
- `CRON_SCHEDULE`
	- e.g. `0 * * * *` (or see here: [crontab.guru](crontab.guru))
- `BACKUP_NAME`
	- e.g. `my-project`
- `S3_STORAGE_CLASS`
	- Default: `STANDARD`

### Using Docker-Compose

```yaml
backup:
	build .
	environment:
	  - AWS_ACCESS_KEY_ID=
	  - AWS_SECRET_ACCESS_KEY=
	  - S3_BUCKET_URL=s3://backup_bucket
	  - AWS_DEFAULT_REGION=eu-central-2
	  - S3_ENDPOINT=https://s3.eu-central-2.wasabisys.com
	  - CRON_SCHEDULE=0 * * * *
	  - BACKUP_NAME=root_folder
	volumes:
	  # First: Your volume or directory (e.g. /root)
	  # Second: This is the folder, where the folder (above) will be mounted
	  # Last: Read-Only flag, so this container can't touch anything
	  - /root:/data:ro
	restart: always
```