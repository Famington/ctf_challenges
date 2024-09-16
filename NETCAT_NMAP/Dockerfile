FROM alpine

# Install netcat and nmap
RUN apk add --no-cache netcat-openbsd nmap

# Start the service on a non-standard port
CMD echo "Flag: ctf{nc_and_nmap_win}" | nc -l -p 8080
