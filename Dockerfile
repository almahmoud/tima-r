# Small image with multiple arch available
FROM r-base:latest

# Copy files
COPY paths.yaml ./paths.yaml
COPY config/default ./config/default
COPY data ./data
COPY inst ./inst

# Missing (kudos dockerfiler, see https://github.com/ThinkR-open/dockerfiler)
RUN apt-get update && apt-get install -y  libcurl4-openssl-dev libfribidi-dev libharfbuzz-dev libicu-dev libpng-dev libssl-dev libtiff-dev libxml2-dev make pandoc zlib1g-dev && rm -rf /var/lib/apt/lists/*

# R dependencies
RUN R -e 'install.packages(c("BiocManager","remotes"))'
RUN R -e 'remotes::install_github(repo = "taxonomicallyinformedannotation/tima-r", upgrade = "always", dependencies = "hard", repos = BiocManager::repositories(), build_vignettes = FALSE)'

#CMD ["--help"]
