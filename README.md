# Zomboid-Compose

Dockerfile/docker-compose for zomboid server on Ubuntu

# Features

- Auto-mounts server/save files to `<zomboid-compose>/Zomboid`
- Auto-forwards the correct ports to the host machine
- Backs up the server every 12 hours. Directory is compressed to a gzipped tar and saved to `<zomboid-compose>/backups`

# Usage

IMPORTANT: first make sure to change ENV ADMINPASSWORD in the Dockerfile. Then to start it:

`docker-compose up --build`

Simply CTRL+C to shut it down. Restart to apply any server config changes. You can also run in detached mode to leave it up when you end your terminal session. Personally, I just use `screen` to do that.

By default the backup task runs every 12 hours, at 11:55 AM and PM. If you want to change this simply edit the `backup-cron` file before building.

# After Starting

After the first run, you should see the `<zomboid-compose>/Zomboid` directory populated with your server configs etc. Change your `Zomboid/Server/<SERVERNAME>.ini` and `Zomboid/Server/<SERVERNAME>_Sandbox.ini` to your liking

# Port Forwarding

You'll need to forward the following ports if you're behind NAT

- 8766 UDP: Steam port
- 16261 UDP: Main server connect port
- 16262-16271 TCP/UDP: Player ports. Don't know for sure if this is still required?
