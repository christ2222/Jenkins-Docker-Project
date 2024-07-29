# Base image
FROM fedora

# Add metadata to the image
LABEL Engineer="Dzidzogbe Logotse"
LABEL description="This Dockerfile deploys and manages an Apache web server."

# Update the package repository and install Apache
RUN yum -y update && yum install -y httpd

# Copy the index.html file to the appropriate location in the container
COPY index.html /var/www/html/

# Set the entrypoint to start Apache HTTP server
ENTRYPOINT ["/usr/sbin/httpd"]

# Run Apache in the foreground
CMD ["-D", "FOREGROUND"]
