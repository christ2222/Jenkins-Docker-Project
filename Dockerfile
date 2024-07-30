# Base image
FROM ubuntu:22.04

# Add metadata to the image
LABEL Engineer="Dzidzogbe Logotse"
LABEL description="This Dockerfile deploys and manages an Apache web server."

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update the package repository and install Apache
RUN apt-get update && apt-get install -y apache2

# Copy the index.html file to the appropriate location in the container
COPY index.html /var/www/html/

# Enable Apache modules (if needed)
RUN a2enmod rewrite

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
