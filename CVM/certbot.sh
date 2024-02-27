# Install certbot
sudo apt install certbot

# Generate cert, make sure port 80 is open
sudo certbot certonly --standalone --agree-tos --register-unsafely-without-email -d freedom.naushikha.com

# Show all certs
sudo certbot certificates
