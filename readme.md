# Docker - Backup to S3

Most parts are copied from [this repository](https://github.com/peterrus/docker-s3-cron-backup) but needed some smaller modifications for my own purposes, so the use of other S3-Endpoints are full functional, so i can work with Wasabi and have timezone support.

### Configuration / Guide

1. Create the `docker-compose.yml` file and edit the directory mount under `volumes`
2. Create the `.env` file (see `.env.example`) and edit it to your needs
3. Run `docker compose up -d` and wait for the next cron interval

### Environment Variables

- `TZ`
	- e.g. `Europe/Berlin` for the system timezone
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
