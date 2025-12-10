# 📂 Hass Configurator in Docker

## 🐳 Docker Compose
```bash
mkdir /opt/hass-configurator
cd /opt/hass-configurator
wget https://raw.githubusercontent.com/hasscc/configurator/refs/heads/main/docker-compose.yml

# 写入HA长效令牌(可选)
# https://www.home-assistant.io/integrations/mcp_server/#long-lived-access-tokens
echo "HC_HASS_API_PASSWORD=your_hass_access_token" > .env

docker compose up -d
```

## 🔗 Links
- https://github.com/danielperna84/hass-configurator
