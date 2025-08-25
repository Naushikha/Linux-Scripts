#########################################################
# Important: certbot will store certificates in config/certbot/conf as root user, they will not be visible under a normal user.

# Run below in certbot terminal >
certbot certonly --webroot -w /var/www/certbot -d cvm.naushikha.com
certbot certonly --webroot -w /var/www/certbot -d drive.naushikha.com

# You'll have to comment SSL configs in nginx when first creating certbot certs
