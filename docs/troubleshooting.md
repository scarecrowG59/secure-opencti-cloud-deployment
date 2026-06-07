# Troubleshooting Notes

## OpenCTI unhealthy on startup

Common causes:

- Invalid UUID token
- Invalid encryption key
- Elasticsearch memory pressure
- Dependencies not healthy yet

Useful command:

    docker compose logs --tail=100 opencti

## Caddy returns 502

Cause:

- Caddy is reachable, but OpenCTI backend is not responding.

Check:

    curl -I http://127.0.0.1:8080
    docker compose ps
    sudo journalctl -u caddy -n 50 --no-pager

## DNS does not resolve

Check:

    nslookup <hostname>
    nslookup <hostname> 1.1.1.1
    nslookup <hostname> 8.8.8.8

Dynamic DNS providers may be blocked on some networks.

## SSH denied or timeout

Possible causes:

- Firewall still allows old public IP
- Wrong SSH key
- Wrong user
- Password authentication disabled

Check current public IP and update firewall rule if needed.
