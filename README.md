# Simple Elastic Cluster with Local Nginx Support

This project sets up a single-node Elasticsearch cluster (version 8.11.0) with Nginx reverse proxy support and SSL encryption. It's designed for secure, production-ready deployment with minimal configuration.

## Features

- Single-node Elasticsearch 8.11.0 cluster
- Nginx reverse proxy support
- Automatic SSL certificate management via Certbot
- Security enabled (X-Pack)
- Docker-based deployment
- Persistent data storage
- Memory optimization settings

## Prerequisites

- Docker and Docker Compose
- Nginx
- Certbot
- sudo privileges
- A domain name pointed to your server (currently configured for es.you_domain.com)

## System Requirements

- Minimum 1GB RAM (512MB allocated to Elasticsearch)
- Sufficient disk space for data persistence
- Linux-based system with systemd

## Installation

1. Clone this repository:
   ```bash
   git clone [repository-url]
   cd simple-elastic-cluster-with-local-nginx-support
   ```

2. Create a `.env` file with the following content:
   ```
   ELASTIC_PASSWORD=your_secure_password_here
   ```

3. Run the setup script:
   ```bash
   chmod +x setup-elasticsearch.sh
   ./setup-elasticsearch.sh
   ```

The setup script will:
- Configure system settings for Elasticsearch
- Verify and reload Nginx configuration
- Start the Elasticsearch container
- Set up SSL certificates using Certbot

## Configuration

### Docker Compose Configuration

The `docker-compose.yml` file contains the following key configurations:

- Elasticsearch version: 8.11.0
- Memory allocation: 512MB (configurable via ES_JAVA_OPTS)
- Exposed port: 9200
- Security features enabled:
  - API key authentication
  - Password protection
  - SSL configuration options

### System Configuration

The setup script automatically configures:
- Virtual memory settings for Elasticsearch
- Nginx configuration and SSL certificates
- Container networking

## Usage

### Accessing Elasticsearch

- URL: https://es.you_domain.com
- Username: elastic
- Password: As specified in your .env file

### Basic Health Check

```bash
curl -k -u elastic:your_password https://es.you_domain.com
```

## Security Considerations

1. The cluster has security features enabled by default:
   - Password protection
   - API key authentication
   - SSL/TLS encryption (via Nginx and Certbot)

2. Important security notes:
   - Change the default password in the .env file
   - Keep your .env file secure and never commit it to version control
   - Regularly update SSL certificates (automatic with Certbot)
   - Monitor logs for unauthorized access attempts

## Data Persistence

Elasticsearch data is persisted using Docker volumes:
- Volume name: es_data
- Mount point: /usr/share/elasticsearch/data

## Troubleshooting

1. If Elasticsearch fails to start, check:
   - System memory settings: `sysctl vm.max_map_count`
   - Docker logs: `docker logs elasticsearch`
   - Elasticsearch logs: `docker exec elasticsearch cat /var/log/elasticsearch/elasticsearch.log`

2. For SSL/Nginx issues:
   - Check Nginx logs: `sudo nginx -t`
   - Verify SSL certificate: `certbot certificates`

## Maintenance

Regular maintenance tasks:
1. Monitor disk space usage
2. Check Elasticsearch logs for errors
3. Update SSL certificates (automated by Certbot)
4. Backup the data volume as needed

## License

[Specify your license here]
